# i3

### My configs for i3gaps.

## What's new?

* You can remote cmus now:

  1. Press Mod+Shift+C;
  2. Press n or right for play next track;
  3. Press u or left for player previous track;
  4. Press space for toggle pause;
  5. Press r for toggle repeat current track;
  6. You can see the music status at bar.

* Renaming by icons: If you press Mod+Shift+n, will show rename by icon number. You can view all icons at ~/.config/i3/tab-name.js.
* You can take a screenshot by pressing Mod+S. All screenshots saves at ~/Screenshots/ defaultly.

## Screenshot

![Screenshot](https://raw.githubusercontent.com/malyutinegor/i3/master/screen.png "Screenshot")

### If you going to install my configs, please, read all this readme!

## Dependencies

* i3-gaps          
* i3blocks
* feh
* compton
* python
* nodejs
* PulseAudio
* some browser
* some wallpaper
* cmus
* Font Awesome

## Features list

* Rename workspace tools:

  1. If you press Mod+n, will show rename and renumber window.
  2. If you press Mod+Shift+n, will show rename by icon number. You can view all icons at ~/.config/i3/tab-name.js.
  3. If you start `tab-name-term` in terminal, workspace will be named with shell icon. There is another icons. Aliases list is in ~/.config/i3/tab-name. Also, there is all icons in ~/.config/i3/icons-cheat.html. You can run `tab-name-cheat` to view it in firefox.

* Included my wallpaper :D
* Preferences section in config file.
* Transparent status bar.
* Press Mod+b for open browser.
* My i3blocks config. It's in ~/.config/i3/blocks and starts automatically. 
* Press Mod+T for switch window title.
* My color scheme.
* You can remote cmus:

  1. Press Mod+Shift+C;
  2. Press n or right for play next track;
  3. Press u or left for player previous track;
  4. Press space for toggle pause;
  5. Press r for toggle repeat current track;
  6. You can see the music status at bar.

* You can take a screenshot by pressing Mod+S. All screenshots saves at ~/Screenshots/ defaultly.

## Installaton

### Installing dependencies

Installing on Arch Linux (need yaourt):

```
yaourt i3-gaps i3blocks feh compton nodejs python pulseaudio cmus ttf-font-awesome 
```

### Installing configs

For install my configs, you need create backup of your last config, copy my config to ~/.config/i3, and add helpful alias to ~/.bashrc:

```
cd ~/.config
sudp mv i3 i3-old
sudo git clone https://github.com/malyutinegor/i3.git
echo "source ~/.config/i3/tab-name" >> ~/.bashrc
sudo vim ~/.config/i3/config
```

If you need working cmus status, you must run this command in cmus shell:

```
:set status_display_program=~/.config/i3/cmus 
``` 

And add helpful alias to ~/.bashrc:

```
echo 'alias cmus="cmus && ~/.config/i3/cmus"' >> ~/.bashrc
```

You also need for view ~/.config/i3/config for view config and edit "prefereneces" section.

You can press Mod+Shift+R for reload i3-gaps.

## Author

Author's site: [malyutinegor.github.io](https://malyutinegor.github.io "Author's site")
