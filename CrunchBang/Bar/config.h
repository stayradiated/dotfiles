/* The height of the bar (in pixels) */
#define BAR_HEIGHT  25

/* The width of the bar. Set to -1 to fit screen */
#define BAR_WIDTH   -1

/* Offset from the left. Set to 0 to have no effect */
#define BAR_OFFSET 0

/* Choose between an underline or an overline */
#define BAR_UNDERLINE 1

/* The thickness of the underline (in pixels). Set to 0 to disable. */
#define BAR_UNDERLINE_HEIGHT 1

/* Default bar position, overwritten by '-b' switch */
#define BAR_BOTTOM 0

/* The fonts used for the bar, comma separated. Only the first 2 will be used. */
#define BAR_FONT "-misc-tamzen-medium-r-normal--14-*-*-*-*-*-*-*", "-misc-sm4tik-Medium-R-Normal--16-*-*-*-*-*-*-*"

/* Some fonts don't set the right width for some chars, pheex it */
#define BAR_FONT_FALLBACK_WIDTH 9

/* Define the opacity of the bar (requires a compositor such as compton) */
#define BAR_OPACITY 1.0 /* 0 is invisible, 1 is opaque */

/* Color palette */
#define BACKGROUND 0x021B21
#define FOREGROUND 0xE8DFD6
#define COLOR0 	   0x08313B // current line
#define COLOR1 	   0xac4142 // red
#define COLOR2 	   0x90a959 // green
#define COLOR3 	   0xd28445 // yellow
#define COLOR4 	   0x6a9fb5 // blue
#define COLOR5 	   0xaa759f // magenta
#define COLOR6 	   0x75b5aa // cyan
#define COLOR7 	   0x969896 // white
#define COLOR8 	   0x134E5F // black
#define COLOR9 	   0xcc6666 // dark red
