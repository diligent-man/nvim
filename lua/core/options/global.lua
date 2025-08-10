require("utils.alias")
require("utils.vim_env")

---@type StdPath
local StdPath = require("utils.StdPath").StdPath

---@type string
local utils = require("utils")


---@type StdPath
local std_path = StdPath.new()

---@type function
local make_title_str =  utils.make_title_str


--[[
Note:
1/ Finding regex: \s\s\sglobal\s\s. Use with Regular Expression Search in Chrome
2/ Opts with "left as default" as the end will be considered later on
3/ Commented options are unavailable in nvim v0.11.3
--]]


------------------------------------------------------------------------------------------------------------------------
--- Deprecated options ---
--[[
o.chistory = 10
o.completefuzzycollect = ""
o.diffopt = "internal,filler,closeoff,inline:simple,linematch:40"
o.fileformats = {Windows="dos,unix", Unix="unix,dos"}
]]
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- As default options ---
--[[
o.cdhome = false  -- if on, chdir to $HOME. Not affect in Unix

o.cdpath = ",,"
o.charconvert = ""  -- text encoding, usually used with external programme
o.debug = ""
o.delcombine = false  -- delete both base & accent. Useful for Latin, Cyrillic, etc.
o.columns = 80  -- default 80 or term width
o.encoding = "utf-8"
o.emoji = true  -- emoji's width for displaying
o.errorfile = "errors.err"
o.exrc = false  -- enable project-based configuration for nvim
o.fileencodings = "ucs-bom,utf-8,default,latin1"  -- list of prioritized text encoders
]]
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Check later ---
o.allowrevins = false
o.ambiwidth = "single"
o.arabicshape = true
o.casemap = "internal,keepascii"
o.completeitemalign = "abbr,kind,menu"  -- item in popup menu
o.cpoptions = "aABceFs_"  -- vi compatible options
o.diffexpr = ""
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Long line wrapper ---
--o.display = "lastline"  -- The way text is displayed
--o.breakat = " ^I!@*-+;:,./?"  -- char to break in long line
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- GUI ---
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
o.guifont = ""
o.guifontwide = ""
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Bell ---
o.belloff = ""  -- which events the bell will not be rung
o.visualbell = true  -- make screen flash instead of ringing bell in error event
o.errorbells = true
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Directory ---
o.autochdir = false  -- auto change dir to opened/ switched/ deleted buff
o.directory = std_path.state .. "/nvim/swap//"  -- list comma-separated dir for swap file
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- File backup

--[[
when save file (:w), nvim performs
    if backup then

            a/ Renames the original file to backup file (e.g. tmp.txt -> tmp.txt~)
            b/ Write new content to tmp.txt
    else
        "write-and-delete" stategy (default), which is fast but less protection in case of crash

Backup table
  backup | writebackup | action
  off    |     off     |  no backup
  off    |     on      |  backup current , deleted afterwards
  on     |     off     |  del old, backup current
  on     |     on      |  del old, backup current
--]]
o.backup = true  -- make backup before overwriting a file. Leave it till file has been successfully written. (check backup table)
o.backupext = "~"  -- appended str to backup file. Overridden by bo.bex
o.backupcopy = "auto"  -- backup file writing strategies
o.writebackup = true -- make a backup before overwriting a file (check Backup table)
o.backupdir = std_path.data .. "/backup/"
-- left as default
--o.backupskip  -- acts like .gitignore or .dockerignore
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- File writing ---
o.autowrite = false  -- auto write to buff. Renam buff with ":file {name}" to avoid unwanted effect.
o.autowriteall = true  -- this same to autowrite but with higher precedence
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- UI ---
o.background = "dark"
o.equalalways = true  -- Split equal-sized windows
o.eadirection = "both"  -- when apply equal split
o.showmode = false  -- mode display is relegated to status bar config
o.termguicolors = true  -- enables 24-bit RGB color instead of "cterm" attr in the TUI

