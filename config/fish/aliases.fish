# DIRS #########################################################################
alias ..   "cd .."
alias ...  "cd ../.."
alias .... "cd ../../.."
alias c-   "cd -"

# SHELL ########################################################################
alias h "history"
alias j "jobs"
# Read and merge history from disk
# https://github.com/fish-shell/fish-shell/issues/825#issuecomment-226685246
alias hr 'history --merge'

# GIT ##########################################################################
alias g  "git"
alias head "git show HEAD"
alias wip "git commit -a -m'WIP'"
alias unwip "git show HEAD; git reset HEAD~1"

# VIM ##########################################################################
alias v  "vim"
alias vi "vim"
alias vim-view-clean="rm ~/.vim/view/*"
alias retag="ctags -R --exclude=(basename ./.*) --exclude=log --exclude=tmp --exclude=node_modules --exclude=vendor"

# RUBY #########################################################################
alias r   "rake"
alias be  "bundle exec"
alias ber "bundle exec rake"

# IP ADDRESSES #################################################################
alias ip      "dig +short myip.opendns.com @resolver1.opendns.com"
alias ips     "ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias localip "ipconfig getifaddr en0"

# USEFUL TRICKS ################################################################

# Recursively delete `.DS_Store` files
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrashr "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# URL-encode strings
alias urlencoder 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Start HTTP server in current folder
alias servepwd "ruby -run -e httpd . -p 8888"

# Reload the shell (i.e. invoke as a login shell)
alias reload "exec $SHELL -l"

# MANAGING SERVICES ############################################################
alias redis.start "launchctl load   /usr/local/opt/redis/homebrew.mxcl.redis.plist"
alias redis.stop  "launchctl unload /usr/local/opt/redis/homebrew.mxcl.redis.plist"
alias mongo.start "launchctl load   /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist"
alias mongo.stop  "launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist"

# Postgres.app
alias pg.start "pg_ctl -D /Users/jacegu/Library/Application\ Support/Postgres/var-13 start"
alias pg.stop  "pg_ctl -D /Users/jacegu/Library/Application\ Support/Postgres/var-13 stop"

# Visual Studio Code
alias code "open -a Visual\ Studio\ Code"
