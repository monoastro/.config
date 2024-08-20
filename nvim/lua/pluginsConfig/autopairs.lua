--auto close brackets
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end
npairs.setup(
{
	event = "InsertEnter",
	config = true,
	check_ts = true,
 	-- it will not add a pair on these treesitter nodes
	ts_config =
	{
		lua = {'string'},
		--javascript = {'template_string'},
	},
	disable_filetype = { "TelescopePrompt" }, -- echo &ft to get the file type to add here
	fast_wrap = {
		map = '<M-b>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = '$',
		before_key = 'h',
		after_key = 'l',
		cursor_pos_before = true,
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		manual_position = true,
		highlight = 'Search',
		highlight_grey='Comment'
	},
})

--[[
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = { tex = ''}}))
--]]
