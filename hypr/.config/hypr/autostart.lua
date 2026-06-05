local waybarExec = "waybar"
local hyprpaperExec = "hyprpaper"

hl.on("hyprland.start", function()
    hl.exec_cmd(waybarExec)
    hl.exec_cmd(hyprpaperExec)
end)
