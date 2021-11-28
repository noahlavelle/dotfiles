#include "themes/gruvbox.h"

#define SCRIPTS_PATH  "~/builds/bar/scripts"
#define MODULES_COUNT 6
#define BUFFSIZE      9999
#define PIPE_PATH     "/tmp/status_bar"

static char *modules[][4] = {
/*    Name           Colour   Get Script    Interval  */
    { "song",        yellow,  "track",      "0" }, // Track
    { "volume",      green,   "volume",     "0" }, // Volume
    { "memory",      red,     "memory",     "1" }, // Memory
    { "temperature", orange,  "cpu_temp",   "1" }, // Temperature
    { "updates",     pink,    "updates",    "300" }, // Updates
    { "clock",       blue,    "clock",      "1" }, // Clock
};
