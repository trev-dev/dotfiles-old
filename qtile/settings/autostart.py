import subprocess
from settings.theme import background_image


def init_apps():
    processes = [
        ['compton', '-b'],

        ['feh', '--bg-scale', background_image],
        ['/usr/bin/setxkbmap', '-option', 'caps:swapescape'],
        [
            'xautolock',
            '-time', '5',
            '-corners',
            '-000',
            '-cornersize',
            '30',
            '-locker',
            '/home/trevdev/.dotfiles/i3/lock.sh'
        ],
        ['blueman-applet'],
        ['mpd'],
        ['mpdas'],
        ['nextcloud'],
        ['keybase']
    ]

    for p in processes:
        subprocess.Popen(p)
