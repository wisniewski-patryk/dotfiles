-- local waybarExec = "waybar"
-- local hyprpaperExec = "hyprpaper"
local noctalia = "noctalia"

hl.on("hyprland.start", function()
  hl.exec_cmd(noctalia)
--     hl.exec_cmd(waybarExec)
--     hl.exec_cmd(hyprpaperExec)
end)

