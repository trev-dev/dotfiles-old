import os
import subprocess
from os.path import expanduser


def init_apps():
    processes = [
        # Recommended
        ['picom', '--config', expanduser('~/.dotfiles/picom/picom.conf'), '-b'],
        ['/usr/bin/setxkbmap', '-option', 'caps:swapescape'],
        [
            'xautolock',
            '-time', '5',
            '-corners',
            '-000',
            '-cornersize',
            '30',
            '-locker',
            expanduser('~/.config/qtile/scripts/lock_screen.py')
        ],
        # Optional
        ['nextcloud']
    ]

    for p in processes:
        subprocess.Popen(p)
