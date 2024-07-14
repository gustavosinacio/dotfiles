-- To run this code on save, source the debug.lua file
local buffnumber = 112

local clients = vim.lsp.get_active_clients()
local inspected_clients = vim.inspect(clients)
local client_lines = vim.split(inspected_clients, "\n")

local prettyNow = os.date("%A, %B %d %Y at %I:%M:%S %p")
-- Adds lines to start of file, overwritting everything
vim.api.nvim_buf_set_lines(buffnumber, 0, -1, false, { prettyNow })

-- Appends lines to end of file, no overwritting
vim.api.nvim_buf_set_lines(buffnumber, -1, -1, false, { "hey there" })
