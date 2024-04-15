# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable colors.
autoload -U colors && colors

# Setting up a git integration and a command execution timer.
autoload -Uz vcs_info
precmd() {
  vcs_info
}

# Styling the git prompt integration.
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' %F{#5A5A5A}%b%u%c%f'

# Configuring the prompt.
NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT='%F{red}[%n@%m]%f %{$fg_bold[cyan]%}%~%{$reset_color%}%F{red}${vcs_info_msg_0_}%f%f%{$fg[green]%}${NEWLINE}'
PROMPT+="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})> %{$reset_color%}"

# Fixing CTRL+Arrows issue.
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Fixing the delete button issue.
bindkey "^[[3~" delete-char

# Aliases.
alias vim="JAVA_HOME=/usr/lib/jvm/java-17-openjdk nvim"
alias v="JAVA_HOME=/usr/lib/jvm/java-17-openjdk nvim"
alias shutdown="shutdown now"
alias ls="ls --color=auto"
alias wifi="$HOME/scripts/rofi/wifi-menu.sh &"
alias wlppr="$HOME/scripts/rofi/wallpaper.sh &"
alias emoji="rofi -modi emoji -show emoji &"
alias power="$HOME/scripts/rofi/power-menu.sh &"
alias fucking="sudo"
alias install="pacman -S"
alias clipboard="rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"
alias t="tmux new -s $(basename $(pwd))"
alias nf="neofetch"
alias batman="sudo pacman"

# Loading plugins.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# These 2 plugins are buggy and I don't like them anymore.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh (BUGGY AND CRASHES)

# Created by `pipx` on 2024-02-21 20:38:47
export PATH="$PATH:/home/omar/.local/bin:/home/omar/.cargo/bin"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
