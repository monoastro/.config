--Obviously everything here is global

-- Standard awesome library
gears = require("gears")
awful = require("awful") 
require("awful.autofocus")

-- Widget and layout library
wibox = require("wibox")

-- Theme handling library
beautiful = require("beautiful")

-- Notification library
menubar = require("menubar")
hotkeysPopup = require("awful.hotkeys_popup")
naughty = require("naughty")

-- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened:
require("awful.hotkeys_popup.keys")


--list of local libraries
