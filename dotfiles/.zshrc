# Path to your oh-my-zsh configuration.
export TERM=xterm-256color
export EDITOR=vim
ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="anithri"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump debian gem git git-flow github ruby rvm thor rails extract vundle)

source $ZSH/oh-my-zsh.sh
[[ -s ~/.zsh.local ]] && source ~/.zsh.local
# Customize to your needs...
export PATH=/home/scottp/bin:/home/scottp/.rvm/gems/ruby-1.9.2-p180@system/bin:/home/scottp/.rvm/gems/ruby-1.9.2-p180@global/bin:/home/scottp/.rvm/rubies/ruby-1.9.2-p180/bin:/home/scottp/.rvm/bin:/home/scottp/bin:/usr/local/src/bdsm-0.6.10/pkg/active/bin:/usr/local/bin:/usr/bin:/bin
alias revm="rvm use `rvm current`"
alias guard="bundle exec guard"
alias vim-update="vim +BundleInstall +qall"
alias dotty="~/workspace/dotty/bin/dotty"
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/
export LESS='-R-i-P?f%f:stdin. ?m(%i/%m). Line %lb?L/%L(%Pb\%).'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

if [[ -s ~/.zshrc-private.gpg && ! -s ~/.zshrc-private ]]; then
  ~/bin/decrypt_file ~/.zshrc-private.gpg
fi
[[ -s ~/.zshrc-private ]] && source ~/.zshrc-private
