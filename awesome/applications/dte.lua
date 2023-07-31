
--create text widget for time and date
local textWidget = wibox.widget.textclock("<b>%a, %b %d</b> \n   %H:%M", 1, "Asia/Kathmandu")
textWidget.font = "Hack 13"

-- Create text widget for battery status
local batteryWidget = wibox.widget.textbox()
batteryWidget.font = "Hack 13"

notificationBool = 0
local function batteryPolice(status, activationCause)
	naughty.notify({ 
		preset = naughty.config.presets.critical,
		title = "Battery police",
		text = status 
	})
	notificationBool = activationCause
end


--Update date and time
local function updateDateAndTime()
	textWidget.markup =  os.date("<b>%a, %b %d</b> \n   %H:%M", 1, "Asia/Kathmandu") 
end

-- Update the battery text
local function updateBatteryStatus()
        local capacity = io.open("/sys/class/power_supply/BAT0/capacity", "r")
        local status = io.open("/sys/class/power_supply/BAT0/status", "r")
        if capacity and status then
            --batteryWidget.text = string.format("Battery: %s%% %s", capacity:read(), status:read())
	    batteryWidget:set_markup("        <b>Energy:</b> " .. capacity:read() .. "%\n    <b>Status:</b>" .. status:read())

	    --[[
	    --battery lifetime elongation protocal; doesn't currently work because value is evaluated to nil for some reason 
	    local value = tonumber(capacity:read())
	    if status:read() == "Charging" then
	    	--reset the flag if it was activated by low energy and is now charging
		if(notificationBool == 2) then
			notificationBool = 0
		end
		if(value > 80 and not(notificationBool)) then
			batteryPolice("High Battery, Unplug this instance", 1)
		end
	    else --if not charging then it's discharging 
		--similar logic here
	    	if(notificationBool == 1) then
			notificationBool = 0
		end
		if(value < 58 and not(notificationBool))then
		    batteryPolice("Low Battery, Charge this instance", 2)
		end
	    end
		--]]		
            capacity:close()
            status:close()
        end
end

--updateDateAndTime()
updateBatteryStatus()

--create background box widget for the text widgets
local backgroundWidget = wibox.widget {
    {
        {
            
                textWidget,
                batteryWidget,
                spacing = 0,
                layout = wibox.layout.fixed.horizontal,
            
        },
        widget = wibox.container.background,
    },
    widget = wibox.container.margin,
    margins = 40,
}

--Create the floating wibox for the background widget
local floatingWibox = awful.popup {
	widget = backgroundWidget,
	placement = awful.placement.bottom_right,
	shape = gears.shape.rect,
	bg = "#000000",	
	fg = "#00ff00",
	border_width = 0,
	ontop = false,
	
}


--Update the date and time every minute
gears.timer {
	timeout = 60,
	autostart = true,
	callback = function()
		updateDateAndTime()
	end
}
--update battery every second
gears.timer {
	timeout = 1,
	autostart = true,
	callback = function()
		updateBatteryStatus()
	end
}


--hide the floating wibox when any window is focused
client.connect_signal("focus", function(c) floatingWibox.visible = false end)

--show the floating wibox when all windows are minimized
client.connect_signal("unfocus", function(c) floatingWibox.visible = true end)

--[[
client.connect_signal("unfocus", function(c) 
	for _, c in ipairs(client.get()) do
		if not c.minimized then
			return
		end
	end
	floatingWibox.visible = true 
end)
--]]





