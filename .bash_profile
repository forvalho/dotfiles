eval "$(rbenv init -)"

# Environment Variables
  export EDITOR='subl'
  export PATH="$HOME/bin:/usr/local/bin:$PATH"
  # Added by the Heroku Toolbelt
  export PATH="/usr/local/heroku/bin:$PATH"
  export LANG=en_US.UTF-8

# ALIASES
  # -l  long format
  # -F  / after dirs, * after exe, @ after symlink
  # -G  colorize
  # -g suppress owner
  # -o suppress group
  # -h humanize sizes
  # -q print nongraphic chars as question marks
  alias l="ls -lFGgohq"

  # git
  alias    git=hub
  alias     ga="git add"
  alias     gb="git branch"
  alias     gc="git commit -v"
  alias     gf="git fetch"
  alias     gh="git hist"
  alias     go="git checkout"
  alias     gp="git push"
  alias     gr="git rebase"
  alias     gs="git status"
  alias     gd="git diff --word-diff"
  alias     gg="git grep --break --heading -n"
  alias    gbc="git log --oneline master..HEAD"
  alias  daily="git log --pretty=format:'%Cred%h%Creset -%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --since yesterday --author francisco"
  alias weekly="git log --pretty=format:'%Cred%h%Creset -%Creset %s %Cgreen(%cD) %C(bold blue)<%an>%Creset' --since last_week --author francisco"

  # homebrew
  alias brew-formulas="open 'https://github.com/mxcl/homebrew/tree/master/Library/Formula'"

  # generic
  alias ss="python -m SimpleHTTPServer" # simple server (serves current dir on port 8000)

  # when you forget to bundle exec, just run `be` it will rerun the command with bundler
  # when you want to run a command with bundler, just prepend this function, ie `be rake spec`
  function be {
    if [ $# -eq 0 ]; then
      local command=bundle\ exec\ "$(history | grep -v '^ *[0-9]* *be$' | tail -1 | sed 's/^[ \t]*[0-9]*[ \t]*//')"
      echo expand to: "$command"
      eval "$command"
    else
      bundle exec "$@"
    fi
  }

source $HOME/.oh-my-git/prompt.sh

alias dw="docker-compose run --rm web $ARGV"
alias dwt="docker-compose run --rm -e RAILS_ENV=test web $ARGV"
eval $(docker-machine env default)
