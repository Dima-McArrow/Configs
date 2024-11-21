# ~/.zshrc file for zsh interactive shells.

# Zsh options
setopt autocd interactivecomments magicequalsubst nonomatch notify numericglobsort promptsubst

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
PROMPT_EOL_MARK=""         # Hide EOL sign ('%')

# Keybindings configuration
bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^[[3;5~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo

# Enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify

alias history="history 0"

# Configure `time` format
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Fancy two-line prompt without Git

autoload -Uz colors
colors

# First line: Time and current directory in green and blue
PROMPT='%{$fg[green]%}%* %{$fg[blue]%}%~ %{$reset_color%}
'

# Second line: Username and hostname in cyan, followed by prompt symbol
PROMPT+='%{$fg[cyan]%}%n@%m %{$reset_color%}%# '

# Enable color support for ls, less, and man
if command -v dircolors > /dev/null; then
    eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias updateer='~/scripts/updateer.sh'
alias expressapp='~/scripts/node_express.sh'
alias gc='~/scripts/gc.sh'
alias gitinit='~/scripts/gitinit.sh'
alias express='~/scripts/node_express.sh'
alias vim='nvim'
alias python='python3'
alias pip='pip3'
alias vim='nvim'

# Auto-suggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# Syntax-highlighting
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Command-not-found hook for Ubuntu
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# Add Homebrew to PATH
export PATH="/usr/local/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"

# Add Kitty terminal to PATH
export PATH="$PATH:$HOME/.local/kitty.app/bin"

# delta configuration
export DELTA_FEATURES=+side-by-side

if [[ "$TERM_PROGRAM" == "WarpTerminal" ]]; then
    eval "$(starship init zsh)"
    fastfetch

    # WarpTerminal configuration

    # bat configuration
    export BAT_THEME="Monokai Extended"

    # aliases
    alias ls='eza --color=always --icons=always'
    alias la='eza -a --color=always --icons=always'
    alias ll='eza -l --color=always'
    alias cat='bat'
fi

if [[ "$TERM" == "xterm-kitty" ]]; then
    # add Starship
    eval "$(starship init zsh)"
    fastfetch
    # bat config
    export BAT_THEME="Monokai Extended"
    
    #aliases
    alias ls='eza --color=always --icons=always'
    alias la='eza -a --color=always --icons=always'
    alias ll='eza -l --color=always'
    alias cat='bat'

    # fzf configuration
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh)
    # Set preview for file search
    export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {}"'
    # Set up Git fzf
    source ~/.fzf-git.sh
fi


if [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then
    # fzf configuration
    # Set up fzf key bindings and fuzzy completion
    source <(fzf --zsh)
    # Set preview for file search
    export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {}"'
    # Set up Git fzf
    source ~/.fzf-git.sh
fi
source /home/dimitri-makarov/.config/op/plugins.sh
