return {
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
			},
			procMacro = {
        ignored = {
					leptos_macro = {
							"component",
							"server",
					},
        },
      },
		},
	},
}
