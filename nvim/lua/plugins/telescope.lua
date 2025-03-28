return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    lazy = false,
    config = function()
      -- Telescope Configurations
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      --
      -- More info about mappings can be found in:
      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
      --
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "/node_modules", "\\.git" }, -- Ignore certain directories
          follow = true, -- Follow symbolic links
          -- mappings = {
          -- 	i = {
          -- 		["<CR>"] = actions.select_tab,
          -- 	},
          -- 	n = {
          -- 		["<CR>"] = actions.select_tab,
          -- 	},
          -- },
        },
        pickers = {
          find_files = {
            hidden = false,
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
          },
        },
      })

      vim.keymap.set(
        "n",
        "<leader>sG",
        telescope.extensions.live_grep_args.live_grep_args,
        { noremap = true, desc = "[S]earch by [G]rep + args" }
      )
      vim.keymap.set(
        "n",
        "<leader>sf",
        builtin.find_files,
        { desc = "[S]earch [F]iles" }
      )
      vim.keymap.set(
        "n",
        "<leader>sg",
        builtin.live_grep,
        { desc = "[S]earch by [G]rep" }
      )

      vim.keymap.set("n", "<leader>sW", function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end, { desc = "[S]earch <cWORD> by [G]rep" })

      vim.keymap.set(
        "n",
        "<leader>sh",
        builtin.help_tags,
        { desc = "[S]earch [H]elp" }
      )
      vim.keymap.set(
        "n",
        "<leader>sk",
        builtin.keymaps,
        { desc = "[S]earch [K]eymaps" }
      )
      vim.keymap.set(
        "n",
        "<leader>ss",
        builtin.builtin,
        { desc = "[S]earch [S]elect Telescope" }
      )
      vim.keymap.set(
        "n",
        "<leader>sw",
        builtin.grep_string,
        { desc = "[S]earch current [W]ord" }
      )
      vim.keymap.set(
        "n",
        "<leader>sd",
        builtin.diagnostics,
        { desc = "[S]earch [D]iagnostics" }
      )
      vim.keymap.set(
        "n",
        "<leader>sr",
        builtin.resume,
        { desc = "[S]earch [R]esume" }
      )
      -- vim.keymap.set(
      --   "n",
      --   "<leader>s.",
      --   builtin.oldfiles,
      --   { desc = '[S]earch Recent Files ("." for repeat)' }
      -- )
      -- vim.keymap.set(
      --   "n",
      --   "<leader><leader>",
      --   builtin.buffers,
      --   { desc = "[ ] Find existing buffers" }
      -- )

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(
          require("telescope.themes").get_dropdown({
            winblend = 20,
            previewer = true,
          })
        )
      end, { desc = "[/] Fuzzily search in current buffer" })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })

      -- open file_browser with the path of the current buffer
      vim.keymap.set(
        "n",
        "<space>ef",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "[F]ile [B]rowse" }
      )

      telescope.load_extension("live_grep_args")
      -- telescope.load_extension("file_browser")

      local action_state = require("telescope.actions.state")
      local actions = require("telescope.actions")

      Buffer_searcher = function()
        builtin.buffers({
          sort_mru = true,
          ignore_current_buffer = false,
          show_all_buffers = true,
          attach_mappings = function(prompt_bufnr, map)
            -- Move to normal mode on opening
            vim.api.nvim_input("<Esc>")

            local refresh_buffer_searcher = function()
              actions.close(prompt_bufnr)
              vim.schedule(Buffer_searcher)
              vim.cmd("normal! 0")
            end

            local delete_buf = function()
              local selection = action_state.get_selected_entry()
              vim.api.nvim_buf_delete(selection.bufnr, { force = true })
              refresh_buffer_searcher()
            end

            local delete_multiple_buf = function()
              local picker = action_state.get_current_picker(prompt_bufnr)
              local selection = picker:get_multi_selection()
              for _, entry in ipairs(selection) do
                vim.api.nvim_buf_delete(entry.bufnr, { force = false })
              end
              refresh_buffer_searcher()
            end

            map("n", "dd", delete_buf)
            map("n", "<C-d>", delete_multiple_buf)
            map("i", "<C-d>", delete_multiple_buf)

            return true
          end,
        })
      end

      vim.keymap.set("n", "<leader><leader>", Buffer_searcher, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },
}
