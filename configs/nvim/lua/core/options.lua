-- :help options

local options = {
	clipboard = "unnamedplus", -- allow to use system clipboard
	shiftwidth = 2,
	tabstop = 2,
	termguicolors = true,
	number = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
