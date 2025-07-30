return {
    "nvimdev/dashboard-nvim",
    commit = "c42fcfbd96dfcaa486c0a0ab52494316f1c31350",
    pin = true,

    dependencies = {"nvim-tree/nvim-web-devicons"},
    event = 'VimEnter',

    config = function()
        require('dashboard').setup{}
    end
}
