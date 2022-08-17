/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;                    /* -c option; centers dmenu on screen */
static int lineheight = 0;
static int min_lineheight = 10;

/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"NotoSansMono Nerd Font:size=10",
    "Noto Color Emoji:size=8"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
// Gruvbox
// TODO: Do theming properly at some point
/*
static const char *colors[SchemeLast][2] = {
	     fg         bg       
    [SchemeNorm] = { "#a89984", "#282828" },
	[SchemeSel] = { "#ebdbb2", "#fe8019" },
	[SchemeOut] = { "#1d2021", "#fe8019" },
};
*/

static const char *colors[SchemeLast][2] = {
	/*    		 fg         bg  */       
	[SchemeNorm] = { "#eceff4", "#2e3440" },
	[SchemeSel]  = { "#d8dee9", "#5e81ac" },
	[SchemeOut]  = { "#1d2021", "#fe8019" },
};

/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 0;
static unsigned int columns    = 0;


/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 0;

