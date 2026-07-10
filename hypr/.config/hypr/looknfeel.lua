hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = false,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})



hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 4,
  },

  decoration = {
    rounding = 8,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
})
