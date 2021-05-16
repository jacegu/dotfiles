function review_end
  set trunk (git remote show origin | grep 'HEAD' | cut -d':' -f2 | sed -e 's/^ *//g' -e 's/ *$//g')
  set current_branch (git branch | ag -Q \* | cut -f 2 -d ' ')

  if [ $current_branch = $trunk ]
    echo "Already on "$trunk
  else
    git co $trunk
    git branch -D $current_branch
  end
end
