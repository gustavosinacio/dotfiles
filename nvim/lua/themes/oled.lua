local OLED = {}

OLED.setup = function()
  -- Define your colors
  local colors = {
    bg = "#020202",
    fg = "#fbf2ff",
    red = "#f04c65",
    green = "#96ff2E",
    yellow = "#FFD700",
    orange = "#fe8e40",
    blue = "#61cfff",
    magenta = "#c678dd",
    cyan = "#56e6f2",
    white = "#ffffff",
    black = "#000000",
    gray = "#657484",
    purple = "#9060e0",
    lightPurple = "#d8b8fd",
  }

  local tokens = {
    string = colors.lightPurple,
    comments = colors.gray,
  }

  -- Apply the colors to different syntax groups
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.g.colors_name = "OLED"

  vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "Comment", { fg = colors.gray, italic = true })
  vim.api.nvim_set_hl(0, "String", { fg = tokens.string })
  vim.api.nvim_set_hl(0, "Function", { fg = colors.green })
  vim.api.nvim_set_hl(0, "Identifier", { fg = colors.red })
  vim.api.nvim_set_hl(0, "Statement", { fg = colors.magenta })
  vim.api.nvim_set_hl(0, "Type", { fg = colors.cyan })
  vim.api.nvim_set_hl(0, "Special", { fg = colors.orange })

  -- Set colors for UI elements
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2c323c" })
  vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2c323c" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.fg })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.bg })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg, fg = colors.fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.blue, fg = colors.black })
  vim.api.nvim_set_hl(0, "Visual", { bg = colors.blue, fg = colors.black })
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.red })
  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.red, bold = true })
  vim.api.nvim_set_hl(0, "Search", { bg = colors.yellow, fg = colors.black })
  vim.api.nvim_set_hl(
    0,
    "IncSearch",
    { bg = colors.magenta, fg = colors.black }
  )
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.red })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.cyan })

  vim.api.nvim_set_hl(0, "NeoTreeGitAdded", { fg = colors.green })
  vim.api.nvim_set_hl(0, "NeoTreeGitDeleted", { fg = "#F92672" })
  vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = "#66D9EF" })
  vim.api.nvim_set_hl(0, "NeoTreeGitRenamed", { fg = "#FFD700" })
  vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#96d22E" })
  vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#75717E" })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#FFD700" })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#fafaff" })
  vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#fafaff" })
end

return OLED
