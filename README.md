#color-logger-bash

Add color logging to bash scripts

### Description
Ideal use is inline.  Sourcing the script and then use a logger function directly in script.

logger functions: debug, info, warn, error, success, highlight

highlight is a special case. It can be used in conjunection with other logging functions.

### Install

##### Globally
```
git clone https://github.com/swyckoff/bash-color-logger.git
./install.sh
```

or this (which is what install does)

```
cd /usr/local/bin
wget https://raw.githubusercontent.com/swyckoff/color-logger-bash/master/color-logger.bash
cd -
```
##### Locally
Pull down the script

```
wget https://raw.githubusercontent.com/swyckoff/bash-color-logger/master/color-logger.bash
```

### Usage
source in your script

```
. color-logger.bash
```

### Logger functions
debug, info, warn, error, success, highlight

### Taste the colors... examples
```
debug "Hold on to your butts."

info "It's got a dragon painted right on the blade!"

warn "Danger, Will Robinson!"

error "Somebody gonna get a hurt real bad."

success "So you're telling me there's a chance..."

info "More Obscure?? Okay... $(highlight "I can't believe my eyes"). It's like looking in a mirror!"
```

### More help
```
color-logger.bash -h
```

### Problems? Contributing?
* See/Add issues!

### License

MIT
