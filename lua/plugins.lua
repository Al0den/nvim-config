return require("packer").startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use "folke/tokyonight.nvim"

    use {
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require"nvim-tree".setup()
        end
    }

    use "cohama/lexima.vim"

    --Treesitter
    use "nvim-treesitter/nvim-treesitter"

    --Telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    use {
        "nvim-telescope/telescope-project.nvim",
        config = function()
            require "telescope".setup()
            require "telescope".load_extension "project"
            require "telescope".load_extension "file_browser"
            require "telescope".load_extension "fzf"
        end
    }

    --LSP
    use {
        "williamboman/mason.nvim",
        config = function()
            require"mason".setup()
        end
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require"mason-lspconfig".setup()
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require("core.lsp")
        end,
        requires = {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim"
        }
    }

    --CMP
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "onsails/lspkind.nvim"

    --Copilot
    use {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false, auto_refresh = false },
            })
        end
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require"copilot_cmp".setup({})
        end
    }

    --Locals
    use { "~/Desktop/projects/tester",
        config = function()
            require "tester".setup()
        end
    }
    use { "~/Desktop/projects/notion",
        config = function()
            require "notion".setup({
                viewOnEdit = {
                    enabled = false,
                    replace = false,
                },
                noEvent = "Pas d'evenements"
            })
        end,
        require = { "nvim-lua/plenary.nvim" }
    }

    --Others
    use "kyazdani42/nvim-web-devicons"
    use "nvim-lualine/lualine.nvim"
    use {
        "akinsho/bufferline.nvim",
        config = function()
            require"bufferline".setup()
        end
    }
    use "vzytoi/runcode.nvim"
    use { "petertriho/nvim-scrollbar",
        config = function()
            require"scrollbar".setup()
        end
    }
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require"toggleterm".setup()
        end
    }
end)