--- Popup Win ---
--o.winaltkeys = "menu"  -- Win32 only
o.winborder = ""
--o.window -- left as default
o.winheight = 1
o.winminheight = 1
o.winminwidth = 1
o.winwidth = 20

--- Title string ---
o.title = true
o.titlestring = make_title_str()
o.titlelen = 85
o.titleold = ""  -- fallback of title string
-----------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Special keys ---
--[[
    Backspace delete mechanism.
        1/ indent: allows to remove space/ tab created by autoindent opt
        2/ eol: allows to remove line by line (joint lines).
        3/ start: solely allows to remove content newly created when entering insert mode.
                  Set start is also means "nostop"
            Del by word (Ctrl + w (default)) is also disabled
            Del by line (Ctrl + u (default))      //
        4/ nostop: still allows "Del by word" & "Del by line" though "start" is not included
-- ]]
o.backspace = "indent,eol,start"
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Commandline mode ---
o.hi = 10000  -- cmd history
o.cedit = "<C-h>"  -- History cmd-mode
o.cmdwinheight = 5
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Help Menu ---
--o.helpheight = 50
o.helplang = "en"
o.helpfile = VIMRUNTIME .. "/doc/help.txt"
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Digraph ---
o.digraph = false  -- entering digraph with <BS>. Turn off due to the use of <C-k>
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Searching & Replacing ---
o.gdefault = false  -- replace all instead of one
o.inccommand = "split"  -- additionally display partial result off-screen
o.incsearch = true  -- allow incremental search with "/"
o.hlsearch = true  -- highlight all searched results

-- Case insensitive ---
o.ignorecase = false
o.smartcase = false  --
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Autocmd ---
o.eventignore = ""  -- list of auto commands to be ignored
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Folding ---
o.foldclose = ""
o.foldlevelstart = -1  -- -1: disabled <==> 0 | 0: all folds closed |1: some folds closed | 99: no fold closed
o.foldopen = "block,hor,search,tag,undo"  -- types of command that fold will be opened
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Mouse ---
--[[
Usage:
    1/ "n"
        d + left click: delete to new cursor location
        Drag status line to resize

    2/ "v"
        Double click: word-wise selection
        Triple click: line-wise selection
        Quaruple click: rectangular block-wise (not effect ?)

    3/ scrolling: check scroll-mouse-wheel
]]
o.mouse = "nvic"  -- can be n|v|i|c|h|a|r
o.mousefocus = false  -- should be off
o.mousehide = true  -- hide mouse when typing
o.mousemodel = "popup_setpos"  -- specifies right click ability. Can be define via keymap
o.mousemoveevent = false  -- shoud be off for avoiding overhead
o.mousescroll = "ver:3,hor:6"  -- scrolling lines. Can be disable by setting 0
o.mousetime = 500  -- allowed max time for multiclick fn
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Win splitting ---
o.splitright = true  -- new win is on the right for :vs cmd
o.splitbelow = true  -- new win is below for :split cmd
o.splitkeep = "cursor"  -- scroll behavior when opening/ closing/ resizing horizontal split
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Scrolling ---
-- min cols to scroll horizontally. Used when "wrap" if off. Use "sidescrolloff" in local2window opt instead.
-- For smoothing horizontal scroll, it should be 1
o.sidescroll = 1

-- min line to scroll vertically. Use "scrolloff" in local2window opt instead.
-- For smoothing horizontal scroll, it should be 0
o.scrolljump = 0
o.scrollopt = "hor,ver,jump"  -- currently off (see local2window opt)
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Keymap ---
o.timeout = true
o.timeoutlen = 1000  -- timeout for a seq of keymap. Useful for insert/ visual keymap
o.ttimeout = true
o.ttimeoutlen = 50  -- timeout for a seq of keymap in terminal
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Swap file ---
o.updatecount = 200
o.updatetime = 250  -- affect LspReferenceText (CursorHold event) & swap file writing
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Misc ---
--[[
    Intergrate Nvim's internal text registers with os's clipboard. Defined by a list of comma-separated clipboard. For
example, when we yank (~ copy) or del text, it goes into nvim's internal registers, which is separated from os's clipboard.
This option acts as a bridge.

    On os's, we need sthg called clipboard provider, including
        a/ xclip/ xsel - for X11/ Linux desktop env
        b/ wl-copy or wl-paste - for Wayland Linux desktop env
        c/ win32yank - for Windows, often used with WSL
        d/ No need for macOS

--]]
o.clipboard = "unnamed,unnamedplus"
o.confirm = true  -- confirmation for unsaved changes
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Indentation ---
o.smarttab = true  -- combine with shiftwidth opt for 4-space tab
------------------------------------------------------------------------------------------------------------------------

