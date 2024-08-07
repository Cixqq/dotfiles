# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Download Znap, if it's not there yet.
# [[ -r ~/Repos/znap/znap.zsh ]] ||
#     git clone --depth 1 -- \
#         https://github.com/marlonrichert/zsh-snap.git ~/repos/znap
source ~/repos/znap/znap.zsh  # Start Znap

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
alias nf="neofetch"
alias batman="sudo pacman"

# Tmux related aliases.
alias t="tmux new -s `basename $PWD`"
alias tl="tmux list-session"
alias tx="tmux kill-session -t"
alias ta="tmux attach"

# Git related aliases.
alias gadd="git add ."
alias gcom="git commit -m"
alias gpsh="git push"
alias gpsho="git push origin"
alias gdiff="git diff"

# Loading plugins.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# These 2 plugins are buggy and I don't like them anymore.
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh # (BUGGY AND CRASHES)
# source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
# znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-completions
# Created by `pipx` on 2024-02-21 20:38:47
export PATH="$PATH:/home/omar/.local/bin:/home/omar/.cargo/bin"
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/p10k_lean.toml)"
