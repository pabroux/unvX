return {
	"ibhagwan/fzf-lua",
	opts = function(_, opts)
		local fzf = require("fzf-lua")
		local config = fzf.config
		local actions = fzf.actions

		-------------------------------------------------------------------------------
		-- Keymaps
		-------------------------------------------------------------------------------

		config.defaults.actions.files["Ì"] = { fn = actions.toggle_hidden, reuse = true, header = false }
		config.defaults.actions.files["Ï"] = { fn = actions.toggle_ignore, reuse = true, header = false }

		return opts
	end,
}
