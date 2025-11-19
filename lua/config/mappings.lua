local map = vim.keymap.set
local opts = { noremap = true, silent = true}

vim.g.mapleader = " "
vim.gmaplocalleader = " "


-- Move lines using shift in V-mode
map("v", "<S-Down>", ":m '>+1<CR>gv=gv", {desc = "move lines down in v-mode"})
map("v", "<S-Up>", ":m '<-2<CR>gv=gv", {desc = "move lines up in v-mode"})

map("v", "J", ":m '>+1<CR>gv=gv", {desc = "move lines down in v-mode"})
map("v", "K", ":m '<-2<CR>gv=gv", {desc = "move lines up in v-mode"})

map("n", ";", ":", { desc = "CMD enter command mode" }) 


map("v", "<", "<gv", opts )
map("v", ">", ">gv", opts )

-- Smart Enter key - adds line below with proper indentation
map('n', '<Enter>', 'o<Esc>k1gj', { desc = 'Add new line below' })

-- Shift+Enter for line above
map('n', '<S-Enter>', 'O<Esc>j1gk', { desc = 'Add new line above' })

map({ "n", "v" }, "<leader>y", [["+y]])

map({"n", "v"}, "<leader>d", [["_d]])

map('n', '<A-Down>', function()
  vim.cmd('normal! yyp')
  vim.cmd('normal! k')  -- Move back to original line
end, { desc = 'Duplicate line below and stay' }
)

map("n", "<leader>f", vim.lsp.buf.format)


map("n", "<leader>s", 
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" }
)

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})


-- tab stuff
--vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
--vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
--vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     --go to next
--vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     --go to pre
--vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizox sxally" })
-- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set('n', '<leader>q', '<Cmd>bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>Q', '<Cmd>bd!<CR>', { desc = 'Force close buffer' })

for i = 1, 9 do
  vim.keymap.set('n', '<A-'..i..'>', function() 
    -- Switch to the i-th buffer in the buffer list
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    if bufs[i] then
      vim.cmd('buffer ' .. bufs[i].bufnr)
    end
  end, { desc = 'Go to buffer ' .. i })
end

