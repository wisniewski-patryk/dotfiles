-- build-in
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080",
    position = "0x0",
    scale = 1.0,
})

-- right
hl.monitor({
    output = 'desc:Dell Inc. DELL P2422H 95HZRM3',
    mode = '1920x1080',
    position = '0x0',
--    scale = 1.0,
    mirror = 'eDP-1'
})

-- left
hl.monitor({
    output = 'desc:Dell Inc. DELL P2422H 4CHZRM3',
    mode = '1920x1080',
    position = '0x0',
--    scale = 1.0,
    mirror = 'eDP-1'
})

