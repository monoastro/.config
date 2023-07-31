-- Check if awesome encountered an error during startup and fell back to another config (This code will only ever execute for the fallback config)

naughty = require("naughty")

if awesome.startup_errors then
	naughty.notify({ 
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
    local inError = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if inError then return end
        inError = true

        naughty.notify({ 
		preset = naughty.config.presets.critical,
                title = "Oops, an error happened!",
                text = tostring(err) })
        inError = false
    end)
end
