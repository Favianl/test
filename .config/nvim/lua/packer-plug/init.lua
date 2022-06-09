local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	---- Themes ------
	-- theme nightfox
	use("EdenEast/nightfox.nvim")
	-- theme tokio night
	use("folke/tokyonight.nvim")
	-- github theme
	use("projekt0n/github-nvim-theme")
	-- moonfly theme
	use("bluz71/vim-moonfly-colors")
	-- onedark
	use("joshdick/onedark.vim")
	-- material
	use("marko-cerovac/material.nvim")

	-- tree
	use("kyazdani42/nvim-tree.lua")
	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer

	-- Autocompletado
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- Formatear
	use("jose-elias-alvarez/null-ls.nvim")

	--notify
	use("rcarriga/nvim-notify")
	--lualine
	use("nvim-lualine/lualine.nvim")
	-- barbar
	use("romgrk/barbar.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Comment

	-- autopairs
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- Comment
	use("numToStr/Comment.nvim") -- Easily comment stuff

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Hop
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
	})

	-- Multi Cursor
	use({
		"mg979/vim-visual-multi",
		branch = "master",
	})

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")
	-- Color Converter
	use("NTBBloodbath/color-converter.nvim")

	-- Toggle Terminal
	use("akinsho/toggleterm.nvim")
	-- Indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
