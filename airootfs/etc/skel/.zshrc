#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -f ~/.zshrc-personal ]] && source ~/.zshrc-personal
export PATH=~/.local/bin:$PATH
[[ -f ~/.aliases ]] && source ~/.aliases
source <(starship init zsh --print-full-init)
[[ $(command -v grab) ]] && grab
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
