/* A Bison parser, made by GNU Bison 3.7.91.  */

/* Skeleton interface for Bison GLR parsers in C

   Copyright (C) 2002-2015, 2018-2021 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_LEXER_THEME_PARSER_H_INCLUDED
# define YY_YY_LEXER_THEME_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 34 "../lexer/theme-parser.y"

#include "theme.h"
#include "xrmoptions.h"
#include "css-colors.h"
#include "rofi.h"

typedef struct YYLTYPE {
  int first_line;
  int first_column;
  int last_line;
  int last_column;
  char *filename;
} YYLTYPE;
# define YYLTYPE_IS_DECLARED 1 /* alert the parser that we have our own definition */

# define YYLLOC_DEFAULT(Current, Rhs, N)                               \
    do                                                                 \
      if (N)                                                           \
        {                                                              \
          (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;       \
          (Current).first_column = YYRHSLOC (Rhs, 1).first_column;     \
          (Current).last_line    = YYRHSLOC (Rhs, N).last_line;        \
          (Current).last_column  = YYRHSLOC (Rhs, N).last_column;      \
          (Current).filename     = YYRHSLOC (Rhs, 1).filename;         \
        }                                                              \
      else                                                             \
        { /* empty RHS */                                              \
          (Current).first_line   = (Current).last_line   =             \
            YYRHSLOC (Rhs, 0).last_line;                               \
          (Current).first_column = (Current).last_column =             \
            YYRHSLOC (Rhs, 0).last_column;                             \
          (Current).filename  = NULL;                        /* new */ \
        }                                                              \
    while (0)

#line 80 "lexer/theme-parser.h"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    T_END = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    T_ERROR = 1,                   /* "error from file parser"  */
    T_ERROR_PROPERTY = 2,          /* "invalid property value"  */
    T_ERROR_SECTION = 3,           /* "invalid property name"  */
    T_ERROR_NAMESTRING = 4,        /* "invalid element name"  */
    T_ERROR_DEFAULTS = 5,          /* "invalid defaults name"  */
    T_ERROR_INCLUDE = 6,           /* "invalid import value"  */
    T_ERROR_ARGB_SPEC = 7,         /* "invalid argb color. Requires 8 (not 7) elements: argb:AARRGGBB."  */
    T_INT = 258,                   /* "Integer number"  */
    T_DOUBLE = 259,                /* "Floating-point number"  */
    T_STRING = 260,                /* "UTF-8 encode string"  */
    T_MEDIA_TYPE = 261,            /* "Media type"  */
    T_CHAR = 262,                  /* "Character"  */
    T_PROP_NAME = 263,             /* "property name"  */
    T_COLOR_NAME = 264,            /* "Color value by name"  */
    T_NAME_ELEMENT = 265,          /* "Element name"  */
    T_BOOLEAN = 266,               /* "Boolean value (true or false)"  */
    T_COLOR = 267,                 /* "Hexidecimal color value"  */
    T_LINK = 268,                  /* "Reference"  */
    T_ELEMENT = 269,               /* "Name of element"  */
    T_POS_CENTER = 270,            /* "Center"  */
    T_POS_EAST = 271,              /* "East"  */
    T_POS_WEST = 272,              /* "West"  */
    T_POS_NORTH = 273,             /* "North"  */
    T_POS_SOUTH = 274,             /* "South"  */
    T_MEDIA = 275,                 /* "@media"  */
    T_NONE = 276,                  /* "None"  */
    T_BOLD = 277,                  /* "Bold"  */
    T_ITALIC = 278,                /* "Italic"  */
    T_UNDERLINE = 279,             /* "Underline"  */
    T_STRIKETHROUGH = 280,         /* "Strikethrough"  */
    T_DASH = 281,                  /* "Dash"  */
    T_SOLID = 282,                 /* "Solid"  */
    T_UPPERCASE = 283,             /* "Uppercase"  */
    T_CAPITALIZE = 284,            /* "Capitalize"  */
    T_LOWERCASE = 285,             /* "Lowercase"  */
    T_UNIT_PX = 286,               /* "pixels"  */
    T_UNIT_MM = 287,               /* "mm"  */
    T_UNIT_EM = 288,               /* "em"  */
    T_UNIT_CH = 289,               /* "ch"  */
    T_UNIT_PERCENT = 290,          /* "%"  */
    T_ANGLE_DEG = 291,             /* "Degrees"  */
    T_ANGLE_GRAD = 292,            /* "Gradians"  */
    T_ANGLE_RAD = 293,             /* "Radians"  */
    T_ANGLE_TURN = 294,            /* "Turns"  */
    ORIENTATION_HORI = 295,        /* "Horizontal"  */
    ORIENTATION_VERT = 296,        /* "Vertical"  */
    CURSOR_DEF = 297,              /* "Default"  */
    CURSOR_PTR = 298,              /* "Pointer"  */
    CURSOR_TXT = 299,              /* "Text"  */
    T_COL_RGBA = 300,              /* "rgb[a] colorscheme"  */
    T_COL_HSL = 301,               /* "hsl colorscheme"  */
    T_COL_HWB = 302,               /* "hwb colorscheme"  */
    T_COL_CMYK = 303,              /* "cmyk colorscheme"  */
    T_URL = 304,                   /* "an URL"  */
    T_WIDTH = 305,                 /* "an WIDTH"  */
    T_HEIGHT = 306,                /* "an HEIGHT"  */
    T_BOTH = 307,                  /* "an BOTH"  */
    T_TO = 308,                    /* "an TO"  */
    T_LEFT = 309,                  /* "an LEFT"  */
    T_RIGHT = 310,                 /* "an RIGHT"  */
    T_TOP = 311,                   /* "an TOP"  */
    T_BOTTOM = 312,                /* "an BOTTOM"  */
    T_LINEAR_GRADIENT = 313,       /* "a linear gradient"  */
    T_PARENT_LEFT = 314,           /* "Parent left ('(')"  */
    T_PARENT_RIGHT = 315,          /* "Parent right (')')"  */
    T_COMMA = 316,                 /* "comma separator (',')"  */
    T_OPTIONAL_COMMA = 317,        /* "Optional comma separator (',')"  */
    T_FORWARD_SLASH = 318,         /* "forward slash ('/')"  */
    T_PERCENT = 319,               /* "Percent sign ('%')"  */
    T_LIST_OPEN = 320,             /* "List open ('[')"  */
    T_LIST_CLOSE = 321,            /* "List close (']')"  */
    T_MODIFIER_ADD = 322,          /* "Add ('+')"  */
    T_MODIFIER_SUBTRACT = 323,     /* "Subtract ('-')"  */
    T_MODIFIER_MULTIPLY = 324,     /* "Multiply ('*')"  */
    T_MODIFIER_MAX = 325,          /* "Max ('max')"  */
    T_MODIFIER_MIN = 326,          /* "Min ('min')"  */
    T_MODIFIER_ROUND = 327,        /* "Min ('round')"  */
    T_MODIFIER_FLOOR = 328,        /* "Min ('floor')"  */
    T_MODIFIER_CEIL = 329,         /* "Min ('ceil')"  */
    T_CALC = 330,                  /* "calc"  */
    T_BOPEN = 331,                 /* "bracket open ('{')"  */
    T_BCLOSE = 332,                /* "bracket close ('}')"  */
    T_PSEP = 333,                  /* "property separator (':')"  */
    T_PCLOSE = 334,                /* "property close (';')"  */
    T_NSEP = 335,                  /* "Name separator (' ' or '.')"  */
    T_SSEP = 336,                  /* "Selector separator (',')"  */
    T_NAME_PREFIX = 337,           /* "Element section ('# {name} { ... }')"  */
    T_WHITESPACE = 338,            /* "White space"  */
    T_PDEFAULTS = 339,             /* "Default settings section ( '* { ... }')"  */
    T_CONFIGURATION = 340,         /* "Configuration block"  */
    T_RESET_THEME = 341,           /* "Reset Theme"  */
    T_COLOR_TRANSPARENT = 342,     /* "Transparent"  */
    T_INHERIT = 343,               /* "Inherit"  */
    T_MEDIA_WIDTH = 344,           /* "Width"  */
    T_MEDIA_HEIGHT = 345,          /* "Height"  */
    T_MEDIA_MIN = 346,             /* "Min"  */
    T_MEDIA_MONITOR_ID = 347,      /* "Monitor-ID"  */
    T_MEDIA_MAX = 348,             /* "Max"  */
    T_MEDIA_SEP = 349,             /* "-"  */
    T_VAR_START = 350,             /* "var"  */
    T_ENV_START = 351              /* "env"  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 139 "../lexer/theme-parser.y"

    int           ival;
    double        fval;
    char          *sval;
    char          cval;
    int           bval;
    WindowLocation wloc;
    ThemeColor    colorval;
    ThemeWidget   *theme;
    GList         *list;
    Property      *property;
    GHashTable    *property_list;
    RofiDistance      distance;
    RofiDistanceUnit  *distance_unit;

#line 216 "lexer/theme-parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif



int yyparse (const char *what);

#endif /* !YY_YY_LEXER_THEME_PARSER_H_INCLUDED  */
