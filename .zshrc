# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/apache-maven-3.6.3/bin

# Add my own custom scripts
export PATH=$PATH:/Users/robertkula1/projects/scripts

# Path to your oh-my-zsh installation.
export ZSH="/Users/robertkula1/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Plugin Settings
bindkey '^ ' autosuggest-execute

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

export GPG_TTY=$(tty)

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias gc="git commit -S -m"
alias clr="clear"
alias ideavim="nvim ~/.ideavimrc"
alias services="mvn spring-boot:run"
alias sourcez="source ~/.zshrc"
alias sourcev="source ~/.vimrc"
alias vim="nvim"
alias dotfiles="cd ~/.dotfiles"
alias pf="fzf --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
