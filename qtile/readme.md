
# Table of Contents
1.  [Qtile WM Config](#orgd27832d)
    1.  [Installation](#org0a7beab)
        1.  [Dependencies](#org2488783)
        2.  [Instructions](#org69e61ba)
    2.  [The settings module/folder](#org73faa77)
        1.  [autostart.py](#orgfb3489d)
        2.  [bars.py](#orgcda01b5)
        3.  [bindings.py](#orge8ecbd3)
        4.  [groups.py](#orga19af31)
        5.  [screens.py](#org6e6bafa)
        6.  [theme.py](#orgbe028d8)
        7.  [tile<sub>layouts.py</sub>](#org5d8187c)


<a id="orgd27832d"></a>

# Qtile WM Config

Contained in this repo are my Qtile WM configs. I don't enjoy config files more than 350 lines long, so most of my settings are imported from a 'settings' module.


<a id="org0a7beab"></a>

## Installation

This config is setup for Arch Linux so it is easiest to deploy there.


<a id="org2488783"></a>

### Dependencies

This configuration <span class="underline">will work</span> for you if you do not install these, but they're recommended. Without them, you will have to tweak some settings yourself.

-   [awesome-terminal-fonts](https://github.com/gabrielelana/awesome-terminal-fonts) for all of the neat little glyphs/icons.
-   feh, image viewer for the bg
-   xautolock & i3lock, scrot & imagemagick for the lock screen script
-   compton to make things look nicer


<a id="org69e61ba"></a>

### Instructions

Make sure you install [Qtile](http://www.qtile.org) (of course). Whether you launch Qtile from your .xinit or a display manager is up to you. Either way, make sure you symlink the root folder for this config to your ~/.config/ directory. It's also worth noting that I wrote my configs with Python 3.6 or better in mind.


<a id="org73faa77"></a>

## The settings module/folder

I will attempt to explain what's in here and what each file does.


<a id="orgfb3489d"></a>

### autostart.py

Contains a hook function to auto-start applications on a new session using Popen.


<a id="orgcda01b5"></a>

### bars.py

Stores variables for a top/bottom/left/right bar and what widgets go inside them.


<a id="orge8ecbd3"></a>

### bindings.py

Stores a number of lists that make up the \`mouse\` and \`keys\` list. These make up key/mouse bindings.


<a id="orga19af31"></a>

### groups.py

Contains the group settings for each window group that should appear in the bar/available for use. The name string ends up being your hot-key so configure it carefully.

    group_settings = [
        (
            "name",
            {
                "label": "Some workspace",
                # ... other options...
            }
        )
    ]


<a id="org6e6bafa"></a>

### screens.py

A file that defines the various settings for any number of screens. There is one screen with one bar by default.


<a id="orgbe028d8"></a>

### theme.py

Some general theme settings that get delegated to the various other config files. The idea behind how this is supposed to be configured is that you would use your terminal colors as your theme for Qtile along with whatever background you want.


<a id="org5d8187c"></a>

### tile<sub>layouts.py</sub>

Contains the various available layouts and what their settings are. Also contains the floating window settings (which window classes get floated automatically)

