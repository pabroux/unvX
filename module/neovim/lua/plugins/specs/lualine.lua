return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local codeium = require("codeium.virtual_text")
		local lualine = require("lualine")

		-------------------------------------------------------------------------------
		-- Options
		-------------------------------------------------------------------------------

		local colors = {
			blue = "#4bc3cc",
			green = "#07ffd6",
			violet = "#cc7fff",
			yellow = "#ffd542",
			red = "#fe605a",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		function codeium_status()
			local status = codeium.status()

			if status.state == "idle" then
				-- Clear output
				return " "
			end

			if status.state == "waiting" then
				-- Wait for response
				return "Waiting..."
			end

			if status.state == "completions" and status.total > 0 then
				return string.format("%d/%d", status.current, status.total)
			end

			return " 0 "
		end

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = lualine_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			extensions = {
				"nvim-tree",
			},
			sections = {
				lualine_x = { codeium_status, "encoding", "fileformat", "filetype" },
			},
		})
	end,
}
