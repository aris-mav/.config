-- Modified version of the default base-16 theme

local l = vis.lexers

-- generic styles
l.STYLE_DEFAULT           = ''
l.STYLE_NOTHING           = ''
l.STYLE_LINENUMBER_CURSOR = ''
l.STYLE_LINENUMBER        = 'dim,fore:8'
l.STYLE_CURSOR            = 'keep_attribute'
l.STYLE_CURSOR_PRIMARY    = 'fore:black,back:15'
l.STYLE_CURSOR_LINE       = 'underlined,keep_attribute'
l.STYLE_COLOR_COLUMN      = 'back:black'
l.STYLE_SELECTION         = 'back:white,fore:black,keep_attribute'
l.STYLE_STATUS            = 'dim,fore:8'
l.STYLE_STATUS_FOCUSED    = 'dim,bold'
l.STYLE_INFO              = 'bold'
l.STYLE_WHITESPACE        = ''
l.STYLE_SEPARATOR         = ''
l.STYLE_EOF               = ''

-- syntax styles
l.STYLE_ATTRIBUTE    = 'fore:green'
l.STYLE_COMMENT      = 'dim,italics'
l.STYLE_CONSTANT     = 'fore:cyan'
l.STYLE_HEADING      = 'fore:magenta'
l.STYLE_NUMBER       = 'fore:magenta'
l.STYLE_OPERATOR     = ''
l.STYLE_REGEX        = 'fore:green'
l.STYLE_STRING       = 'fore:green'
l.STYLE_PREPROCESSOR = 'fore:magenta'
l.STYLE_VARIABLE     = 'fore:blue'
l.STYLE_EMBEDDED     = 'bold'
l.STYLE_IDENTIFIER   = ''
l.STYLE_CLASS        = 'fore:yellow'
l.STYLE_DEFINITION   = 'fore:yellow'
l.STYLE_ERROR        = 'fore:red,underlined'
l.STYLE_FUNCTION     = ''
l.STYLE_KEYWORD      = 'fore:red'
l.STYLE_LABEL        = 'fore:red'
l.STYLE_TAG          = 'fore:blue'
l.STYLE_TYPE         = 'fore:yellow'

-- lexer specific styles

-- Diff
l.STYLE_ADDITION = 'fore:green'
l.STYLE_DELETION = 'fore:red'
l.STYLE_CHANGE = 'fore:yellow'

-- CSS
l.STYLE_PROPERTY = l.STYLE_ATTRIBUTE
l.STYLE_PSEUDOCLASS = ''
l.STYLE_PSEUDOELEMENT = ''

-- HTML
l.STYLE_TAG_UNKNOWN = l.STYLE_TAG .. ',italics'
l.STYLE_TAG_SINGLE = l.STYLE_TAG
l.STYLE_TAG_DOCTYPE = l.STYLE_TAG .. ',bold'
l.STYLE_ATTRIBUTE_UNKNOWN = l.STYLE_ATTRIBUTE .. ',italics'

-- Latex, TeX, and Texinfo
l.STYLE_COMMAND = l.STYLE_KEYWORD
l.STYLE_COMMAND_SECTION = l.STYLE_CLASS
l.STYLE_ENVIRONMENT = l.STYLE_TYPE
l.STYLE_ENVIRONMENT_MATH = l.STYLE_NUMBER

-- Makefile
l.STYLE_TARGET = ''

-- Markdown
l.STYLE_HR = ''
for i = 1,6 do l['STYLE_HEADING_H'..i] = l.STYLE_HEADING end
l.STYLE_BOLD = 'bold'
l.STYLE_ITALIC = 'italics'
l.STYLE_LIST = l.STYLE_KEYWORD
l.STYLE_LINK = 'fore:cyan'
l.STYLE_REFERENCE = 'fore:cyan'
l.STYLE_CODE = l.STYLE_EMBEDDED

-- Output
l.STYE_FILENAME = ''
l.STYLE_LINE = ''
l.STYLE_COLUMN = ''
l.STYLE_MESSAGE = ''

-- Python
l.STYLE_KEYWORD_SOFT = ''

-- Taskpaper
l.STYLE_NOTE = ''
l.STYLE_TAG_EXTENDED = ''
l.STYLE_TAG_DAY = 'fore:yellow'
l.STYLE_TAG_OVERDUE = 'fore:red'
l.STYLE_TAG_PLAIN = ''

-- XML
l.STYLE_CDATA = ''

-- YAML
l.STYLE_ERROR_INDENT = 'back:red'

-- The following are temporary styles until their legacy l are migrated.

-- Antlr
l.STYLE_ACTION = ''

-- Clojure
l.STYLE_CLOJURE_KEYWORD = l.STYLE_TYPE
l.STYLE_CLOJURE_SYMBOL = l.STYLE_TYPE .. ',bold'

-- Crystal
--l.STYLE_SYMBOL = l.STYLE_STRING

-- Gleam
l.STYLE_MODULE = l.STYLE_CONSTANT
l.STYLE_DISCARD = l.STYLE_COMMENT

-- Icon
l.STYLE_SPECIAL_KEYWORD = l.STYLE_TYPE

-- jq
l.STYLE_FORMAT = l.STYLE_CONSTANT
l.STYLE_SYSVAR = l.STYLE_CONSTANT .. ',bold'

-- Julia
-- l.STYLE_SYMBOL = l.STYLE_STRING
l.STYLE_CHARACTER = l.STYLE_CONSTANT

-- Mediawiki
l.STYLE_BEHAVIOR_SWITCH = l.STYLE_KEYWORD

-- Moonscript
l.STYLE_TBL_KEY = l.STYLE_REGEX
l.STYLE_SELF_REF = l.STYLE_LABEL
l.STYLE_PROPER_IDENT = l.STYLE_CLASS
l.STYLE_FNDEF = l.STYLE_PREPROCESSOR
-- l.STYLE_SYMBOL = l.STYLE_EMBEDDED

-- reST
l.STYLE_LITERAL_BLOCK = l.STYLE_EMBEDDED
l.STYLE_FOOTNOTE_BLOCK = l.STYLE_LABEL
l.STYLE_CITATION_BLOCK = l.STYLE_LABEL
l.STYLE_LINK_BLOCK = l.STYLE_LABEL
l.STYLE_CODE_BLOCK = l.STYLE_CODE
l.STYLE_DIRECTIVE = l.STYLE_KEYWORD
l.STYLE_SPHINX_DIRECTIVE = l.STYLE_KEYWORD
l.STYLE_UNKNOWN_DIRECTIVE = l.STYLE_KEYWORD
l.STYLE_SUBSTITUTION = l.STYLE_VARIABLE
l.STYLE_INLINE_LITERAL = l.STYLE_EMBEDDED
l.STYLE_ROLE = l.STYLE_CLASS
l.STYLE_INTERPRETED = l.STYLE_STRING

-- txt2tags
l.STYLE_LINE = 'bold'
for i = 1,5 do l['STYLE_H'..i] = l.STYLE_HEADING end
l.STYLE_IMAGE = 'fore:green'
l.STYLE_STRIKE = 'italics'
l.STYLE_TAGGED = l.STYLE_EMBEDDED
l.STYLE_TAGGED_AREA = l.STYLE_EMBEDDED
l.STYLE_TABLE_SEP = 'fore:green'
l.STYLE_HEADER_CELL_CONTENT = 'fore:green'
