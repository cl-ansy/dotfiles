export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export LANG="en_US.UTF-8"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"
if [ ! -d "$(dirname "$ZSH_CACHE_DIR")" ]; then
  mkdir -p "$(dirname "$ZSH_CACHE_DIR")"
fi

export ZSH_COMPDUMP=$ZSH_CACHE_DIR/.zcompdump
export HISTFILE=$ZSH_CACHE_DIR/.history

export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Install zinit plugin manager
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "${ZDOTDIR}/.p10k.zsh" ]] || source "${ZDOTDIR}/.p10k.zsh"
(( ! ${+functions[p10k]} )) || p10k finalize

fpath+=( $ZDOTDIR/functions )
autoload -Uz $fpath[-1]/*(.:t)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls="ls -lah --color=auto"
alias gls="git status"
alias gfr="git fetch; git rebase"
alias vim="nvim"

export EDITOR=nvim
export PAGER=less

# Load any local configs
[[ ! -f "${ZDOTDIR}/.zshrc.local" ]] || source "${ZDOTDIR}/.zshrc.local"
