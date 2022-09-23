#!/usr/bin/env fish

function cmd_main -a cmd from to
  if _has_empty "$cmd" "$from" "$to" or not _one_of "$cmd" "scp" "docker"
    echo 'Usage: syncto scp|docker <local-dir-1>:<local-dir-2>:... <remote>:<root-path>'
    echo
    return
  end

  set from $from | string replace ':' ' ' | string trim
  set self (status --current-filename)

  ulimit -n 999999

  echo "Syncing \"$from\" to \"$to\" via \"$cmd\"..."
  find $from -type f | entr -np echo /_ | "$self" "_$cmd" "$(pwd)" "$to"
end

function cmd_subcmd -a subcmd thisdir to
  if _has_empty "$subcmd" "$thisdir" "$to"; return; end

  set cmd ""
  set first ""
  set filename ""

  test "$subcmd" = "_scp" && _check_control_path

  while read filename
    set filename (echo $filename | string replace -a -r "^$thisdir/" "")

    if test "$subcmd" = "_scp"
      set cmd "scp $controlpath $filename $to/$filename"
    else if test "$subcmd" = "_docker"
      set cmd "docker cp $filename $to/$filename"
    end

    echo 
    echo "$cmd"
    eval "$cmd"
  end < /dev/stdin
end

function _check_control_path
  if test -n "$SSH_CONTROL_PATH"
    set -gx controlpath "-o ControlPath=$SSH_CONTROL_PATH"
    return
  end

  echo
  echo 'Recomendation to speed up upload via scp:'
  echo
  echo '  Login in a first shell and share connection:'
  echo '    ssh -o ControlPath=~/.ssh/some-shared -o ControlMaster=auto -o ControlPersist=9999 some.host'
  echo
  echo '  Then in a second shell set this parameter before run:'
  echo '    export SSH_CONTROL_PATH="~/.ssh/some-shared"'
  echo '    syncto some/path some.host:/remote/path'
  echo
end

function _has_empty
  for var in $argv
    if test -z "$var"; return 0; end
  end
  return 1
end

function _one_of -a x
  for var in $argv[2..]
    if test "$var" = "$x"; return 0; end
  end
  return 1
end

if _one_of $argv[1] "_scp" "_docker" then
  cmd_subcmd $argv
else
  cmd_main $argv
end
