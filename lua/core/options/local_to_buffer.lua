require("utils.alias")

-- Finding regex: \s\s\slocal to buffer\s\s.
-- Use with Regular Expression Search in Chrome

---------------------------------------------------------------------------------------------------------------------------
--- Scrolling ---
bo.scrollback = 10000  -- max lines kept beyond the visible screen & deleted if new lines exceed this limit. Only terminal buffer
---------------------------------------------------------------------------------------------------------------------------


bo.autoindent = true
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
bo.expandtab = false
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

bo.shiftwidth = 8
bo.smartindent = false
bo.softtabstop = 0
bo.spellcapcheck = "[.?!]\\_[\\])'\"\\t ]\\+"
bo.spellfile = ""
bo.spelllang = "en"
bo.spelloptions = ""
bo.suffixesadd = ""
bo.swapfile = true
bo.synmaxcol = 3000
bo.syntax = ""
bo.tabstop = 8
bo.tagfunc = ""
bo.textwidth = 0
bo.undofile = false
bo.varsofttabstop = ""
bo.vartabstop = ""
bo.wrapmargin = 0
