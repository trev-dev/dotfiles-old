import os
import subprocess
from settings.theme import wallpaper


def init_apps():
    processes = [
        # Recommended
        ['compton', '-b'],
        ['feh', '--bg-scale', wallpaper],
        ['/usr/bin/setxkbmap', '-option', 'caps:swapescape'],
        [
            'xautolock',
            '-time', '5',
            '-corners',
            '-000',
            '-cornersize',
            '30',
            '-locker',
            os.path.expanduser('~/.config/qtile/scripts/lock_screen.py')
        ],
        # Optional
        ['nextcloud']
    ]

    for p in processes:
        subprocess.Popen(p)
