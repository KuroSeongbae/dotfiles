local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = { "c", "lua", "markdown", "rust", "query", "vim", "vimdoc"  }, -- all errors out on many treesitter
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
	require('ts_context_commentstring').setup {
    enable = true,
    enable_autocmd = false,
  },
}