o.fileignorecase = false  -- file to ignore when searching. Case-sensitive treating in *nix, and case-insensitive in Win
o.undoreload = 10000


o.fsync = true
o.hidden = true


o.icon = false
o.iconstring = ""
--o.isfname -- left as default
--o.isident -- left as default
o.isprint = "@,161-255"
o.joinspaces = false
o.jumpoptions = "clean"
o.keymodel = ""
o.langmap = ""
o.langmenu = ""
o.langremap = false
o.laststatus = 2
o.lazyredraw = false
--o.lines -- left as default
o.linespace = 0
o.loadplugins = true
o.magic = true
o.makeef = ""
o.matchtime = 5
o.maxfuncdepth = 100
o.maxmapdepth = 1000
o.maxmempattern = 1000
--o.msc = 999
o.menuitems = 25
o.messagesopt = "hit-enter,history:1000"
o.mkspellmem = "460000,2000,500"
o.modelineexpr = false
o.modeline = true
o.modelines = 5
o.more = true

o.opfunc = ""
--o.packpath  -- left as default
o.paragraphs = "IPLPPPQPP TPHPLIPpLpItpplpipbp"
o.patchexpr = ""
o.patchmode = ""
o.previewheight = 12
o.pumblend = 0
o.pumheight = 0
--o.pummaxwidth = 0
o.pumwidth = 0
o.pyxversion = 3
o.quickfixtextfunc = ""
o.redrawdebug = ""
o.redrawtime = 2000
--o.regexengine = 0
o.report = 2
o.revins = false

o.ruler = true
o.rulerformat = ""
--o.runtimepath -- left as default

o.sections = "SHNHH HUnhsh"
o.selection = "inclusive"
o.selectmode = ""
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"
--o.shada -- left as default
o.shadafile = ""
--o.shell = -- left as default
--o.shellcmdflag = -- left as default
--o.shellpipe = -- left as default
--o.shellquote = -- left as default
--o.shellredir = --left as default
--o.shellslash = -- left as default
o.shelltemp = false
o.shellxescape = ""
--o.shellxquote = -- left as default
o.shiftround = false
o.shortmess = "ltToOCF"

o.showcmd = true
o.showcmdloc = "last"
o.showfulltag = false
o.showmatch = false

o.showtabline = 1



o.spellsuggest = "best"


o.startofline = false
o.suffixes = ".bak,~,.o,.h,.info,.swp,.obj"
o.switchbuf = "uselast"
o.tabclose = ""
o.tabline = ""
o.tabpagemax = 50
o.tagbsearch = true
o.taglength = 0
o.tagrelative = true
o.tagstack = true
o.termbidi = false

o.termpastefilter = "BS,HT,ESC,DEL"
o.termsync = true
o.tildeop = false

o.undodir = std_path.state .. "/nvim/undo//"


o.verbose = 0
o.verbosefile = ""
o.viewdir = std_path.state .. "/nvim/view//"
o.viewoptions = "folds,cursor,curdir"
o.warn = true
o.whichwrap = "b,s"
o.wildchar = 9 -- Tab keycode
o.wildcharm = 0
o.wildignore = ""
o.wildignorecase = false
o.wildmenu = true
o.wildmode = "full"
o.wildoptions = "pum,tagfile"
o.wrapscan = true
o.write = true
o.writeany = false

o.writedelay = 0
