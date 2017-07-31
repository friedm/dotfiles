function fish_prompt
  set host (hostname -s)
  set path (pwd)
  set path (string replace -r "$HOME" '~' $path)
  set git_dirty (git diff --shortstat ^/dev/null)
  set git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  if test $git_branch
    if test $git_dirty
      set git_dirty "*"
    end
    set git_prompt "($git_branch$git_dirty)"
  end

  set_color --bold white
  echo -n '['$USER@$host" "$path
  set_color 69A
  echo -n $git_prompt
  set_color --bold white
  echo -n "]\$ "
end
