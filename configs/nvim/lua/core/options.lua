-- :help options

local options = {
	shiftwidth = 2,
	tabstop = 2,
	termguicolors = true,
	number = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
