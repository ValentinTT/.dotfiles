-- I decided after some time to leave this three plugins together
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"docker_compose_language_service",
					"dockerls",
					"gopls",
					"jdtls",
					"pyright",
					"ts_ls",
                    "sqls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- C/C++
			lspconfig.clangd.setup({ capabilities = capabilities })

			-- Docker Compose
			lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

			-- Docker
			lspconfig.dockerls.setup({ capabilities = capabilities })

			-- Go
			lspconfig.gopls.setup({ capabilities = capabilities })

			-- Java
			lspconfig.jdtls.setup({ capabilities = capabilities })

			-- Python
			lspconfig.pyright.setup({ capabilities = capabilities })

			-- TypeScript / JavaScript
			lspconfig.ts_ls.setup({ capabilities = capabilities })

            -- SQL 
            lspconfig.sqls.setup({
                capabilities = capabilities,
                settings = {
                    sqls = {
                        connections = {
                            {
                                driver = 'mysql',
                                dataSourceName = 'username:password@tcp(127.0.0.1:3306)/database'
                            },
                            {
                                driver = 'postgresql',
                                dataSourceName = 'postgres://user:password@localhost:5432/database?sslmode=disable'
                            }
                        }
                    }
                }
            })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
