-- return {
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     opts = {
--         ensure_installed = { 'bash', 'c', 'diff', 'html', 'luadoc', 'markdown', 'vim', 'vimdoc', 'rust' },
--         -- Future Ross DO NOT CHANGE THE AUTO_INSTALL
--         -- Tries to install and causes error message at startup
--         auto_install = false,
--         highlight = {
--             enable = true,
--         },
--         indent = { enable = true },
--     },
--     config = function(_, opts)
--         require('nvim-treesitter.install').prefer_git = true
--         ---@diagnostic disable-next-line: missing-fields
--         require('nvim-treesitter.configs').setup(opts)
--     end,
-- }

local treesitter = require(treesitter)
tresitter.setup({
    
})
