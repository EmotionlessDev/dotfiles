return {
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
	},
	{
		-- "L3MON4D3/LuaSnip",
		"SirVer/ultisnips",
		lazy = false,
		dependencies = {
			"honza/vim-snippets",
			"lervag/vimtex",
			"quangnguyen30192/cmp-nvim-ultisnips",
			-- "saadparwaiz1/cmp_luasnip",
			-- "rafamadriz/friendly-snippets",
		},
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
			vim.g.UltiSnipsSnippetDirectories = {
				vim.env.HOME .. "/.config/nvim/UltiSnips/cp",
				vim.env.HOME .. "/.config/nvim/UltiSnips/tex",
				vim.env.HOME .. "/.config/nvim/UltiSnips/py",
			}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		-- event = { "InsertEnter", "CmdlineEnter" },

		config = function()
			-- require("luasnip.loaders.from_vscode").lazy_load()
			-- Set up nvim-cmp.
			-- local luasnip = require("luasnip")
			local cmp = require("cmp")
			local t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
						-- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					-- ["<leader><Tab>"] = cmp.mapping({
					-- 	c = function()
					-- 		if cmp.visible() then
					-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					-- 		else
					-- 			cmp.complete()
					-- 		end
					-- 	end,
					-- 	i = function(fallback)
					-- 		if cmp.visible() then
					-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					-- 		elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
					-- 		else
					-- 			fallback()
					-- 		end
					-- 	end,
					-- 	s = function(fallback)
					-- 		if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
					-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
					-- 		else
					-- 			fallback()
					-- 		end
					-- 	end,
					-- }),
					-- ["<CR>"] = cmp.mapping({
					-- 	i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
					-- 	c = function(fallback)
					-- 		if cmp.visible() then
					-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					-- 		else
					-- 			fallback()
					-- 		end
					-- 	end,
					-- }),
					-- ... Your other configuration ...
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					-- { name = "luasnip" }, -- For luasnip users.
					{ name = "ultisnips" }, -- For ultisnips users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
