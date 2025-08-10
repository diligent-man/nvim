require("utils.alias")

-- Finding regex: \s\s\slocal to buffer\s\s.
-- Use with Regular Expression Search in Chrome

---------------------------------------------------------------------------------------------------------------------------
--- Scrolling ---
bo.scrollback = 10000  -- max lines kept beyond the visible screen & deleted if new lines exceed this limit. Only terminal buffer
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
--- Indentation ---
bo.tabstop = 4
bo.shiftwidth = 4  -- Indent have width of 4
bo.softtabstop = 0  -- # cols for a <Tab>. O for off feature
bo.expandtab = true  -- convert <Tab> to <Space>
bo.autoindent = true  -- copy indent from current to new line
bo.smartindent = true  -- use softtabstop instead
---------------------------------------------------------------------------------------------------------------------------



bo.binary = false
bo.bomb = false
bo.bufhidden = ""
bo.buflisted = on
bo.buftype = ""
--bo.busy = 0
--bo.channel = 0
bo.cindent = false
bo.cinkeys = "0{,0},0),0],:,0#,!^F,o,O,e"
bo.cinoptions = ""
bo.cinscopedecls = "public,protected,private"
bo.cinwords = "if,else,while,do,for,switch"
bo.comments = "s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-,fb:•"
bo.commentstring = ""
bo.complete = ".,w,b,u,t"
bo.completefunc = ""
bo.completeslash = ""
bo.copyindent = false
bo.endoffile = false
bo.endofline = true

bo.fileencoding = ""
--bo.fileformat  -- left as default
bo.filetype = ""
bo.fixendofline = true
bo.formatexpr = ""
bo.formatlistpat = "^\\s*\\d\\+[\\]:.)}\\t ]\\s*"
bo.formatoptions = "tcqj"
bo.iminsert = 0
bo.imsearch = -1
bo.includeexpr = ""
bo.indentexpr = ""
bo.indentkeys = "0{,0},0),0],:,0#,!^F,o,O,e"
bo.infercase = false
bo.iskeyword = "@,48-57,_,192-255"
bo.keymap = ""
bo.lisp = true
bo.lispoptions = ""
bo.matchpairs = "(:),{:},[:]"
--bo.modeline -- left as default
bo.modifiable = true
bo.modified = false
bo.nrformats = "bin,hex"
bo.omnifunc = ""
bo.preserveindent = false
bo.quoteescape = "\\"
bo.readonly = false


bo.spellcapcheck = "[.?!]\\_[\\])'\"\\t ]\\+"
bo.spellfile = ""
bo.spelllang = "en"
bo.spelloptions = ""
bo.suffixesadd = ""
bo.swapfile = true
bo.synmaxcol = 3000
bo.syntax = ""

bo.tagfunc = ""
bo.textwidth = 0
bo.undofile = false
bo.varsofttabstop = ""
bo.vartabstop = ""
bo.wrapmargin = 0
