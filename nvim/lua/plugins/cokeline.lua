return {
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for v0.4.0+
      "nvim-tree/nvim-web-devicons", -- If you want devicons
      "stevearc/resession.nvim", -- Optional, for persistent history
    },
    config = function()
      local cokeline = require("cokeline")

      cokeline.setup({
        buffers = {
          -- new_buffers_position = harpoon_sorter(),
        },
        -- The default highlight group values.
        -- The `fg`, `bg`, and `sp` keys are either colors in hexadecimal format or
        -- functions taking a `buffer` parameter and returning a color in
        -- hexadecimal format. Style attributes work the same way, but functions
        -- should return boolean values.
        default_hl = {
          -- default: `ColorColumn`'s background color for focused buffers,
          -- `Normal`'s foreground color for unfocused ones.
          ---@type nil | string | fun(buffer: Buffer): string
          fg = function(buffer)
            return buffer.is_focused and "#000000" or "#999999"
          end,

          ---@type nil | string | function(buffer: Buffer): string,
          bg = function(buffer)
            local hlgroups = require("cokeline.hlgroups")
            return buffer.is_focused and hlgroups.get_hl_attr("Normal", "fg")
              or hlgroups.get_hl_attr("ColorColumn", "bg")
          end,

          -- default: unset.
          ---@type nil | string | function(buffer): string,
          sp = nil,
          ---@type nil | boolean | fun(buf: Buffer):boolean
          bold = nil,
          ---@type nil | boolean | fun(buf: Buffer):boolean
          italic = nil,
          ---@type nil | boolean | fun(buf: Buffer):boolean
          underline = nil,
          ---@type nil | boolean | fun(buf: Buffer):boolean
          undercurl = nil,
          ---@type nil | boolean | fun(buf: Buffer):boolean
          strikethrough = nil,
        },
      })
    end,
  },
}
