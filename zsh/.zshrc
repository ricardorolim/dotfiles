# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# Remove / to allow removing single directories from path
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rickroll/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# Edit command line
EDITOR=nvim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Aliases
alias ll='ls -l --color'
alias la='ll -a'
alias vim='nvim'
alias grep='grep --color'
# alias simkit='/home/rickroll/simscale/dataflows/backend/tools/simkit/build/install/simkit/bin/simkit'
alias simkit='/home/rickroll/simscale/dataflows-split/dataflow-tools/simkit-cli/build/install/simkit/bin/simkit'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Rust
source ~/.cargo/env

# Created by `pipx` on 2024-10-22 08:49:32
export PATH="$PATH:/home/rickroll/.local/bin"

# Pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
