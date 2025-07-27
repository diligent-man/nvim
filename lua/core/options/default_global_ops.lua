require("utils.alias")
require("utils.vim_env")

local StdPath = require(".utils").StdPath

local std_path = StdPath.new()


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

]]
---------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------
--- As default options ---
--[[
o.cdhome = false  -- if on, chdir to $HOME. Not affect in Unix
o.breakat = " ^I!@*-+;:,./?"  -- char to break in long line
o.cdpath = ",,"
o.charconvert = ""  -- text encoding, usually used with external programme
o.debug = ""
o.delcombine = false  -- delete both base & accent. Useful for Latin, Cyrillic, etc.
o.columns = 80  -- default 80 or term width
o.encoding = "utf-8"
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
---------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------
--- Directory ---
o.autochdir = false  -- auto change dir to opened/ switched/ deleted buff
o.directory = std_path.state .. "/nvim/swap//"  -- list comma-separated dir for swap file
---------------------------------------------------------------------------------------------------------------------------



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
---------------------------------------------------------------------------------------------------------------------------



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
--- Bell
o.belloff = ""  -- which events the bell will not be rung
o.visualbell = true  -- make screen flash instead of ringing bell in error event
o.errorbells = true
------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------
--- Commandline mode
---
o.cedit = "<C-h>"  -- History cmd-mode
o.cmdwinheight = 5
------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------
--- Help Menu ---
--o.helpheight = 50
o.helplang = "en"
o.helpfile = VIMRUNTIME .. "/doc/help.txt"
---------------------------------------------------------------------------------------------------------------------------



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









o.diffexpr = ""
--o.diffopt = "internal,filler,closeoff,inline:simple,linematch:40"
o.digraph = false

o.display = "lastline"
o.eadirection = "both"
o.emoji = true


o.errorfile = "errors.err"
o.eventignore = ""
o.exrc = false
o.fileencodings = "ucs-bom,utf-8,default,latin1"
--o.fileformats = {Windows="dos,unix", Unix="unix,dos"}
o.fileignorecase = false
o.foldclose = ""
o.foldlevelstart = -1
o.foldopen = "block,hor,mark,percent,quickfix,search,tag,undo"
o.fsync = true
o.gdefault = false
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
o.guifont = ""
o.guifontwide = ""

o.hidden = true
o.hi = 10000
o.hlsearch = true
o.icon = false
o.iconstring = ""
o.ignorecase = false
o.inccommand = "nosplit"
o.incsearch = true
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
o.mouse = "nvi"
o.mousefocus = false
o.mousehide = true
o.mousemodel = "popup_setpos"
o.mousemoveevent = false
o.mousescroll = "ver:3,hor:6"
o.mousetime = 500
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
o.scrolljump = 1
o.scrollopt = "ver,jump"
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
o.showmode = true
o.showtabline = 1
o.sidescroll = 1
o.smartcase = false
o.smarttab = true
o.spellsuggest = "best"
o.splitbelow = false
o.splitkeep = "cursor"
o.splitright = false
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
o.termguicolors = false
o.termpastefilter = "BS,HT,ESC,DEL"
o.termsync = true
o.tildeop = false
o.timeout = true
o.timeoutlen = 1000
o.title = false
o.titlelen = 85
o.titleold = ""
o.titlestring = ""
o.ttimeout = true
o.ttimeoutlen = 50
o.undodir = std_path.state .. "/nvim/undo//"
o.undoreload = 10000
o.updatecount = 200
o.updatetime = 40000
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
o.winaltkeys = "menu"
o.winborder = ""
--o.window -- left as default
o.winheight = 1
o.winminheight = 1
o.winminwidth = 1
o.winwidth = 20
o.wrapscan = true
o.write = true
o.writeany = false

o.writedelay = 0
