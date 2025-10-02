return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            background = {
                light = "macchiato",
                dark = "macchiato",
            },
            auto_integrations = true,
        })
        vim.cmd([[colorscheme catppuccin]])
    end,
}
