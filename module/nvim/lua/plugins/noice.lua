return {
	"folke/noice.nvim",
	opts = function(_, opts)
		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		-- Render the command via `{cmdline}`
		opts.views = opts.views or {}
		opts.views.shell_output = {
			view = "split",
			format = { "{cmdline}", "\n", "{message}", "\n" },
		}

		opts.routes = opts.routes or {}

		-- Skip the echo, the output message carries the cmdline
		table.insert(opts.routes, {
			filter = { event = "msg_show", kind = "shell_cmd" },
			opts = { skip = true },
		})

		-- Scrollable split
		table.insert(opts.routes, {
			filter = { event = "msg_show", kind = { "shell_out", "shell_err", "shell_ret" } },
			view = "shell_output",
		})

		return opts
	end,
}
