#!/bin/sh

__powerline() {

    # Unicode symbols
    PS_SYMBOL_DARWIN=''
    PS_SYMBOL_LINUX='$'
    PS_SYMBOL_OTHER='%'
    GIT_BRANCH_SYMBOL='⑂ '
    GIT_BRANCH_CHANGED_SYMBOL='+'
    GIT_NEED_PUSH_SYMBOL='⇡'
    GIT_NEED_PULL_SYMBOL='⇣'

    # Solarized colorscheme
    FG_BASE03="\[$(tput setaf 8)\]"
    FG_BASE02="\[$(tput setaf 0)\]"
    FG_BASE01="\[$(tput setaf 10)\]"
    FG_BASE00="\[$(tput setaf 11)\]"
    FG_BASE0="\[$(tput setaf 12)\]"
    FG_BASE1="\[$(tput setaf 14)\]"
    FG_BASE2="\[$(tput setaf 7)\]"
    FG_BASE3="\[$(tput setaf 15)\]"

    BG_BASE03="\[$(tput setab 8)\]"
    BG_BASE02="\[$(tput setab 0)\]"
    BG_BASE01="\[$(tput setab 10)\]"
    BG_BASE00="\[$(tput setab 11)\]"
    BG_BASE0="\[$(tput setab 12)\]"
    BG_BASE1="\[$(tput setab 14)\]"
    BG_BASE2="\[$(tput setab 7)\]"
    BG_BASE3="\[$(tput setab 15)\]"

    FG_YELLOW="\[$(tput setaf 3)\]"
    FG_ORANGE="\[$(tput setaf 9)\]"
    FG_RED="\[$(tput setaf 1)\]"
    FG_MAGENTA="\[$(tput setaf 5)\]"
    FG_VIOLET="\[$(tput setaf 13)\]"
    FG_BLUE="\[$(tput setaf 4)\]"
    FG_CYAN="\[$(tput setaf 6)\]"
    FG_GREEN="\[$(tput setaf 2)\]"

    BG_YELLOW="\[$(tput setab 3)\]"
    BG_ORANGE="\[$(tput setab 9)\]"
    BG_RED="\[$(tput setab 1)\]"
    BG_MAGENTA="\[$(tput setab 5)\]"
    BG_VIOLET="\[$(tput setab 13)\]"
    BG_BLUE="\[$(tput setab 4)\]"
    BG_CYAN="\[$(tput setab 6)\]"
    BG_GREEN="\[$(tput setab 2)\]"

    DIM="\[$(tput dim)\]"
    REVERSE="\[$(tput rev)\]"
    RESET="\[$(tput sgr0)\]"
    BOLD="\[$(tput bold)\]"

    if [[ -z "$PS_SYMBOL" ]]; then
      case "$(uname)" in
          Darwin)   PS_SYMBOL=$PS_SYMBOL_DARWIN;;
          Linux)    PS_SYMBOL=$PS_SYMBOL_LINUX;;
          *)        PS_SYMBOL=$PS_SYMBOL_OTHER;;
      esac
    fi

    __git_info() {
        [ -x "$(which git)" ] || return    # git not found

        # get current branch name or short SHA1 hash for detached head
        local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
        [ -n "$branch" ] || return  # git branch not found

        local marks

        # branch is modified?
        [ -n "$(git status --porcelain)" ] && marks+=" $GIT_BRANCH_CHANGED_SYMBOL"

        # how many commits local branch is ahead/behind of remote?
        local stat="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
        local aheadN="$(echo $stat | grep -o 'ahead \d\+' | grep -o '\d\+')"
        local behindN="$(echo $stat | grep -o 'behind \d\+' | grep -o '\d\+')"
        [ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
        [ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

        # print the git branch segment without a trailing newline
        printf " $GIT_BRANCH_SYMBOL$branch$marks "
    }

    __python_info() {
        local python_version='system'
        local virtual_env

        if [ -x "$(which pyenv)" ]; then
            python_version=`pyenv version-name`
        fi

        if [ -n "$VIRTUAL_ENV" ]; then
            virtual_env=`basename $VIRTUAL_ENV`
            if [ ! "$virtual_env" = "$python_version" ]; then
                python_version="$python_version (venv:${virtual_env})"
            fi
        fi

        printf " py:$python_version "
    }

    __js_info() {
        local node_version

        if [ -x "$(which nodenv)" ]; then
            node_version=`nodenv version-name`
        fi

        if [ -n "$NODE_MODULES_VIRTUAL_ENV" ]; then
            node_version="$node_version (nm:$NODE_MODULES_VIRTUAL_ENV)"
        fi

        [ -x "$(which nodenv)" ] || return
        printf " js:$node_version "
    }

    ps1() {
        # Check the exit code of the previous command and display different
        # colors in the prompt accordingly.
        if [ $? -eq 0 ]; then
            local FG_EXIT="$BG_GREEN"
        else
            local FG_EXIT="$BG_RED"
        fi

        # Check user.email is set when in a git repo - latest git appears to happily parse (none) as email
        if [ `git symbolic-ref --short HEAD 2>/dev/null` ]; then
            if [ "`git config user.email`" = "" ]; then
                echo "$(tput bold)$(tput setaf 1)Warning: no git user.email config set!$(tput sgr0)"
            fi

            if [ "`git config user.signingKey`" = "" ]; then
                echo "$(tput bold)$(tput setaf 1)Warning: no git user.signingKey config set!$(tput sgr0)"
            fi
        fi

        PARENTDIR=$(basename "$(dirname "$(realpath ..)")")
        DIR=$(basename "$(dirname "$(pwd)")")
        echo -ne "\033]0;$PARENTDIR/$DIR/`basename "$PWD"`\007"

        PS1="$BG_BASE1$FG_BASE3 \w $RESET"

        PS1+="$BG_CYAN$FG_BASE3$(__python_info)$RESET"
        PS1+="$BG_ORANGE$FG_BASE3$(__js_info)$RESET"
        PS1+="$BG_BLUE$FG_BASE3$(__git_info)$RESET"

        PS1+="$FG_EXIT $FG_BASE3$PS_SYMBOL $RESET "
    }

    PROMPT_COMMAND=ps1
}

__powerline
unset __powerline
