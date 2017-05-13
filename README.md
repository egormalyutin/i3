#i3

### My configs for i3gaps.

## Dependencies

* i3-gaps          
* i3blocks
* feh
* compton
* python
* PulseAudio
* some browser
* some wallpaper
* cmus
* Font Awesome
* Font DejaVu Sans Mono

## Features list

* Rename workspace tools:

1. If you press Mod+n, will show rename and renumber window.
2. If you start `tab-name-term` in terminal, workspace will be named with shell icon. There is another icons. Aliases list is in ~/.config/i3/tab-name. Also, there is all icons in ~/.config/i3/icons-cheat.html. You can run `tab-name-cheat` to view it in firefox.

* Included my wallpaper :D
* Preferences section in config file.
* Transparent status bar.
* Press Mod+b for open browser.
* My i3blocks config. It's in ~/.config/i3/blocks and starts automatically. 

## Installaton

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
