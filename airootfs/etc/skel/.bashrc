#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -f ~/.bashrc-personal ]] && source ~/.bashrc-personal
export PATH=~/.local/bin:$PATH
[[ -f ~/.aliases ]] && source ~/.aliases
source <(starship init bash --print-full-init)
[[ $(command -v grab) ]] && grab
PS1='[\u@\h \W]\$ ' # this works ONLY on bash, use Starship instead.
