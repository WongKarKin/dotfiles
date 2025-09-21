return {
	"gbprod/yanky.nvim",
	opts = {
		ring = {
			history_length = 20,
			sync_with_numbered_registers = true,
		},
		system_clipboard = {
			sync_with_ring = true,
		},
		highlight = { timer = 250 },
	},
	keys = {
		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
		{ "=p", "<Plug>(YankyPutAfterLinewise)", desc = "Put yanked text in line below" },
		{ "=P", "<Plug>(YankyPutBeforeLinewise)", desc = "Put yanked text in line above" },
		{ "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
		{ "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yanky yank" },
	},
	config = function(_, opts)
		-- Set the permanent_wrapper after plugin loaded
		opts.ring.permanent_wrapper = require("yanky.wrappers").remove_carriage_return
		require("yanky").setup(opts)
	end,
}
