-- Input Configuration
-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

hl.config({
    input = {
        kb_layout = "us,cz",
        kb_variant = ",qwerty",
        kb_model = "",
        kb_options = "grp:alt_shift_toggle, caps:swapescape",
        kb_rules = "",

        follow_mouse = 1,

        touchpad = {
            natural_scroll = true,
        },

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
})

-- Three-finger horizontal swipe to switch workspaces
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

