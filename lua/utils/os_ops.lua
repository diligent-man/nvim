---@return string
local function os_sep()
    return package.config:sub(1,1)
end


---@return string
local function os_name()
    return os_sep() == "\\" and "win" or "unix"
end


return {
    os_sep = os_sep,
    os_name = os_name
}
