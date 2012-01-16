# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# use incremental search
bindkey "^R" history-incremental-search-backward

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# Enable extended globbing
setopt EXTENDED_GLOB

export PATH=/usr/local/bin:/usr/local/share/python:$PATH
export NODE_PATH=/usr/local/lib/node_modules
# load brew autocompletion
fpath=(/usr/local/etc/bash_completion.d $fpath)

# tips from peepcode setup 
# http://blog.peepcode.com/blog/2012/my-command-line-prompt 

# Colors
autoload -U colors
colors
setopt prompt_subst

# prompt
PROMPT='[%~] '
RPROMPT=' $(~/.zsh/bin/git-cwd-info.rb)%{$reset_color%}'

# a place for the local confs
if [ -e "$HOME/.zshrc_local" ]; then
  source "$HOME/.zshrc_local"
fi

eval "$(rbenv init -)"
