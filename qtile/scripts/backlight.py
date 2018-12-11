import subprocess


def change_backlight(dir):
    """
    Function decorator for Qtile to adjust the backlight up or down.
    @param {str} direction 'up' or 'down'
    """
    process = ['xbacklight', '<amount>']

    def inner(qtile=None):
        if dir == 'up':
            process[1] = '+10'
        else:
            process[1] = '-10'

        subprocess.Popen(process)

    return inner
