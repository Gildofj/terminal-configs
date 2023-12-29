export PATH=$HOME/bin:/usr/local/bin:/sbin/:$HOME/.cargo/bin:$HOME/.local/share/:$HOME/.local/share/bob/nvim-bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
  autoupdate
  tmux
)

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias upgrade="sudo apt update && sudo apt-fast upgrade -y && sudo apt-fast dist-upgrade -y"

# start new session of tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux list-sessions | grep -v attached | cut -d: -f1 | xargs -I {} tmux kill-session -t {} &
  wait
  tmux new-session
fi
