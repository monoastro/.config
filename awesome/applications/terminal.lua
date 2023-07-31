
--widget containing terminal window

local textbox = wibox.widget.textbox("      capybara\nStandby for terminal")
textbox.font = "Hack Bold 42"

local backgroundWidget = wibox.widget {
    {
       	textbox,
        widget = wibox.container.background,
    },
    widget = wibox.container.margin,
    margins = 40,
}

--Create the floating wibox for the background widget
local floatingWibox = awful.popup {
	widget = backgroundWidget,
	style = {
		shape = gears.shape.rect,
		bg_normal = beautiful.bg_normal .. "0",
	        bg_focus = beautiful.bg_focus .. "0",
		bg_urgent = beautiful.bg_urgent .. "0",
	},

	fg = "#000000",
	ontop = true,
	bg = beautiful.bg_normal .. "0",
	placement = awful.placement.centered,
	--shape = gears.shape.rounded_rect
}

--hide the floating wibox when any window is focused
client.connect_signal("focus", function(c) floatingWibox.visible = false end)

--show the floating wibox when all windows are minimized
client.connect_signal("unfocus", function(c) floatingWibox.visible = true end)
