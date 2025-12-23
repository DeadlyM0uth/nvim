return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    branch = "master",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    enabled = true,
    event = {'BufRead', 'BufNewFile'},
    config = function()
      require("nvim-treesitter.configs").setup{
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "go",
          "markdown",
        },

        highlight = {
          enable = true,
        },

        indent = {
          enable = true
        },
      }
    end,
  },
}

