return {
    "wookayin/semshi",
    version = "0.4.0",
    pin = true,

    build = ":UpdateRemotePlugins",

    init = function()
        -- example, skip if you're OK with the default config
        --vim.g['semshi#error_sign'] = false
    end,

    config = function()
        -- any config or setup that would need to be done after plugin loading
    end
}
