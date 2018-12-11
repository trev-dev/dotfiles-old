#! /usr/bin/python
import os
import subprocess

exec_path = os.path.abspath(__file__)


def lock_screen():
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

    for p in processes:
        command = subprocess.Popen(p)
        command.wait()



if __name__ == '__main__':
    lock_screen()
