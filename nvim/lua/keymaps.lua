local myOS = vim.loop.os_uname().sysname
local pureMainMod = "A"

if myOS == "Darwin" then
	pureMainMod = "D"
end

MainMod = "<" .. pureMainMod .. "-"
print(myOS, MainMod)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "[G]o [G]it" })

vim.keymap.set("n", "<leader>ll", ":Lazy<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Tabs
vim.keymap.set("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", ":tabn<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>p", ":t abp<CR>", { noremap = true })
-- Tabs -
vim.keymap.set("n", "<leader>tmh", ":-tabmove<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tml", ":+tabmove<CR>", { noremap = true })
