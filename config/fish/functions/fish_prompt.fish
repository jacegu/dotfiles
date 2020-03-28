function _my_pwd_prompt
 set -l prompt ""
 set -l chunks (pwd | string split "/")
 set -l chunks_pending (count $chunks)

 for chunk in $chunks
   if [ (string length $chunk) -gt 0 ]
     if [ $chunks_pending -le 2 ]
       set prompt "$prompt/$chunk"
     else
       set -l chunk_first_letter (string sub -l 1 $chunk)
       set prompt "$prompt/$chunk_first_letter"
     end
   end

   set chunks_pending (math $chunks_pending - 1)
 end

 echo "RESULT=$prompt"
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _short_git_branch_name
  set -l name (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')

  if [ (string length $name) -gt 20 ]
   set -l prefix (string sub --length=5 $name)
   set -l suffix (string sub --start=-15 $name)
   echo $prefix…$suffix
  else
    echo $name
  end
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_branch_prompt
  set -l normal (set_color normal)
  set -l cyan (set_color cyan)

  printf "$cyan%s" (_short_git_branch_name)
end

function _git_status_prompt
  set -l normal (set_color normal)
  set -l red (set_color red)
  set -l green (set_color green)

  if [ (_is_git_dirty) ]
    printf "$red✗$normal"
  else
    printf "$green✓$normal"
  end
end

function _git_prompt
  if [ (_git_branch_name) ]
    set -l normal (set_color normal)
    set -l git_branch_prompt (_git_branch_prompt)
    set -l git_status_prompt (_git_status_prompt)

    printf " $normal($git_branch_prompt $git_status_prompt$normal)"
  end
end

function _vi_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    switch $fish_bind_mode
      case default
          printf 'ⓝ'
      case insert
          printf 'ⓘ'
      case replace_one
          printf 'ⓡ'
      case visual
          printf 'ⓥ'
    end
  else
    printf ""
  end
end

function fish_prompt
  set -l normal (set_color normal)
  set -l black (set_color -o black)
  set -l purple (set_color magenta)

  set -g fish_prompt_pwd_dir_length 1
  set pwd_prompt (prompt_pwd)
  set git_prompt (_git_prompt)
  set vi_prompt  (_vi_prompt)

  printf "\n🦖 $normal$purple$pwd_prompt$git_prompt $black$vi_prompt ❯$normal "
end
