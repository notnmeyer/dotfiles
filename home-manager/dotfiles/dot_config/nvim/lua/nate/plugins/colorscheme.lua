return {    
  "bluz71/vim-nightfly-guicolors",
  priority = 1000,  -- load first
  config = function()
    vim.cmd([[colorscheme nightfly]])
  end,
}
