# Init starship shell propmp
starship init fish | source

# Remove greeting
set fish_greeting

# Switch PHP version to 7.2
alias php72='/Applications/MAMP/bin/php/php7.2.10/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php7.2.10.ini"'

# Clear screen
alias c='clear'

# Switch node version to default
alias nn='nvm use default'

# Folders
alias ii='cd ~/INVIA/web'
alias zz='cd ~/htdocs/zoot-3.0/'

# Create-sk-app
alias create-sk-app="npx git+ssh://bitbucket.org/superkoders/create-sk-app.git"

# Docker
alias dc='docker-compose'

# Utils
function take
  mkdir -p $argv; cd $argv
end

# Upload a file to send.firefox.com
alias transfer='ffsend upload --copy'

# Network
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias localip="ifconfig $LOCAL_NET_IFACE | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1"

# Reload the shell (i.e. invoke as a login shell)
alias rr='exec {$SHELL} -l'

# Lock the screen (when going AFK)
alias afk='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Flush Directory Service cache
alias flush='dscacheutil -flushcache && killall -HUP mDNSResponder'

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# GIT
alias gp='git push origin HEAD'
alias gst='git status -sb'
alias gll='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbia='git rebase -i --autosquash'
alias grbc='git rebase --continue'
alias gcma='git commit --amend --no-edit'
alias gcmf='git commit --fixup'
alias gfa='git fetch --all'
alias gfar='git fetch --all && git rebase origin/master'
alias gfad='git fetch --all && git rebase origin/devel'
alias gt='git log --since=00:00:00 --all --no-merges --oneline --author=viktor.danko@superkoders.com'
alias grcp='git log --all --oneline --no-merges --author=viktor.danko@superkoders.com'
alias gstats='git shortlog -n -s --no-merges'

# Show/hide desktop icons
alias showdesktop 'defaults write com.apple.finder CreateDesktop false; killall Finder'
alias hidedesktop 'defaults write com.apple.finder CreateDesktop true; killall Finder'

# Volta stuff
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -g fish_user_paths "/usr/local/opt/php@7.2/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.2/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/php@7.2/bin" $fish_user_paths
