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
		},
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
			vim.g.UltiSnipsSnippetDirectories = {
				vim.env.HOME .. "/.config/nvim/UltiSnips/cp",
				vim.env.HOME .. "/.config/nvim/UltiSnips/tex",
				vim.env.HOME .. "/.config/nvim/UltiSnips/py",
				vim.env.HOME .. "/.config/nvim/UltiSnips/html",
			}
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,

		config = function()
			local cmp = require("cmp")
			local t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
