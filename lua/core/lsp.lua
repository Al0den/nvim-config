local masonlsp = require("mason-lspconfig")
local servers = masonlsp.get_installed_servers()

local status, _ = pcall(require, "lspconfig")
if (not status) then return end

local capabilities = require "cmp_nvim_lsp".default_capabilities()
capabilities.offsetEncoding = { "utf-8", "utf-16" }

local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

local on_attach = function(client, bufnr)
    client.offsetEncoding = "utf-16"
    require "core.autocmds".lsp()
    local codelens = vim.api.nvim_create_augroup(
        'LSPCodeLens',
        { clear = true }
    )
    vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
        group = codelens,
        callback = function()
            local _, _ = pcall(vim.lsp.codelens.refresh)
        end,
        buffer = bufnr,
    })
end

for _, names in ipairs(servers) do
    require("lspconfig")[names].setup(
        {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = vim.loop.cwd,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        }
    )
end

vim.diagnostic.config {
    update_in_insert = false,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false,

    }
)

-- Autocommand to update diagnostics on cursor movement
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "DiagnosticError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "DiagnosticWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "DiagnosticInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", linehl = "", numhl = "DiagnosticHint" })
