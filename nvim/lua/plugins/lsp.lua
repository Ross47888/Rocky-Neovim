local cmp = require('cmp')
local cmp_lsp = require("cmp_nvim_lsp")
local luasnip = require('luasnip')
local capabilities = vim.tbl_deep_extend(
"force",
{},
vim.lsp.protocol.make_client_capabilities(),
cmp_lsp.default_capabilities())

require("fidget").setup({})

local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
    cmd = {"/home/legion/.local/bin/lua-language-server"},
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
            }
        }
    }
}
lspconfig.rust_analyzer.setup({
    cmd = {"/home/legion/.local/bin/rust-analyzer"},
    capabilites = require("cmp_nvim_lsp").default_capabilities(),
})
lspconfig.bash_language_server.setup({
    cmd = {"/home/legion/.local/bin/bash-language-server"},
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        }, {
        { name = 'buffer' },
    })
})

vim.diagnostic.config({
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
