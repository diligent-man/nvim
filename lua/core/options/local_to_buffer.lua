--[[
    Although this script contains all local-to-buffer options, but all of them should be set
globally via vim.o in lieu of vim.bo
]]
require("utils.alias")

-- Finding regex: \s\s\slocal to buffer\s\s.
-- Use with Regular Expression Search in Chrome

---------------------------------------------------------------------------------------------------------------------------
--- Scrolling ---
o.scrollback = 10000  -- max lines kept beyond the visible screen & deleted if new lines exceed this limit. Only terminal buffer
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
--- Indentation ---
o.tabstop = 4
o.shiftwidth = 4  -- Indent have width of 4
o.softtabstop = -1  -- # cols for a <Tab>. O for off feature
o.expandtab = true  -- convert <Tab> to <Space>
o.autoindent = false  -- copy indent from current to new line (use smartindent instead)
o.smartindent = true  -- use softtabstop instead

o.indentexpr = ""
o.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"

o.cindent = false
o.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e"
---------------------------------------------------------------------------------------------------------------------------



o.binary = false
o.bomb = false
o.bufhidden = ""
o.buflisted = on
o.buftype = ""
--bo.busy = 0
--bo.channel = 0

o.cinoptions = ""
o.cinscopedecls = "public,protected,private"
o.cinwords = "if,else,while,do,for,switch"
o.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•"
o.commentstring = ""
o.complete = ".,w,b,u,t"
o.completefunc = ""
o.completeslash = ""
o.copyindent = false
o.endoffile = false
o.endofline = true

o.fileencoding = ""
--bo.fileformat  -- left as default
o.filetype = ""
o.fixendofline = true
o.formatexpr = ""
o.formatlistpat = "^\\s*\\d\\+[\\]:.)}\\t ]\\s*"
o.formatoptions = "tcqj"
o.iminsert = 0
o.imsearch = -1
o.includeexpr = ""

o.infercase = false
o.iskeyword = "@,48-57,_,192-255"
o.keymap = ""
o.lisp = true
o.lispoptions = ""
o.matchpairs = "(:),{:},[:]"
--bo.modeline -- left as default
o.modifiable = true
o.modified = false
o.nrformats = "bin,hex"
o.omnifunc = ""
o.preserveindent = false
o.quoteescape = "\\"
o.readonly = false


o.spellcapcheck = "[.?!]\\_[\\])'\"\\t ]\\+"
o.spellfile = ""
o.spelllang = "en"
o.spelloptions = ""
o.suffixesadd = ""
o.swapfile = true
o.synmaxcol = 3000
o.syntax = ""

o.tagfunc = ""
o.textwidth = 0
o.undofile = false
o.varsofttabstop = ""
o.vartabstop = ""
o.wrapmargin = 0
