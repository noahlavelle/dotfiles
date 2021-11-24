#include "themes/gruvbox.h"

#define SCRIPTS_PATH  "scripts"
#define MODULES_COUNT 6
#define BUFFSIZE      9999

static char *modules[][4] = {
/*    Name           Colour   Get Script    Interval  */
    { "song",        yellow,  "track",      "0" }, // Track
    { "volume",      green,   "volume",     "1" }, // Volume
    { "memory",      red,     "memory",     "1" }, // Memory
    { "temperature", orange,  "cpu_temp",   "1" }, // Temperature
    { "updates",     pink,    "updates",    "300" }, // Updates
    { "clock",       blue,    "clock",      "1" }, // Clock
};
