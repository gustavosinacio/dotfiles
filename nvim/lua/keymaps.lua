local myOS = vim.loop.os_uname().sysname
local pureMainMod = "A"

if myOS == "Darwin" then
  pureMainMod = "D"
end

MainMod = "<" .. pureMainMod .. "-"

vim.keymap.set(
  "n",
  "<leader>e",
  vim.diagnostic.open_float,
  { desc = "Show diagnostic [E]rror messages" }
)
vim.keymap.set(
  "n",
  "<leader>q",
  vim.diagnostic.setloclist,
  { desc = "Open diagnostic [Q]uickfix list" }
)

vim.keymap.set("n", "<leader>tt", vim.cmd.Tex, { desc = "[T]oggle [T]ree" })

-- X Mode: ---------------------------------------------------------------------
vim.keymap.set("i", "<C-]>", "<C-X><C-]>")
vim.keymap.set("i", "<C-F>", "<C-X><C-F>")
vim.keymap.set("i", "<C-D>", "<C-X><C-D>")
vim.keymap.set("i", "<C-L>", "<C-X><C-L>")

--------------------------------------------------------------------------------

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move lines up in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move lines down in visual mode

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<left>", "<C-w>2<", { noremap = true })
vim.keymap.set("n", "<down>", "<C-w>-", { noremap = true })
vim.keymap.set("n", "<up>", "<C-w>+", { noremap = true })
vim.keymap.set("n", "<right>", "<C-w>2>", { noremap = true })
