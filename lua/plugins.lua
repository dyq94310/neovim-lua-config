local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'

    -- 你的插件列表...
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -------------------------- plugins -------------------------------------------
    -- nvim-tree (新增)
    use ({
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    })

    -- bufferline
    use { "akinsho/bufferline.nvim", requires = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" }}

    -- lualine (新增)
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } })
    -- telescope extensions
    use({"LinArcX/telescope-env.nvim"})
    -- dashboard
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    --------------------- LSP --------------------
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })

    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
   
    --------------------- DAP--------------------
    use ('mfussenegger/nvim-dap')
    use ('theHamsta/nvim-dap-virtual-text')
    use ('rcarriga/nvim-dap-ui')
    use ('mfussenegger/nvim-dap-python')
    use ('nvim-telescope/telescope-dap.nvim')


    --------------------------------------------
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    -- 常用图标
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- 代码格式化 (新增)
    -- use("mhartington/formatter.nvim")
    use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 显示
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
