function rubofix
  staged_files | xargs -t bundle exec rubocop --format simple --auto-correct
end
