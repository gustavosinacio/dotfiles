return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {
    map_cr = false,
    map_bs = false, -- map the <BS> key
    map_c_h = true, -- Map the <C-h> key to delete a pair
    map_c_w = true, -- map <c-w> to delete a pair if possible
  },
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
