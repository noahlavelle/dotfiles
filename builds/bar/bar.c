#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <syslog.h>
#include <string.h>
#include <fcntl.h>

#include "config.h"

static void draw_bar();
static char * get_module_value();
static void update_module();

char *module_values[MODULES_COUNT];

// Sets the bar value using xsetroot so it is displayed in DWM
void draw_bar()
{
    char bar[256];
    strcpy(bar, "");
    char update_command[256];
    // Loop through each bar module and add the coloured value to "bar"
    for (int i = 0; i < MODULES_COUNT; ++i) {
        char module[256];
        sprintf(module, "^c%s^%s^d^ | ", modules[i][1], module_values[i]);
        strcat(bar, module);
    }

    // Draw the bar variable to the dwm bar
    sprintf(update_command, "xsetroot -name \"%s\"", bar);
    system(update_command);
}

// Updates the value in the module_values variable
void update_module(int module_index) {
    char *command = malloc(100);
    sprintf(command, "%s/%s.sh", SCRIPTS_PATH, modules[module_index][2]);

    FILE *fp;
    char output[200];

    fp = popen(command, "r");
    fgets(output, sizeof(output), fp);
    pclose(fp);

    strcpy(module_values[module_index], output);
    free(command);
}

void termination_handler(int sig_num) {
    for (int i = 0; i < MODULES_COUNT; ++i) {
        free(module_values[i]);
    }
    exit(sig_num);
}

int main(int argc, char *argv[])
{
    signal(SIGINT, termination_handler);

    int fd;
    char buff[BUFFSIZE];

    // Assign default values to modules
    for (int i = 0; i < MODULES_COUNT; ++i) {
        module_values[i] = malloc(100);
    }
    
    if (argc == 1) {
        // Acts the server by monitoring named pipe to perform
        // the requested updates

        // Open named pipe 
        mkfifo(PIPE_PATH, 0666);
        if ((fd = open(PIPE_PATH, O_RDONLY)) < 0) {
            printf("ERROR when opening the named pipe\n");
            exit(1);
        }

        // Update bar whenever named pipe is changed
        while (1) {
            while(read(fd, buff, BUFFSIZE)) {
                char *token;
                token = strtok(buff, "\n");
                while (token) {
                    for (int i = 0; i < MODULES_COUNT; ++i) {
                        if (strcmp(modules[i][0], token) == 0) {
                            update_module(i);
                        }
                    }
                    token = strtok(0, "\n");
                }
                draw_bar();
            }
        }
        close(fd);

    } else if (argc == 2) {
        // Used to keep module values updated and to update
        // them from anywhere (like from hooks)
        mkfifo(PIPE_PATH, 0666);
        if ((fd = open(PIPE_PATH, O_WRONLY)) < 0) {
            printf("ERROR when opening the named pipe");
            exit(1);
        }

        if (strcmp(argv[1], "all") == 0) {
            // Update all interval based modules in a loop
            int interval = 0;
            while (1) {
                for (int i = 0; i < MODULES_COUNT; ++i) {
                    int module_interval = atoi(modules[i][3]);
                    if (interval == 0 || module_interval && interval % module_interval == 0) {
                        write(fd, modules[i][0], strlen(modules[i][0]));
                        write(fd, "\n", 1);
                    }
                }
                ++interval;
                sleep(1);
            }
        } else if (strcmp(argv[1], "monitor_volume") == 0) {
            system("pactl subscribe\
                    | grep --line-buffered 'sink'\
                    | while read -r UNUSED_LINE; do status_bar volume; done &"
            );
        } else {
            write(fd, argv[1], strlen(argv[1]));
            write(fd, "\n", 1);
        }
        close(fd);
    } else if (argc > 2) {
        printf("\nToo many arguments supplied (maximum 1 expected)\n");
    }
}
