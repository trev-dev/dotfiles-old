from libqtile import hook
from settings import bindings, groups, tile_layouts, screens, autostart, theme

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

# Imported settings
keys = bindings.keys
mouse = bindings.mouse
groups = groups.exports
layouts = tile_layouts.layouts
widget_defaults = theme.widgets
extension_defaults = widget_defaults.copy()
screens = screens.exports
floating_layout = tile_layouts.float_settings

# Other defaults
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

# Do hooks
@hook.subscribe.startup_once
def run():
    autostart.init_apps()

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
