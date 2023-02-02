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
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
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
