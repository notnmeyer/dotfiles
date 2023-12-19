local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {import = "nate.plugins"},
  {import = "nate.plugins.lsp"},
}, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true, -- check for plugin updates
    notify = false, -- but be quiet about them
  },
  change_detection = {
    notify = true,
  },
})
