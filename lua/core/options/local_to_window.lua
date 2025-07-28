require("utils.alias")

local utils = require("utils")

local scrolloff = utils.get_scrolloff()
local sidescrolloff = utils.get_sidescrolloff()


-- Finding regex: \s\s\slocal to window\s\s.
-- Use with Regular Expression Search in Chrome
------------------------------------------------------------------------------------------------------------------------
--- Long line wrapper ---
wo.wrap = false  -- wrap long line
wo.linebreak = false  -- how to break long line based on breakat opt
------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------
--- Folding ---
wo.foldmethod = "manual"  -- one outa six fold methods
wo.foldminlines = 3  -- # of min lines to form a fold
wo.foldnestmax = 20  -- Max ford for "indent" and "syntax" method
wo.foldlevel = 1  -- Fold higher than this level, fold will be closed
wo.foldcolumn = "0"  -- When and how to draw the foldcolumn

wo.foldmarker = "{{{,}}}"  -- Marks's start & end iff method is "marker"
wo.foldexpr = "0"
wo.foldenable = true
wo.foldignore = "#"
wo.foldtext = ""  -- Text to display for a closed fold.
---------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Line number ---
wo.number = true  -- display line num in left side bar
wo.relativenumber = true  -- calculate relative lines to the current line. Usefule for nvim motion.
wo.numberwidth = 6  -- same as pycharm
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Misc ---
wo.fillchars = "eob: "
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------
--- Cursor ---
wo.cursorline = true  -- hightlight selected line. Config via hl-CursorLine
wo.cursorcolumn = false  -- highlight selected col.
wo.cursorbind = false  -- move cursor to same pos in all windows. (should be manually turn on via map when needed)
wo.cursorlineopt = "both"  -- Comma-separated list of opts for how 'cursorline' is displayed. Can be line | screenline | number | both.
------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------
--- Scrolling ---
wo.scrolloff =  scrolloff  -- min screen lines to keep above & below the cursor
wo.sidescrolloff = sidescrolloff -- min cols to scroll horizontally. Used when "wrap" if off
wo.scrollbind = false  -- same as cursorbind, but just scrolling. Interpreted by "scrollopt" in global_ops
--wo.scroll = 15 -- left as default
wo.smoothscroll = false  -- not use long line wrap so check later
---------------------------------------------------------------------------------------------------------------------------


wo.arabic = false

wo.breakindent = false
wo.breakindentopt = ""
wo.colorcolumn = ""
wo.concealcursor = ""
wo.conceallevel = 0

wo.diff = false
wo.eventignorewin = ""

--wo.lhistory = 10

wo.list = false

wo.previewwindow = false
wo.rightleft = false
--wo.rightleftcmd = "cmd"



wo.signcolumn = "auto"
wo.spell = false
wo.statuscolumn = ""
wo.winblend = 0
wo.winfixbuf = false
wo.winfixheight = false
wo.winfixwidth = false
wo.winhighlight = ""
