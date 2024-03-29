local plugins = {

    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    {
        "famiu/bufdelete.nvim",
        lazy = false,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            auto_install = true,
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "rust-analyzer",
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        opts = {
            preselect = require('cmp').PreselectMode.None,
            completion = { completeopt = "menu,menuone,noselect" },
            mapping = {
                ["<C-u>"] = require('cmp').mapping.scroll_docs(-4),
                ["<C-d>"] = require('cmp').mapping.scroll_docs(4),
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
             config = function()
                require "custom.configs.null-ls"
             end,
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                names = false,
            },
        },
    },

    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end,
    },

}

return plugins
