vim.diagnostic.config({
  virtual_text = true,     -- Отключаем виртуальный текст
  signs = true,             -- Включаем знаки на полях
  underline = true,         -- Подчеркивание проблемных мест
  update_in_insert = false, -- Не обновлять в режиме insert
  severity_sort = true,     -- Сортировка по серьезности
  virtual_lines = false,
})

-- some diagnostics stuff
Signs = { Error = " ", Warn = " ", Info = " ", Hint = "" }

-- Highlight entire line for errors
-- Highlight the line number for warnings
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = Signs.Error,
      [vim.diagnostic.severity.WARN] = Signs.Warn,
      [vim.diagnostic.severity.INFO] = Signs.Info,
      [vim.diagnostic.severity.HINT] = Signs.Hint,
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})



vim.keymap.set('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle diagnostic virtual_lines' })

-- Command to Pick diagnostics of a buffer
vim.api.nvim_create_user_command(
  "OpenDiagnostics",
  function()
    local buffer = vim.api.nvim_get_current_buf()
    local diagnostic_arr = vim.diagnostic.get(buffer)

    if #diagnostic_arr == 0 then
      vim.notify("No diagnostics found")
      return
    end

    local severity_icons = {
      [vim.diagnostic.severity.ERROR] = Signs.Error,
      [vim.diagnostic.severity.WARN] = Signs.Warn,
      [vim.diagnostic.severity.INFO] = Signs.Info,
      [vim.diagnostic.severity.HINT] = Signs.Hint,
    }
    local severity_names = {
      [vim.diagnostic.severity.ERROR] = "Err ",
      [vim.diagnostic.severity.WARN]  = "Warn",
      [vim.diagnostic.severity.INFO]  = "Info",
      [vim.diagnostic.severity.HINT]  = "Hint",
    }
    -- Преобразуем diagnostics в список объектов
    local items = {}
    for _, diag in ipairs(diagnostic_arr) do
      table.insert(items, {
        text = string.format(" %s [%s] | %d | %s",
          severity_icons[diag.severity],
          severity_names[diag.severity],
          diag.lnum + 1,
          diag.message
        ),
        lnum = diag.lnum,
        severity = diag.severity,
      })
    end
    -- MiniPick UI select с фильтром по severity
    MiniPick.ui_select(items, {
      prompt = "Diagnostics (type to filter):",
      format_item = function(item)
        return item.text
      end,
    }, function(selected)
      if selected then
        vim.api.nvim_win_set_cursor(0, { selected.lnum + 1, 0 })
        vim.cmd("normal! zz") -- центрируем экран на строке
      end
    end)
  end, {}
)

vim.keymap.set('n', "<leader>fd", ":OpenDiagnostics<CR>", { desc = "LSP open all diagnostics of a buffer" })

vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })
