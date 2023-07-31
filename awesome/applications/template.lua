
--widget containing terminal window

local textbox = wibox.widget.textbox("capybara")
textbox.font = "Hack 42"

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
	placement = awful.placement.centered,
	shape = gears.shape.rect,
	bg = "#000000",	
	fg = "#00ff00",
	border_width = 0,
	ontop = true,
	
}




--hide the floating wibox when any window is focused
client.connect_signal("focus", function(c) floatingWibox.visible = false end)

--show the floating wibox when all windows are minimized
client.connect_signal("unfocus", function(c) floatingWibox.visible = true end)
