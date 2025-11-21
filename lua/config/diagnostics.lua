vim.diagnostic.config({
  virtual_text = true,      -- Отключаем виртуальный текст
  signs = true,             -- Включаем знаки на полях
  underline = true,         -- Подчеркивание проблемных мест
  update_in_insert = false, -- Не обновлять в режиме insert
  severity_sort = true,     -- Сортировка по серьезности
})

-- some diagnostics stuff
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
      [vim.diagnostic.severity.WARN] = signs.Warn,
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})


vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })

function OpenAllDiagnostics()
  local buf = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(buf)

  if #diagnostics == 0 then
    vim.notify("No diagnostics found", vim.log.levels.INFO)
    return
  end



  vim.ui.select(
    {
      "Option A",
      "Option B",
      "Option C",
    },
    {prompt = "Choose an option:"},
    function(choice, idx)
      if choice then
        print("You selected: " .. choice .. " at index " .. idx)
      else
        print("No option selected.")
      end
    end
  )
end






