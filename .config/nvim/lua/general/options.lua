-- set options
local options = {
	opt = {
		clipboard = "unnamedplus",
		cmdheight = 0,
		completeopt = { "menu", "menuone", "noselect" },
		conceallevel = 2,
		copyindent = true,
		cursorline = true,
		expandtab = false,
		fileencoding = "utf-8",
		fillchars = { eob = " " }, -- do not display tildes after end of file
		foldenable = true,
		foldlevel = 99,
		foldlevelstart = 99,
		foldcolumn = "1",
		history = 100,
		ignorecase = true,
		infercase = true,
		laststatus = 3,
		linebreak = true,
		mouse = "a",
		number = true,
		preserveindent = true,
		pumheight = 10,
		relativenumber = true,
		shiftwidth = 4,
		showmode = false,
		showtabline = 2,
		signcolumn = "yes",
		smartcase = true,
		splitbelow = true,
		splitright = true,
		swapfile = false,
		tabstop = 4,
		termguicolors = false,
		timeoutlen = 500,
		undofile = true,
		updatetime = 300,
		virtualedit = "block",
		wrap = false,
		writebackup = false,
	},
	g = {
		mapleader = " ",
		maplocalleader = ",",
	},
}

for scope, table in pairs(options) do
	for setting, value in pairs(table) do
		vim[scope][setting] = value
	end
end
