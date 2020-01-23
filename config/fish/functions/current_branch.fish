function current_branch
  git branch | ag -Q \* | cut -f 2 -d ' '
end
