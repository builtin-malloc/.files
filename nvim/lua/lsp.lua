local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

local servers = {
    clangd = {
        cmd = { "clangd" }
    },
    pyright = {},
    hls = {},
    html = {},
    cssls = {},
--    tsserver = {},
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
    },
    emmet_ls = {
        filetypes = {
            "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte"
        },
        init_options = {
            html = {
                options = {
                    ["output.selfClosingStyle"] = "xhtml"
                }
            }
        }
    }
}

for server, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    lspconfig[server].setup(config)
end
