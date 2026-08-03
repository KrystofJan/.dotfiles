-- Hyprland Lua Configuration
-- https://wiki.hypr.land/Configuring/Start/

-- Import configuration modules
require("wm.env")
require("wm.input")
require("wm.general")
require("wm.workspace")
require("wm.binds")

-- Startup applications
hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
    hl.exec_cmd("bash ~/.config/hypr/start.sh")
end)

