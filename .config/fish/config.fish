# Remove greeting
set fish_greeting
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/postgresql@16/bin

# zoxide
zoxide init fish | source

# more ergonomic cd
alias f='z'

# Clear screen
alias c='clear'

# Docker
alias dc='docker-compose'

# Utils
function take
    mkdir -p $argv
    cd $argv
end

# Upload a file to send.firefox.com
alias transfer='ffsend upload --copy'

# Open up fish config
alias fsh="nvim $__fish_config_dir/config.fish"

# Network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias localip="ifconfig $LOCAL_NET_IFACE | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1"

# Reload the shell (i.e. invoke as a login shell)
alias rr='exec {$SHELL} -l'

# Direnv
alias dr="direnv reload"
alias cnfg="nvim ~/.config"

# Flush Directory Service cache
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# GIT
alias gp='git push -u origin HEAD'
alias s='git status -sb'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gpl="git pull --no-ff"
alias grb='git rebase'
alias grbb='git rebase origin/main'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
alias grbi='git rebase -i'
alias grbia='git rebase -i --autosquash'
alias grbc='git rebase --continue'
alias gcm='git commit'
alias gcma='git commit --amend --no-edit'
alias gcmaf='git commit --amend --no-edit && git push --force-with-lease'
alias gcmf='git commit --fixup'
alias gfa='git fetch --all'
alias gfar='git fetch --all && git rebase origin/main'
alias gt='git log --since=00:00:00 --all --no-merges --oneline --author=vik@panter.ch'
alias grcp='git log --all --oneline --no-merges --author=vik@panter.ch'
alias gstats='git shortlog -n -s --no-merges'
alias undo="git reset --soft HEAD~1"
alias dd="yarn dev"
alias pp="pnpm dev"

alias p="pnpm"
# Show/hide desktop icons
alias showdesktop 'defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias hidedesktop 'defaults write com.apple.finder CreateDesktop -bool false && killall Finder'

# # Volta stuff

# Init starship shell propmp
starship init fish | source

direnv hook fish | source

# VSC
# use fish in vscode terminal
string match -q "$TERM_PROGRAM" vscode
and . (code --locate-shell-integration-path fish)

# Set NVM_DIR environment variable
set -gx NVM_DIR "$HOME/.nvm"

# Load nvm wrapper function
function nvm
    bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end

# Load nvm bash completion
if test -s "$NVM_DIR/bash_completion"
    bass source "$NVM_DIR/bash_completion"
end

alias cc="open $1 -a \"Cursor\""

# React native stuff
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.meteor:$PATH"
export PATH="/Users/viktordanko/.local/bin:$PATH"

export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig"
export TREZOR_PRE_COMMIT_ESLINT_SKIP=true

if status --is-interactive
    and test -d ~/.rbenv
    and test -f ~/.rbenv/bin/rbenv
    ~/.rbenv/bin/rbenv init - | source
end

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/viktordanko/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/viktordanko/Downloads/google-cloud-sdk/path.fish.inc'
end

# pnpm
set -gx PNPM_HOME /Users/viktordanko/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

status --is-interactive; and rbenv init - fish | source



alias claude="/Users/viktordanko/.claude/local/claude"
