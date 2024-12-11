# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Comment the ohmyzsh theme if using starship!!
# Bira
# ZSH_THEME="gnzh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
         zsh-autosuggestions 
         zsh-syntax-highlighting
         tmux)

source $ZSH/oh-my-zsh.sh

# Activate TMUX on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

eval "$(starship init zsh)"

# User configuration

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Python ENV aliases
alias mujocoenv="source ~/python-venvs/mujoco_env/bin/activate" 

