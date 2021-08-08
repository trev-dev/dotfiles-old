from libqtile.config import Screen
from settings.theme import wallpaper
from settings.bars import primary, secondary

screens_settings = [
    Screen(bottom=primary),
    Screen(bottom=secondary)
]

exports = screens_settings
