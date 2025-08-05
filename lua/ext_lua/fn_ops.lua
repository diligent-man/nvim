---@param func function
---@return function
local function partial(func, ...)
    local fixed_args = {...}

    return function(...)
        local remaining_args = {...}

        local all_args = {}

        for _, v in ipairs(fixed_args) do
            table.insert(all_args, v)
        end

        for _, v in ipairs(remaining_args) do
            table.insert(all_args, v)
        end
        return func(unpack(all_args))
    end
end


return {
    partial = partial
}
