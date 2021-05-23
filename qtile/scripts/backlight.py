import subprocess


def change_backlight(dir):
    """
    Function decorator for Qtile to adjust the backlight up or down.
    @param {str} direction 'up' or 'down'
    """
    process = ['xbacklight', '<amount>']

    def inner(qtile=None):
        inc = 5
        process[1] = (f'+{inc}', f'-{inc}') [dir == 'down']
        subprocess.Popen(process)

    return inner
