-- Terminal = "ghostty"
Terminal = "kitty"
FileManager = "nautilus"
Menu = "rofi -show drun"
-- Menu = wofi --show drun
Browser = "firefox"
Browser2 = "/usr/bin/chromium-browser"

require("config")
require("looknfeel")
require("monitors")

require("keybind")

require("autostart")

-- For Noctalia Color templates
require("noctalia").apply_theme()
