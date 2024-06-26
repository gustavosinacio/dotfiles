return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({ "*" }, {
      -- #e40
      RRGGBB = true,    -- #RRGGBB hex codes
      names = false,    -- "Name" codes like Blue
      RRGGBBAA = false, -- #RRGGBBAA hex codes #ff16ff71
      rgb_fn = true,    -- CSS rgb() and rgba() functions rgb(30,161, 212)
      hsl_fn = true,    -- CSS hsl() and hsla() functions hsl()
      css = true,       -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,    -- Enable all CSS *functions*: rgb_fn, hsl_fn
    })
  end,
}
