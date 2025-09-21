vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.mouse = "a"

vim.o.showmode = false

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true

vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250

vim.o.splitright = true

vim.o.splitbelow = true

-- vim.o.list = true

-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 8

vim.o.confirm = true

vim.o.termguicolors = true

vim.g.clipboard = {
	name = "xclip-wsl",
	copy = {
		["+"] = { "xclip", "-quiet", "-i", "-selection", "clipboard" },
		["*"] = { "xclip", "-quiet", "-i", "-selection", "primary" },
	},
	paste = {
		["+"] = { "xclip", "-o", "-selection", "clipboard" },
		["*"] = { "xclip", "-o", "-selection", "primary" },
	},
	cache_enabled = 1, -- cache MUST be enabled, or else it hangs on dd/y/x and all other copy operations
}
