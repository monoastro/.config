--modularity to infinity
--the main file that ties it all together

pcall(require, "luarocks.loader") -- If LuaRocks is installed, make sure that packages installed through it are. If LuaRocks is not installed, do nothing.
require("globalLibraries")
require("controlUnit/errorHandling")
require("controlUnit/definitions")
require("applications/menu")
require("applications/widgetBar") --also contains code for wallpaper
require("keymaps")
require("controlUnit/rules") --i'd prefer to call it options
require("controlUnit/signals") --functions called for when new clients appear
require("autostart")
