# Welcome Screen
clear
uname -a
date
hostname > temp
banner "${HOST}"

# Oh-my-zsh!
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

# Aliases
source ~/.aliases

# Ctrl-s save fix
setopt NO_FLOW_CONTROL
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# VI mode
setopt vi
export EDITOR="vim"
bindkey -M viins ' ' magic-space
bindkey -M viins '^f' vi-cmd-mode
bindkey -M viins '\C-i' complete-word

# Load RVM
source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshsource="source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

# Oh my zsh options
export UPDATE_ZSH_DAYS=60
COMPLETION_WAITING_DOTS="true"

# Run terminal in 256 colors for pretty vim!
if [[ "$TERM" == "xterm" ]]; then
      # No it isn't, it's gnome-terminal
      export TERM=xterm-256color
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# Customize to your needs...
export PATH=./bin:/usr/local/heroku/bin:/home/fpaboim/.rvm/gems/ruby-1.9.3-p286/bin:/home/fpaboim/.rvm/gems/ruby-1.9.3-p286@global/bin:/home/fpaboim/.rvm/rubies/ruby-1.9.3-p286/bin:/home/fpaboim/.rvm/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/fpaboim/.rvm/bin:/home/fpaboim/.rvm/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="./bin:$PATH"
