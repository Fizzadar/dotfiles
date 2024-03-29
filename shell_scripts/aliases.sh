#!/bin/sh

# Quicker
alias playbook='ansible-playbook'

# Flush OSX DNS cache
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# Rebuild spotlights index
alias reindex='sudo mdutil -E /'

# Server the current directory on localhost:8000
alias simpleserve='python -m http.server'

# mtr/htop better w/ sudo on OSX
alias mtr='sudo mtr'
alias htop='sudo htop'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# M1 intel switch
alias asintel='arch -x86_64 '
