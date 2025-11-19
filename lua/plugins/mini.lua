return {
  { 'nvim-mini/mini.nvim', version = false },

  -- mini files
  {

      'nvim-mini/mini.files',
      version = false,
      config = function()
          require('mini.files').setup({
              mappings = {
                  go_in       = '<Right>',      -- Changed from 'l' to right arrow
                  go_in_plus  = '<S-Right>',
                  go_out      = '<Left>',       -- Changed from 'h' to left arrow
                  go_out_plus = '<S-Left>',

              },

              windows = {
                  preview = true,
                  width_focus = 30
              }

          })


          vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", {desc = "toggle mini file explorer"})
          vim.keymap.set("n", "<leader>ef", function()
              MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
              MiniFiles.reveal_cwd()
          end, {desc = "toggle mini file explorer"})
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
    'nvim-mini/mini.comment', version = false,

      config = function()
          require('mini.comment').setup({
          
            mappings = {
              comment = '',
              comment_visual = 'cc',
              comment_line = 'cc',
            },

          })
      end
  }

}
