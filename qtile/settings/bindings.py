from scripts.lock_screen import lock_screen
from scripts.backlight import change_backlight
from settings.groups import exports as groups
from libqtile.config import Drag, Click, Key
from libqtile.command import lazy

mod = "mod4"

qtile = [
    # Switch between windows in current stack pane
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),

    # Move windows up or down in current stack
    Key([mod, "shift"], "h", lazy.layout.swap_left()),
    Key([mod, "shift"], "l", lazy.layout.swap_right()),
    Key([mod, "control"], "k", lazy.layout.shuffle_down()),
    Key([mod, "control"], "j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn("termite")),

    # Shrink/Grow
    Key([mod], "i", lazy.layout.grow()),
    Key([mod], "m", lazy.layout.shrink()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    # Screens
    Key([mod, "control"], "1", lazy.to_screen(0)),
    Key([mod, "control"], "2", lazy.to_screen(1))
]

system = [
    Key([mod, "shift"], "x", lazy.function(lock_screen())),
    Key([], 'XF86MonBrightnessUp', lazy.function(change_backlight('up'))),
    Key([], 'XF86MonBrightnessDown', lazy.function(change_backlight('down'))),
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('pactl set-sink-volume 0 +5%')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('pactl set-sink-volume 0 -5%')),
    Key([], 'XF86AudioMute', lazy.spawn('pactl set-sink-mute 0 toggle'))
]

rofi = [
    Key([mod], "d", lazy.spawn("rofi -show drun")),
]

mpc = [
    Key([], 'XF86AudioPlay', lazy.spawn("mpc toggle")),
    Key([], 'XF86AudioNext', lazy.spawn("mpc next")),
    Key([], 'XF86AudioPrev', lazy.spawn("mpc prev"))
]

keys = qtile + system + rofi + mpc

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused
        # window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]