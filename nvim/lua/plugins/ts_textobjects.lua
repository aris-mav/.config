return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "BufReadPost",
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {
                    ["@parameter.outer"] = "v", -- charwise
                    ["@function.outer"] = "V",  -- linewise
                },
                include_surrounding_whitespace = true,
            },
            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")

        local select_keymaps = {
            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
            ["ao"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
            ["io"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
            ["ac"] = { query = "@call.outer", desc = "Select outer part of a function call" },
            ["ic"] = { query = "@call.inner", desc = "Select inner part of a function call" },
            ["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
            ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
            ["aC"] = { query = "@class.outer", desc = "Select outer part of a class" },
            ["iC"] = { query = "@class.inner", desc = "Select inner part of a class" },
        }

        for lhs, t in pairs(select_keymaps) do
            vim.keymap.set({ "x", "o" }, lhs, function()
                select.select_textobject(t.query, t.query_group or "textobjects")
            end, { desc = t.desc })
        end

        -- move keymaps: grouped by method -> lhs -> { query, query_group (optional), desc }
        local move_keymaps = {
            goto_next_start = {
                ["]c"] = { query = "@call.outer", desc = "Next function call start" },
                ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
                ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                ["]o"] = { query = "@loop.outer", desc = "Next loop start" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]C"] = { query = "@call.outer", desc = "Next function call end" },
                ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
                ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
                ["]O"] = { query = "@loop.outer", desc = "Next loop end" },
            },
            goto_previous_start = {
                ["[c"] = { query = "@call.outer", desc = "Prev function call start" },
                ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
                ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                ["[o"] = { query = "@loop.outer", desc = "Prev loop start" },
            },
            goto_previous_end = {
                ["[C"] = { query = "@call.outer", desc = "Prev function call end" },
                ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
                ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                ["[O"] = { query = "@loop.outer", desc = "Prev loop end" },
            },
        }

        for method, keymaps in pairs(move_keymaps) do
            for lhs, t in pairs(keymaps) do
                vim.keymap.set({ "n", "x", "o" }, lhs, function()
                    move[method](t.query, t.query_group or "textobjects")
                end, { desc = t.desc })
            end
        end
    end,
}
