return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    require("telescope.config")

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "v", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "s", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "t", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    -- Harpoon add
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "[A]dd file to harpoon" })
    -- Harpoon show files
    vim.keymap.set("n", "<leader>\\", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", MainMod.."]>", function()
      harpoon:list():next()
    end)
    vim.keymap.set("n", MainMod.."[>", function()
      harpoon:list():prev()
    end)
    -- Harpoon select file
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end)
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end)
    vim.keymap.set("n", "<leader>6", function()
      harpoon:list():select(6)
    end)
    vim.keymap.set("n", "<leader>7", function()
      harpoon:list():select(7)
    end)
    vim.keymap.set("n", "<leader>8", function()
      harpoon:list():select(8)
    end)
    vim.keymap.set("n", "<leader>9", function()
      harpoon:list():select(9)
    end)
    vim.keymap.set("n", "<leader>0", function()
      harpoon:list():select(10)
    end)
  end,
}
