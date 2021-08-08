from libqtile import bar, widget
from settings.theme import colors

primary = bar.Bar(
    [
        widget.GroupBox(
            active=colors['green'],
            this_current_screen_border=colors['yellow'],
            urgent_color=colors['magenta'],
            urgent_border=colors['magenta'],
            borderwidth=1),
        widget.CurrentLayoutIcon(),
        widget.Prompt(),
        widget.TaskList(border=colors['blue'], borderwidth=1),
        widget.Mpd2(),
        widget.PulseVolume(update_interval=2),
        widget.TextBox('|'),
        widget.Systray(),
        widget.TextBox('|'),
        widget.ThermalSensor(),
        widget.TextBox('|'),
        widget.CPUGraph(
            graph_color=colors['green'],
            border_color=colors['black'],
            samples=30
        ),
        widget.MemoryGraph(
            graph_color=colors['blue'],
            border_color=colors['black'],
            samples=30
        ),
        widget.NetGraph(
            graph_color=colors['yellow'],
            border_color=colors['black'],
            samples=30
        ),
        widget.Wlan(interface="wlp2s0"),
        widget.TextBox('|'),
        widget.Battery(notify_below=15),
        widget.TextBox('|'),
        widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
        widget.Wallpaper(random=True, label='')
    ],
    28,
    background=colors['background'],
)

secondary = bar.Bar(
    [
        widget.GroupBox(
            active=colors['green'],
            this_current_screen_border=colors['yellow'],
            urgent_color=colors['magenta'],
            urgent_border=colors['magenta'],
            borderwidth=1),
        widget.CurrentLayoutIcon(),
        widget.Prompt(),
        widget.TaskList(border=colors['blue'], borderwidth=1),
        widget.Wallpaper(random=True, label='')
    ],
    28,
    background=colors['background'],
)
