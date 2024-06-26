export TERM='xterm-256color'
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit; compinit

if [ -d "$HOME/local/nvim" ]; then
    export PATH="$HOME/local/nvim/bin:$PATH"
fi

export VISUAL=nvim
export EDITOR=nvim
export HOMEBREW_NO_ANALYTICS=1
export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
export VI_MODE_SET_CURSOR=true

export ZSH="$HOME/.oh-my-zsh"

plugins=(vi-mode git brew zsh-fzf-history-search yarn zsh-z zsh-syntax-highlighting nx-completion docker)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.functions ] && source $HOME/.functions


autoload -U add-zsh-hook
load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


eval "$(op completion zsh)"; compdef _op op
export PATH="/usr/local/sbin:$PATH"

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
#source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

[ -f ~/.work ] && source ~/.work

[ -f ~/.aliases ] && source ~/.aliases
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(starship init zsh)"
