bash-color-logging
==================

An easy way to add colors to your scripts. 

Usage
=======
Pull down the script 

```
wget https://raw.githubusercontent.com/swyckoff/bash-color-logging/master/color-logging.bash
```

source in your script

```
. color-logging.bash
```

Taste the colors 

```
info "It's got a dragon painted right on the blade!"

warn "Danger, Will Robinson!"

error "Somebody gonna get a hurt real bad"

info "Ready for this? $(highlight "I can't believe my eyes"). It's like looking in a mirror!"
```

## Including in another repo

Copy install.sh to your project

Version
=======
0.5.1 - Included an install script, easier to use in the setup for another project.
0.5.0 - Initial release.  Using escape codes instead of tput cause it was mostly done when I found that :)

## License

MIT
