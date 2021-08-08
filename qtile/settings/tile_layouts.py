from libqtile import layout
from libqtile.config import Match
from settings.theme import colors

layouts = [
    layout.Max(),
    layout.MonadTall(margin=3, border_focus=colors['black']),
    layout.MonadWide(margin=3, border_focus=colors['black']),
    layout.RatioTile(border_focus=colors['black'])
]

float_settings = layout.Floating()
