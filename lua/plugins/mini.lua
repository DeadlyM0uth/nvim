return {
  { 'nvim-mini/mini.nvim', version = false },

  -- mini files
  {

    'nvim-mini/mini.files',
    version = false,
    config = function()
      require('mini.files').setup({
        mappings = {
          go_in       = '<Right>', -- Changed from 'l' to right arrow
          go_in_plus  = '<S-Right>',
          go_out      = '<Left>',  -- Changed from 'h' to left arrow
          go_out_plus = '<S-Left>',

        },

        windows = {
          preview = true,
          width_focus = 30
        }

      })


      vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "toggle mini file explorer" })
      vim.keymap.set("n", "<leader>ef", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "toggle mini file explorer" })
    end


  },


  {
    'nvim-mini/mini.tabline',
    version = false,

    config = function()
      require("mini.tabline").setup()
    end
  },

  {
    'nvim-mini/mini.comment',
    version = false,

    config = function()
      require('mini.comment').setup({

        mappings = {
          comment = '',
          comment_visual = 'cc',
          comment_line = 'cc',
        },

      })
    end
  },

  {
    'nvim-mini/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup({})
    end
  },

  {
    'nvim-mini/mini.surround',
    version = false,

    config = function()
      require("mini.surround").setup({})
    end
  },

  {
    'nvim-mini/mini.pick',
    version = false,

    config = function()
      require('mini.pick').setup({})

      -- File operations
      vim.keymap.set('n', '<leader>ff', "<cmd>lua MiniPick.builtin.files()<CR>", { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', "<cmd>lua MiniPick.builtin.grep_live()<CR>", { desc = 'Grep in files' })

      -- Buffer operations
      vim.keymap.set('n', '<leader>fb', "<cmd>lua MiniPick.builtin.buffers()<CR>", { desc = 'Find buffers' })
    end

  },

  {
    'nvim-mini/mini.indentscope',
    version = false,

    config = function()
      require("mini.indentscope").setup({})
    end
  },

  {
    'nvim-mini/mini.completion',
    version = false,
    config = function()
      require("mini.completion").setup({})
    end


  },

  {
    'nvim-mini/mini.snippets',
    version = false,

    config = function()
      local gen_loader = require('mini.snippets').gen_loader
      local config_path = vim.fn.stdpath("config")


      local lang_patterns = {
        -- Filetype = { 'pattern1', 'pattern2', ... }
        -- Web Development
        javascript = { 'javascript.json', 'javascriptreact.json' },
        typescript = { 'typescript.json', 'typescriptreact.json' },
        jsx = { 'javascriptreact.json' },
        tsx = { 'typescriptreact.json' },
        vue = { 'vue.json' },
        svelte = { 'svelte.json' },

        -- Backend
        python = { 'python.json' },
        php = { 'php.json' },
        ruby = { 'ruby.json' },

        -- Mobile
        swift = { 'swift.json' },
        kotlin = { 'kotlin.json' },
        dart = { 'dart.json' },

        -- Systems
        c = { 'c.json' },
        cpp = { 'cpp.json' },
        rust = { 'rust.json' },
        go = { 'go.json' },

        -- Scripting
        lua = { 'lua.json' },
        bash = { 'bash.json', 'sh.json' },
        zsh = { 'bash.json', 'sh.json' },

        -- Markup & Styles
        html = { 'html.json' },
        css = { 'css.json' },
        scss = { 'scss.json' },
        json = { 'json.json' },
        yaml = { 'yaml.json' },
      }

      require("mini.snippets").setup({
        mappings = {
          jump_next = '<C-Right>',
          jump_prev = '<C-Left>',
        },

        snippets = {
          -- Always load 'snippets/global.json' from config directory
          gen_loader.from_file(config_path .. '/snippets/global.json'),
          -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
          gen_loader.from_lang({ lang_patterns = lang_patterns }),
        },
      })

      MiniSnippets.start_lsp_server()

    end

  },

  {
    'nvim-mini/mini.icons', version = false,

    config = function()
      require("mini.icons").setup({})
    end
  },

  {
    'nvim-mini/mini.notify', version = false,

    config = function()
      require("mini.notify").setup({})
    end
  },
}

