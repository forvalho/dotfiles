# Environment Variables
  export EDITOR='subl -w'
  export PATH="$HOME/bin:/usr/local/bin:$PATH"
  eval "$(rbenv init -)"


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

# source $HOME/.oh-my-git/prompt.sh
