-- General Configuration

local animSpeed = 1
local mainMod = "SUPER"

hl.bind("SUPER + o", function()
  local current_gaps = hl.get_config("general.border_size")
  if current_gaps == 0 then
    -- Enable gaps and borders

    hl.notification.create({
      text = "Turning on gaps",
      timeout = 3000 -- milliseconds
    })
    hl.config({
      general = {
        gaps_in = 4,
        gaps_out = 4,
        border_size = 3,

        col = {
          active_border = { colors = { "rgba(aca1cfff)", "rgba(E29ECAFF)" }, angle = 90 },
          inactive_border = "rgba(2a2a2fff)",
        },
      },
    })
  else
    -- Disable gaps and borders
    hl.notification.create({
      text = "Turning off gaps",
      timeout = 3000 -- milliseconds
    })
    hl.config({
      general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,
      },
    })
  end
end)

hl.config({
  cursor = {
    no_hardware_cursors = true,
  },

  general = {

    layout = "dwindle",

    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false,
  },

  decoration = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more
    rounding = 1,

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
    },

    -- shadow = {
    --     enabled = true,
    --     range = 4,
    --     render_power = 3,
    --     color = 0xee1a1a1a,
    -- },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    preserve_split = true, -- you probably want this
  },

  master = {
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    -- new_status = "master",
  },

  scrolling = {
    column_width = 0.9,
    focus_fit_method = 0,
  },

  misc = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1, -- Set to 0 to disable the anime mascot wallpapers
  },
})

-- Define animation curves
hl.curve("myBezier", { type = "bezier", points = { { 0.215, 0.61 }, { 0.355, 1 } } })

-- Set up animations
hl.animation({ leaf = "windows", enabled = true, speed = animSpeed, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = animSpeed, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "myBezier" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "myBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = animSpeed, bezier = "default" })
