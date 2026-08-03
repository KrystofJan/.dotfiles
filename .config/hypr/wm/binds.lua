-- Keybindings Configuration
-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Variables for common programs
local mainMod = "SUPER"
local terminal = "ghostty"
local browser = "zen-browser"
local fileManager = "nemo"

-- Application bindings
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("bash ~/.config/hypr/waybar.sh"))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys/vim keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + arrow keys/vim keys
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces and move windows with mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Group management
-- TODO:
-- hl.bind("SUPER + G", hl.dsp.group.toggle())
-- hl.bind("SUPER + TAB", hl.dsp.group.next())
-- hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.prev())

-- Layout messages
hl.bind(mainMod .. " + N", hl.dsp.layout("orienttop"))

-- Rofi launcher
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun -show-icons"), { release = true })

-- Volume controls
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })

-- Mic control
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Brightness controls
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10%"), { locked = true, repeating = true })

-- Screenshot
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | convert - -shave 1x1 PNG:- | wl-copy'))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move workspace to monitor
-- TODO:
hl.bind("CTRL + " .. mainMod .. " + SHIFT + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("CTRL + " .. mainMod .. " + SHIFT + L", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("CTRL + " .. mainMod .. " + SHIFT + K", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind("CTRL + " .. mainMod .. " + SHIFT + J", hl.dsp.workspace.move({ monitor = "d" }))


-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Custom scripts
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("$HOME/.dotfiles/tmux-sessionizer"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/vpn-startup"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/bluetooth"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("$HOME/.dotfiles/scripts/layout-switch"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screen recording
hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("$HOME/.dotfiles/.config/hypr/scripts/rec"))
