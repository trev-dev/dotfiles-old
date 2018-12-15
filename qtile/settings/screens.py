from libqtile.config import Screen
from settings.bars import primary, secondary

screens_settings = [
    Screen(bottom=primary),
    Screen(bottom=secondary)
]

exports = screens_settings
