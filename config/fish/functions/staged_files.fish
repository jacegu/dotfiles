function staged_files
  git diff --cached --name-only --diff-filter=AMC | sort | tr '\n' ' '
end
