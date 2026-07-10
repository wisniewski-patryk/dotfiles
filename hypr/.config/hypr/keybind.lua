local mainMod = "SUPER"
local ipc = "noctalia msg "

hl.bind(mainMod .. "+ SPACE", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. "+ comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind(mainMod .. "+ R",     hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))

hl.bind(mainMod .. "+ SHIFT + CTRL + P", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))
hl.bind(mainMod .. "+ SHIFT + P",        hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind(mainMod .. "+ L",                hl.dsp.exec_cmd(ipc .. "session lock"))

local runOutlook = "/usr/bin/chromium-browser --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn"
local runTeams = "/usr/bin/chromium-browser --profile-directory=Default --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo"
hl.bind(mainMod .. "+ SHIFT + O",     hl.dsp.exec_cmd(runOutlook))
hl.bind(mainMod .. "+ SHIFT + T",     hl.dsp.exec_cmd(runTeams))

hl.bind(mainMod .. "+ CTRL + left",   hl.dsp.workspace.move({ monitor = -1 }))
hl.bind(mainMod .. "+ CTRL + right",  hl.dsp.workspace.move({ monitor = 1 }))

hl.bind(mainMod .. "+ C", hl.dsp.window.close())
hl.bind(mainMod .. "+ Q", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd(Browser))
hl.bind(mainMod .. "+ SHIFT + B", hl.dsp.exec_cmd(Browser2))
hl.bind(mainMod .. "+ E", hl.dsp.exec_cmd(FileManager))
hl.bind(mainMod .. "+ M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. "+ V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. "+ P", hl.dsp.window.pseudo())
hl.bind(mainMod .. "+ J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i}))
end

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + CTRL + S",  hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- -- Laptop multimedia keys for volume and LCD brightness
-- Media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1280, 920 },
})

