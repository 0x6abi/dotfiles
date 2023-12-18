vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

for _, source in ipairs {
	"general.options"
} do
	local status_ok, fault = pcall(require, source)
	if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

-- install lazy
local lazypath = vim.fn.stdpath 'data' ..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
