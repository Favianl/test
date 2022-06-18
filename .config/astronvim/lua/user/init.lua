local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Set colorscheme
	-- colorscheme = "material",
	-- colorscheme = "nightfox", -- nordfox nightfox terafox duskfox
	colorscheme = "tokyonight",
	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
			mouse = "a",
			errorbells = true,
			shiftwidth = 2,
			expandtab = true,
			smartindent = true,
			number = true,
			numberwidth = 1,
			swapfile = false,
			backup = false,
			incsearch = true,
			clipboard = "unnamedplus",
			ignorecase = true,
			fileencoding = "utf-8",
			cursorline = true,
			showcmd = true,
			ruler = true,
			showmatch = true,
			laststatus = 2,
			showmode = false,
			foldmethod = "manual",
			termguicolors = true,
		},
		g = {
			-- material_style = "deep ocean", -- material theme
			tokyonight_style = "night", -- night day storm
			mapleader = " ", -- sets vim.g.mapleader
		},
	},

	-- Default theme configuration
	default_theme = {
		diagnostics_style = { italic = true },
		-- Modify the color table
		colors = {
			fg = "#abb2bf",
		},
		-- Modify the highlight groups
		highlights = function(highlights)
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
		plugins = { -- enable or disable extra plugin highlighting
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Disable AstroNvim ui features
	ui = {
		nui_input = true,
		telescope_select = true,
	},

	-- Configure plugins
	plugins = {
		-- Add plugins, the packer syntax without the "use"
		init = {
			{ "marko-cerovac/material.nvim" },
			{ "NTBBloodbath/color-converter.nvim" },
			{
				"phaazon/hop.nvim",
				branch = "v1", -- optional but strongly recommended
			},
			{ "EdenEast/nightfox.nvim" },
			{ "folke/tokyonight.nvim" },
			{
				"mg979/vim-visual-multi",
				branch = "master",
			},
			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },

			-- You can also add new plugins here as well:
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
		},
		-- All other entries override the setup() call for default plugins

		colorizer = {
			{ "*" },
			{
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = true, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all css features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				mode = "background", -- Set the display mode
			},
		},

		-- hop = {
		-- 	require("hop").setup({ keys = "etovxqpdygfblzhckisuran" }),
		-- },

		["null-ls"] = function(config)
			local null_ls = require("null-ls")
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.rufo,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				-- Set a linter
				null_ls.builtins.diagnostics.rubocop,
			}
			-- set up null-ls's on_attach function
			config.on_attach = function(client)
				-- NOTE: You can remove this on attach function to disable format on save
				if client.resolved_capabilities.document_formatting then
					vim.api.nvim_create_autocmd("BufWritePre", {
						desc = "Auto format before save",
						pattern = "<buffer>",
						callback = vim.lsp.buf.formatting_sync,
					})
				end
			end
			return config -- return final config table
		end,
		treesitter = {
			ensure_installed = { "lua", "javascript", "css", "html" },
			rainbow = {
				disable = {},
			},
		},
		["nvim-lsp-installer"] = {
			ensure_installed = { "sumneko_lua", "tsserver", "html", "cssls", "emmet_ls" },
		},
		packer = {
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
		cmp = function(config)
			local cmp = require("cmp")
			config.mapping["<CR>"] = cmp.mapping.confirm({ select = true })
			config.experimental = { ghost_text = true }
			return config
		end,
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- Modify which-key registration
	["which-key"] = {
		-- Add bindings
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- which-key registration table for normal mode, leader prefix
					-- ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
				},
			},
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without lsp-installer
		servers = {
			-- "pyright"
		},
		-- add to the server on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the lsp installer server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = {
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- This function is run last
	-- good place to configure mappings and vim options
	polish = function()
		-- Set key bindings
		vim.keymap.set("n", "<C-s>", ":w!<CR>")
		-- Change format color
		vim.keymap.set("n", "<leader>9", "<Plug>ColorConvertCycle")
		----- Quit whitout save ----
		vim.keymap.set("n", "<leader>0", ":q!<CR>")
		vim.keymap.del("n", "<C-q>")
		------ Remove search highlight ------
		vim.keymap.set("n", "<Esc><Esc>", ":nohlsearch<CR>")
		vim.keymap.del("n", "<leader>h")

		--------- Move text up and down ------
		-- move line normal mode
		vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
		vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
		-- move line insert mode
		vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
		vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
		-- move block visual mode
		vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
		vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

		---------------- Hop Mappings ---------------
		vim.keymap.set("n", "<leader>h", ":HopWord<cr>")
		vim.keymap.set("n", "<leader>hh", ":HopChar2<cr>")
		vim.keymap.set("n", "<leader>hd", ":HopChar1<cr>")
		vim.keymap.set("n", "<leader>hl", ":HopLine<cr>")

		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
