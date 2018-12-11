#! /usr/bin/python
import subprocess


def lock_screen():
    """
    A function decorator for Qtile to lock the screen with
    """
    processes = [
        ['scrot', '/tmp/screen.png'],
        [
            'convert',
            '/tmp/screen.png',
            '-scale', '10%',
            '-scale', '1000%',
            '/tmp/screen.png'
        ],
        ['i3lock', '-i', '/tmp/screen.png'],
        ['rm', '/tmp/screen.png']
    ]

    def inner(qtile=None):
        for p in processes:
            command = subprocess.Popen(p)
            command.wait()

    return inner


if __name__ == '__main__':
    lock = lock_screen()
    lock()
