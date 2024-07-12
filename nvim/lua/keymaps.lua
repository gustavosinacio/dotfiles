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

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tabs
vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
-- Tabs -
vim.keymap.set("n", "<leader>tmh", ":-tabmove<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tml", ":+tabmove<CR>", { noremap = true })

-- Window resizing-
vim.keymap.set("n", "<M-=>", "<C-w>+")
vim.keymap.set("n", "<M-->", "<C-w>-")
vim.keymap.set("n", "<M-,>", "<C-w>2<")
vim.keymap.set("n", "<M-.>", "<C-w>2>")

vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")

vim.keymap.set("n", "<leader>ex", vim.cmd.Tex, { desc = "[EX]plore" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set("n", "<Tab>", vim.cmd.bnext) -- shift next buffer
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev) -- shift prev buffer

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move lines up in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move lines down in visual mode

vim.keymap.set("n", "J", "mzJ`z") -- Join line without moving cursor to end of line
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- half page down and center screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- half page up and center screen
vim.keymap.set("n", "G", "Gzz") -- whole page down and center screen
vim.keymap.set("n", "n", "nzz") -- next and center
vim.keymap.set("n", "N", "Nzz") -- Net and center

vim.keymap.set("n", "<leader>x", ":w<CR>:so<CR>")
