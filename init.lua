-- 基础设置
require('basic')

-- 快捷键映射
require("keybindings")
-- 插件
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")

---lsp
require("lsp.mason")
require("lsp.cmp")
require("lsp.ui")
require("lsp.null-ls")


---DAP
require("dap.python")
