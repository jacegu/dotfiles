function review_start
  set branch $argv[1]
  git fetch origin $branch:$branch
  git checkout $branch
end
