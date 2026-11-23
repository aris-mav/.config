return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            terminal_colors = true,
            contrast = "medium",
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            dim_inactive = false,
            overrides = {
                SignColumn                  = { bg = "none" },
                StatusLine                  = { bg = "none" },
                StatusLineNC                = { bg = "none" },
                DiagnosticSignError         = { link = "GruvboxRed" },
                DiagnosticSignWarn          = { link = "GruvboxYellow" },
                DiagnosticSignInfo          = { link = "GruvboxBlue" },
                DiagnosticSignHint          = { link = "GruvboxAqua" },
                Pmenu                       = { link = "Normal" },
                FloatBorder                 = { link = "GruvboxBg2" },
                BlinkCmpMenuBorder          = { link = "FloatBorder" },
                BlinkCmpDocBorder           = { link = "FloatBorder" },
                BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
            }
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
