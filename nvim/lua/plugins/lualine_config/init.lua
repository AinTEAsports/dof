local vim = vim
local _ = require("plugins.lualine_config.helper_functions")
local lualine = require("lualine")

local config = require("plugins.lualine_config.custom_lualine")
-- local config = require("plugins.lualine_config.evil_lualine")
-- local config = require("plugins.lualine_config.evil_lualine_custom")

lualine.setup(config)
