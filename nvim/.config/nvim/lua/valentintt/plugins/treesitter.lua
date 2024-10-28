return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	enabled = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"javascript",
				"jsdoc",
				"typescript",
				"json",
				"asm",
				"cmake",
				"csv",
				"elixir",
				"nginx",
				"python",
				"sql",
				"rust",
				"ssh_config",
				"toml",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
	-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
	-- require("ts_context_commentstring").setup({}),
}
