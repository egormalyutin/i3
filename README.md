# i3

### My configs for i3gaps.

## What's new?

* Displaying weather on bar (you need to [configure](#configure-weather "How to configure it?") it)
* You can toggle [Unified Remote](http://unifiedremote.com
 "Unified Remote's site") Server with **Mod+u**. Server's files are included at `~/.config/i3/ur`. You can view status of server at i3bar:  or  icon.
* All useless trash was moved to "trash" dir.
## Screenshot

![Screenshot](https://raw.githubusercontent.com/malyutinegor/i3/master/screen.png "Screenshot")

### If you going to install my configs, please, read all this readme!

### Not forget to watch and update configs, I'm adding new features and dependencies! :D

## Dependencies

* WM components:
	* i3-gaps          
	* i3blocks
	* feh
	* compton
* Custom items:
	* some browser
	* some wallpaper
* Music and volume:
	* PulseAudio
	* `cmus` for playing music
* Programming languages interpeters:
	* Perl
	* Lua
	* Node.JS
	* Python
* Fonts:
	* Font Awesome
	* Droid Sans

## Features list

* If you press **Mod+Shift+n**, will show rename by icon window. You can view all icons at ~/.config/i3/tab-name.coffee.
* Included my wallpaper :D
* Preferences section in config file.
* Transparent status bar.
* Press **Mod+b** for open browser.
* My i3blocks config. It's in `~/.config/i3/blocks` and starts automatically. 
* Press **Mod+T** for switch window title.
* My color scheme.
* You can remote cmus:

  1. Press **Mod+Shift+C**;
  2. Press **n** or right for play next track;
  3. Press **u** or left for play previous track;
  4. Press **space** for toggle pause;
  5. Press **r** for toggle repeat current track;
  6. Press **a** for rewind music 5 seconds backward;
  7. Press **d** for rewind music 5 seconds forward;
  8. You can see the music status at bar.

But, cmus not remotes from i3bar in my config. All controls are binded to hotkeys.

* You can take a screenshot by pressing **Mod+S**. All screenshots saves at `~/Screenshots/` defaultly.
* You can toggle Unified Remote Server with **Mod+u**. Server's files are included at `~/.config/i3/ur`. You can view status of server at i3bar:  or  icon.

## Installaton

### Installing dependencies

Installing on Arch Linux (need yaourt):

```bash
yaourt -S i3-gaps i3blocks feh compton pulseaudio cmus perl lua nodejs python ttf-font-awesome ttf-droid
```

If you have other linux distro, you need install they by yourself.

### Installing configs

For install my configs, you need create backup of your last config and copy my config to ~/.config/i3:

```bash
cd ~/.config
sudp mv i3 i3-old
sudo git clone https://github.com/malyutinegor/i3.git
```

You also need for view ~/.config/i3/config for view config and edit "prefereneces" section:

```bash
vim ~/.config/i3/config
```

You can now press **Mod+Shift+R** for reload i3-gaps.

### Configure weather

You can see weather on i3bar next to user and PC name. But you need to configure it: defaultly, it displays weather in Russia, Omsk.

Go to `~/.config/i3/` and view `./hints/accuweather-locationcodes.txt`:

```bash
cd ~/.config/i3
less ./hints/accuweather-locationcodes.txt
```

You need to find your city. Just press **/** and type name of your city, e.g. Moscow, and press Enter. You must find string like this:

```
City Name = "Moscow, RU" Location = "ASI|RU|RS052|MOSKVA" Country = "Russia"
```

You need to copy "Location" from it, e.g. "ASI|RU|RS052|MOSKVA". We will call this "locationcode".

Next, edit `../blocks`:

```
cd ..
vim blocks
```

Next, press **/**, type "weather" and press Enter.

You need find some like this:

```
[weather]
command=node ~/.config/i3/scripts/weather.js -l "ASI|RU|RS058|OMSK" -m C || echo 
interval=600
color=#FFFFFF
```

Replace `"ASI|RU|RS058|OMSK"` to your locationcode, press **Mod+Shift+r** and check, is correct displays weather. If you want to display temperature in F, you need to replace `-m C` to `-m F`. You can check current weather at `accuweather.com`.  

## Author

Author's site: [malyutinegor.github.io](https://malyutinegor.github.io "Author's site")
