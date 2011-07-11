# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="anithri"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump command-not-found gem git git-flow bundler github ruby rvm thor rails)

source $ZSH/oh-my-zsh.sh
[[ -s ~/.zsh.local ]] && source ~/.zsh.local
# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH=/home/scottp/.rvm/gems/ruby-1.9.2-p180@system/bin:/home/scottp/.rvm/gems/ruby-1.9.2-p180@global/bin:/home/scottp/.rvm/rubies/ruby-1.9.2-p180/bin:/home/scottp/.rvm/bin:/home/scottp/bin:/usr/local/src/bdsm-0.6.10/pkg/active/bin:/usr/local/bin:/usr/bin:/bin
