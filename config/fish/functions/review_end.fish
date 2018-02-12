function review_end
  set current_branch (git branch | ag -Q \* | cut -f 2 -d ' ')

  if [ $current_branch = "master" ]
    echo "Already on master"
  else
    git co master
    git branch -D $current_branch
  end
end
