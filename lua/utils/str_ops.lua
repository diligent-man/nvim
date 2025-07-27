---@param first_chr string
---@param rest_str string
---@return string
local function capitalize(first_chr, rest_str)
    return first_chr:upper() .. rest_str
end


---@param delim string
---@param start number
---@return table
local function split(inp, delim, start)
    start = start or 1

    local i = 1
    local res = {}
    local delim_from, delim_to = string.find(inp, delim, start)

    while delim_from do
        table.insert(res, string.sub(inp, i , delim_from-1))
        i  = delim_to + 1
        delim_from, delim_to = string.find(inp, delim, i)
    end

    table.insert(res, string.sub(inp, i))
    return res
end

return {
    split = split,
    capitalize = capitalize
}
