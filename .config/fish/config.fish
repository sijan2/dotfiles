# ============================
# Silence the Fish Greeting
# ============================

set -g fish_greeting ""

# ============================
# Global Environment Variables
# ============================

# Editor and Browser
set -Ux EDITOR code
set -Ux BROWSER "/Applications/Arc.app/Contents/MacOS/Arc"

# Android SDK Paths
set -gx ANDROID_HOME "$HOME/Library/Android/sdk"
set -gx ANDROID_NDK "$ANDROID_HOME/ndk/"(ls -1 "$ANDROID_HOME/ndk" | sort -V | tail -n 1)
set -x PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH

# PNPM Configuration
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# GPG Configuration
set -x GPG_TTY (tty)

# OpenAI API Key (Consider storing this securely)
set -gx OPENAI_API_KEY "sk-<your-api-key>"

# Fish User Paths
set -Ux fish_user_paths "/Applications/Android Studio.app/Contents/MacOS" $fish_user_paths

# ============================
# Aliases
# ============================

# System Commands
alias off='osascript -e "tell app \"System Events\" to shut down"'
alias clr="clear"
alias e="exit"

# Navigation Shortcuts
alias home="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Application Shortcuts
alias chat="open -a ChatGPT"
alias arc="open -a Arc"
alias iphone="open -a Simulator"
alias pixel="scrcpy --turn-screen-off --stay-awake"

# Network Utilities
alias ip="ipconfig getifaddr en0"
alias ip4="curl https://www.sijan.codes/ip"

# Git and SSH Configurations
alias sshhome="cd ~/.ssh"
alias sshconfig="code ~/.ssh/config"
alias gitconfig="code ~/.gitconfig"

# File Operations
alias ls='eza -l --color=always --group-directories-first --icons'        # Preferred listing
alias la='eza -a --color=always --group-directories-first --icons'        # All files and dirs
alias ll='eza -al --color=always --group-directories-first --icons'       # Long format
alias l.='eza -ald --color=always --group-directories-first --icons .*'   # Show only dotfiles
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias du="du -hd 1 | sort -hr | head -n 10"
alias rmnm="rm -rf ./node_modules"

# Editors and Utilities
alias c="code"
alias config="code ~/.config/fish/config.fish"
alias reload="source ~/.config/fish/config.fish"
alias cat='bat --style header --style snip --style changes --style header'
alias edit="code (fzf --preview 'bat --color=always {}')"
alias n="nvim"
alias pn="pnpm"
alias python="python3"
alias wget="wget -c"
alias ai="gh copilot explain"
alias idk="gh copilot suggest"

# Compilers (Homebrew GCC)
alias gc="gcc-14"
alias gcpp="g++-14"

# ============================
# Functions
# ============================

# Create directory and move into it
function mkcd
    mkdir -p $argv; and cd $argv
end

# Backup a file
function backup --argument filename
    cp $filename $filename.bak
end

# Copy directory or files
function copy
    set count (count $argv)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (string trim --right --chars='/' -- $argv[1])
        set to $argv[2]
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Tree view with eza
function lt
    if test (count $argv) -eq 1
        eza -aT --color=always --group-directories-first --icons --ignore-glob=".git|node_modules|$argv[1]"
    else
        eza -aT --color=always --group-directories-first --icons --ignore-glob=".git|node_modules"
    end
end

# ============================
# Shell Integration and Prompt
# ============================

# Starship prompt
starship init fish | source

# iTerm2 integration
if test -e "$HOME/.iterm2_shell_integration.fish"
    source "$HOME/.iterm2_shell_integration.fish"
end

# ============================
# Key Bindings and Plugins
# ============================

# FZF key bindings
fzf --fish | source

# Zoxide initialization
zoxide init fish | source

# ============================
# Interactive Session Commands
# ============================

if status is-interactive
    # Interactive commands here
end