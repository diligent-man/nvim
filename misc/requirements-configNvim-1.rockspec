rockspec_format = "3.0"
package = "requirements"
version = "configNvim-1"

source = {
  url = ""
}

-- json4lua must be not install due to nvim's LSP API conflict
dependencies = {
  -- "json4lua == 0.9.30-1"
  "luafilesystem == 1.8.0",
}
