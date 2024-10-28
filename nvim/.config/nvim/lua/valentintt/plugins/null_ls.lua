return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim", -- this is required to use eslint_d
        },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- C/C++
                    null_ls.builtins.formatting.clang_format,

                    -- Java
                    null_ls.builtins.formatting.google_java_format,

                    -- Python
                    null_ls.builtins.formatting.black,
                    -- Alternative Python formatters:
                    -- null_ls.builtins.formatting.autopep8,
                    -- null_ls.builtins.formatting.yapf,

                    -- Go
                    null_ls.builtins.formatting.gofmt,
                    null_ls.builtins.formatting.goimports,

                    -- JSON
                    null_ls.builtins.formatting.prettier,

                    -- JavaScript/TypeScript/JSX
                    null_ls.builtins.formatting.prettier,
                    require("none-ls.diagnostics.eslint_d"),

                    -- Lua
                    null_ls.builtins.formatting.stylua,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "clang-format",
                    "google-java-format",
                    "black",
                    "gofmt",
                    "goimports",
                    "prettier",
                    "eslint_d",
                    "jq"
                },
            })
        end,
    },
}
