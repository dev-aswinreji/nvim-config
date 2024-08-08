---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

	hl_override = {
		Comment = { italic = true },  -- Make comments italic
		["@comment"] = { italic = true },  -- Treesitter comments italic
		Normal = { bg = "#1e222a" },  -- Change background color (optional)
	},
}

-- Additional configurations
M.ui = {
	transparency = false,  -- Disable transparency
	italic_comments = true,  -- Enable italic comments globally
}

M.plugins = {
	options = {
		lspconfig = {
			setup_lspconf = "custom.lspconfig",  -- Point to your LSP configurations
		},
	},
}

return M
