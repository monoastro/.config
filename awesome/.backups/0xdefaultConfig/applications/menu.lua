--the menu thing


-- Create a launcher widget and a main menu
awesomeMenu = 
{
   { "hotkeys", function() hotkeysPopup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

beautiful.menu_height = 19
beautiful.menu_width = 190
beautiful.menu_bg_normal="#000000"
beautiful.menu_bg_focus="#374247"
beautiful.menu_fg_focus="#00ff00"
beautiful.menu_fg_normal="#00ff00"

menuRoot = awful.menu({
	items = 
	{ 
		{ "Awesome", awesomeMenu },
                { "Terminal emulator", terminal },
		{ "Browser", terminal .. " -e lynx"}
        }
})

menuLauncher = awful.widget.launcher({ 
	image = beautiful.awesome_icon,
        menu = menuRoot 
})


-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

