return {
  {
    'nvim-mini/mini.nvim',
    version = false,

    config = function()
      -- MINI FILES CONFIG
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

      vim.keymap.set(
        "n",
        "<leader>ee",
        "<cmd>lua MiniFiles.open()<CR>",
        { desc = "toggle mini file explorer" }
      )

      vim.keymap.set("n", "<leader>ef", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "toggle mini file explorer" })

      -- MINI TABLINE
      require("mini.tabline").setup()

      -- MINI COMMENT
      require('mini.comment').setup({

        mappings = {
          comment = '',
          comment_visual = '<C-/>',
          comment_line = '<C-/>',
        },
      })

      -- MINI PAIRS
      require('mini.pairs').setup({})

      -- MINI SURROUND
      require("mini.surround").setup({})

      -- MINI PICK
      require('mini.pick').setup({})

      -- File operations
      vim.keymap.set(
        'n',
        '<leader>ff',
        "<cmd>lua MiniPick.builtin.files()<CR>",
        { desc = 'Find files' }
      )
      vim.keymap.set(
        'n',
        '<leader>fg',
        "<cmd>lua MiniPick.builtin.grep_live()<CR>",
        { desc = 'Grep in files' }
      )
      -- Buffer operations
      vim.keymap.set(
        'n',
        '<leader>fb',
        "<cmd>lua MiniPick.builtin.buffers()<CR>",
        { desc = 'Find buffers' }
      )

      -- MINI INDENTSCOPE
      require("mini.indentscope").setup()

      -- MINI COMPLETION
      require("mini.completion").setup()
      require("mini.icons").setup()
      require("mini.notify").setup()
      require("mini.splitjoin").setup()

      -- MINI NIPPETS
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

      -- MINI STARTER
      local starter = require("mini.starter")
      starter.setup({
        header = table.concat({
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀⠀⣠⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀',
          'ow⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠋⠀⠹⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⢹⡇ow⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀meow⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⠸⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀me',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀meo⢻⡇⠀⠀⠀⠀⣿⣠⣤⣤⣄⠀meow⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣸⣧⠀⠀⠀⠀⣿⡏⠀⠈⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          'w⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡾⠉⠉⠟⠀⠀⠀⠀⠉⠁⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠀⠀⠀m⢠⣶⣦w⠀⠀⢸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⣠⣄⠀⠀⠀⠀⠀⢀⣾⠁⢹⣧⠀m⢈⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠏⠀⠀⠀⠀⠀⠀meow⠀⠀',
          '⣿⠛⢷⣤⣤⡴⠶⠾⠃⠀⠀⣿⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⠏w⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢻⡆⣀⡀⠀⠀⠀⠀⣀⣀⠀⣿⡟⠁⠀⠀⠀⠀⠀⢀⣠⣤⠶⠞⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠸⣿⡿⠟⣿⣄⡾⠟⡛⢓⣿⠋⠀⠀⠀⣀⣤⡶⠞⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀meo',
          '⠀⠹⣷⣼⣁⣽⣧⣽⠿⠋⢁⣠⣴⠶⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⣠⡿⠛⠉⠁⠀⠀⠰⣯⣁⣠⠴⠛⢻⡆meow⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢀⣾⠋⢀⣄⠀⠀⠀⣀⠀⢿⡷⠦⠴⠶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⢸⡏⢠⣿⢹⣧⠀⣾⠻⣧⠘⣿w ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀m',
          '⠘⢷⠟⠁⢸⡏⠀⣿⠀⠻⣦⣿⡇⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀meo⢸⡇⢸⡟⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
          '⠀⠀⠀⠀⠈⠙⠋⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀meow⠀⠀⠀⠀⠀meo',
        }, '\n'),

        footer = "",

        items = {
          starter.sections.recent_files(10, true),
          starter.sections.builtin_actions(),
        },
        starter.gen_hook.adding_bullet("")
      })
    end,
  },
}
