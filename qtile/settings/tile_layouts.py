from libqtile import layout
from settings.theme import colors

layouts = [
    layout.Max(),
    layout.Stack(
        num_stacks=2,
        margin=3,
        border_focus=colors['black'],
        border_width=2),
    layout.MonadTall(margin=3, border_focus=colors['black']),
    layout.MonadWide(margin=3, border_focus=colors['black']),
    layout.Tile(margin=3, border_focus=colors['black'], border_width=2)
]

float_settings = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
