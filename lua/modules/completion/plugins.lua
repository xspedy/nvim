local completion = {}
local conf = require("modules.completion.config")

completion["neovim/nvim-lspconfig"] = {
	opt = true,
	event = "BufReadPre",
	config = conf.nvim_lsp,
}
completion["creativenull/efmls-configs-nvim"] = {
	opt = false,
	requires = "neovim/nvim-lspconfig",
}
--completion["williamboman/nvim-lsp-installer"] = {
--	opt = false,
--}

completion["williamboman/mason.nvim"] = {
	opt = false,
	requires = {
		{
			"williamboman/mason-lspconfig.nvim",
		},
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = conf.mason_install },
	},
}
--completion["kevinhwang91/nvim-bqf"] = {
--	opt = true,
--	ft = "qf",
--	config = conf.bqf,
--}
--completion["tami5/lspsaga.nvim"] = {
--	opt = true,
--	after = "nvim-lspconfig",
--}
--completion["stevearc/aerial.nvim"] = {
--	opt = true,
--	after = "nvim-lspconfig",
--	config = conf.aerial,
--}
completion["glepnir/lspsaga.nvim"] = {
	opt = false,
	event = "LspAttach",
	--requires = { { "antoinemadec/FixCursorHold.nvim", opt = true } },
	config = conf.lspsaga,
}

completion["ray-x/lsp_signature.nvim"] = { opt = true, after = "nvim-lspconfig" }
completion["hrsh7th/nvim-cmp"] = {
	config = conf.cmp,
	event = "InsertEnter",
	requires = {
		{ "onsails/lspkind.nvim" },
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		{ "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		{ "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		{ "hrsh7th/cmp-path", after = "cmp-tmux" },
		{ "f3fora/cmp-spell", after = "cmp-path" },
		{ "hrsh7th/cmp-buffer", after = "cmp-spell" },
		{ "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
		-- {
		--     'tzachar/cmp-tabnine',
		--     run = './install.sh',
		--     after = 'cmp-spell',
		--     config = conf.tabnine
		-- }
	},
}
completion["L3MON4D3/LuaSnip"] = {
	after = "nvim-cmp",
	config = conf.luasnip,
	requires = "rafamadriz/friendly-snippets",
}
completion["windwp/nvim-autopairs"] = {
	after = "nvim-cmp",
	config = conf.autopairs,
}
-- completion['github/copilot.vim'] = {
--     opt = true,
--     cmd = "Copilot"
-- }

completion["zbirenbaum/copilot.lua"] = {
	event = "VimEnter",
	config = function()
		vim.defer_fn(function()
			require("copilot").setup()
		end, 100)
	end,
}
completion["zbirenbaum/copilot-cmp"] = {
	after = "copilot.lua",
	config = function()
		require("copilot_cmp").setup()
	end,
}

return completion
