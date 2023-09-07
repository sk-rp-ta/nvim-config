local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

local navic_ok, navic = pcall(require, 'nvim-navic')
local winbar_cfg = {}
local inactive_winbar_cfg = {}

if navic_ok then
	navic.setup {
		icons = {
			File          = "󰈙 ",
			Module        = " ",
			Namespace     = "󰌗 ",
			Package       = " ",
			Class         = "󰌗 ",
			Method        = "󰆧 ",
			Property      = " ",
			Field         = " ",
			Constructor   = " ",
			Enum          = "󰕘",
			Interface     = "󰕘",
			Function      = "󰊕 ",
			Variable      = "󰆧 ",
			Constant      = "󰏿 ",
			String        = "󰀬 ",
			Number        = "󰎠 ",
			Boolean       = "◩ ",
			Array         = "󰅪 ",
			Object        = "󰅩 ",
			Key           = "󰌋 ",
			Null          = "󰟢 ",
			EnumMember    = " ",
			Struct        = "󰌗 ",
			Event         = " ",
			Operator      = "󰆕 ",
			TypeParameter = "󰊄 ",
		},
		lsp = {
			auto_attach = true,
			preference = nil,
		},
		highlight = true,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
		safe_output = true,
		lazy_update_context = false,
		click = false
	}

	winbar_cfg = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "diagnostics",
				symbols = {
					error = "e",
					warn = "w",
					info = "i",
					hint = "?",
				},
			},
			{ "filetype", color = { bg = 'NONE'}, icon_only = false, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", color = { fg = colors.gray, bg = 'NONE'}, path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
			{
				function() return require("nvim-navic").get_location() end,
				cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}

	inactive_winbar_cfg = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "filetype", color = { bg = 'NONE'}, icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", color = { bg = 'NONE'}, path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },

		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
end

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.gray, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.gray, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
	disabled_filetypes = {
		statusline = {'alpha'},
		winbar = {'NvimTree', 'alpha'}
	},
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  winbar = winbar_cfg,
  inactive_winbar = inactive_winbar_cfg,
  extensions = {},
}
