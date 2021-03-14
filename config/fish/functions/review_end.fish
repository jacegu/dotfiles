function review_end
  set current_branch (git branch | ag -Q \* | cut -f 2 -d ' ')

  if [ $current_branch = "main" ]
    echo "Already on main"
  else
    git co main
    git branch -D $current_branch
  end
end
