-- Workspace, Monitor and Window Rules Configuration

-- Monitor Configuration
-- See https://wiki.hyprland.org/Configuring/Basics/Monitors/
hl.monitor({
  output = "eDP-1",
  mode = "highres",
  position = "auto-left",
  scale = "1.25",
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "highres",
  position = "auto-center-right",
  scale = "1",
})

-- DP-1 Fix: Explicitly set resolution + rotation
-- Dell U2412M native resolution: 1920x1200@60Hz
-- Transform: 1 = 90° clockwise (left side on bottom)
hl.monitor({
  output = "DP-1",
  mode = "1920x1200@60",
  position = "auto-right",
  scale = "1",
  transform = 1,
})

-- Autostart helper scripts
hl.on("hyprland.start", function()
  hl.exec_cmd("handle_monitor_connect.sh")
  hl.exec_cmd("~/.config/hypr/init-dp1.sh")
end)

-- Window Rules
hl.window_rule({
  name = "gamedev-windows-floating",
  match = { title = "^GAMEDEV" },
  float = true,
})

hl.window_rule({
  name = "youtube-windows-floating",
  match = { title = "*youtube*" },
  float = true,
})
