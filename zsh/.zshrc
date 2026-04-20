export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/development/flutter/bin"
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/build-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export CHROME_EXECUTABLE="$HOME/.local/bin/brave-silent"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
alias adb='/mnt/c/android-sdk/platform-tools/adb.exe'

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
