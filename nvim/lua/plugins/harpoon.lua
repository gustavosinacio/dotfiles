return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
    end

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

    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    -- Harpoon add
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "[A]dd file to harpoon" })
    vim.keymap.set("n", "<leader>x", function()
      harpoon:list():remove()
    end, { desc = "[x] file from harpoon" })
    -- Harpoon show files
    vim.keymap.set("n", "<leader>\\", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
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

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>n", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>p", function()
      harpoon:list():next()
    end)
  end,
}
