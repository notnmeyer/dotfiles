return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gs"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>f"] = { name = "+Telescope" },
      ["<leader>e"] = { name = "+File Tree" },
      ["<leader>h"] = { name = "+Harpoon" },
      ["<leader>m"] = { name = "+Formatting"},
      ["<leader>s"] = { name = "+Search" },
      ["<leader>w"] = { name = "+Session" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
