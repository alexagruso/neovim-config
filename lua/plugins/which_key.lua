return {
	"folke/which-key.nvim",
	event="VeryLazy",
	keys = {
		{
			"<Leader>",
			function()
				require("which-key").show({global=false})
			end,
			desc="Buffer local keymaps",
		},
	},
	config = function()
		local wk = require("which-key")
	end
}
