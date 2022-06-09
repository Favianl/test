require("settings")
require("mappings")
require("packer-plug")
require("tree")
require("lsp")
require("lsp.null-ls")
require("telescope")
require("cmp-config.cmp")
require("treesitter")
require("lualine-config")
require("barbar")
require("autopairs")
require("comment")
require("gitsigns")
require("hop-config")
require("colorizer-config")
require("toggle-term")
require("indent-bl")
require("notify-conf")

--------- THEMES ------------

-- require("colors.nightfox")

-- require("colors.tokyonight")

--[[ require("github-theme").setup({
	theme_style = "dark_colorblind",
}) ]]

-- vim.cmd([[colorscheme moonfly]])

-- vim.cmd([[colorscheme onedark]])

vim.g.material_style = "deep ocean"
vim.cmd([[colorscheme material]])
