local floatingWibox = awful.popup {
    widget = awful.widget.tasklist {
        screen   = screen[1],
        filter   = awful.widget.tasklist.filter.allscreen,
        buttons  = tasklist_buttons,
        style = {
		shape = gears.shape.rect,
		bg_normal = beautiful.bg_normal .. "0",
	        bg_focus = beautiful.bg_focus .. "0",
		bg_urgent = beautiful.bg_urgent .. "0",
	},
        layout   = {
            spacing = 5,
            forced_num_rows = 2,
            layout = wibox.layout.grid.horizontal
        },
        widget_template = {
            {
                {
                    id     = 'clienticon',
                    widget = awful.widget.clienticon,
                },
                margins = 4,
                widget  = wibox.container.margin,
            },
            id              = 'background_role',
            forced_width    = 48,
            forced_height   = 48,
            widget          = wibox.container.background,
            create_callback = function(self, c, index, objects) --luacheck: no unused
                self:get_children_by_id('clienticon')[1].client = c
            end,
        },
    },
    border_color = '#000000',
    border_width = 2,
    ontop        = true,
    placement    = awful.placement.centered,
    shape        = gears.shape.rounded_rect
}

--hide the floating wibox when any window is focused
client.connect_signal("focus", function(c) floatingWibox.visible = false end)

--show the floating wibox when all windows are minimized
client.connect_signal("unfocus", function(c) floatingWibox.visible = true end)
