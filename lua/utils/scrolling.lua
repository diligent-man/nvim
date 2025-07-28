require("utils.alias")
require("utils.constant")

---@return
function get_scrolloff()
    return  math.floor(winheight(0) * SCROLLOFF_PERCENT)
end


function get_sidescrolloff()
    return math.floor(winwidth(0) * SIDESCROLLOFF_PERCENT)
end


return {
    get_scrolloff = get_scrolloff,
    get_sidescrolloff = get_sidescrolloff
}
