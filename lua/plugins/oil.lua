return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.

    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
            },
            keymaps = {
                ["C-h"] = false,
                ["<C-c>"] = false,
                ["<A-v>"] = "actions.select_vsplit",
                ["q"] = "actions.close",
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            skip_confirm_for_simple_edits = true,
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open file explorer"})
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float, {desc = "Toggle float oil"})
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.cursorline = true
            end,
        })
    end
}
