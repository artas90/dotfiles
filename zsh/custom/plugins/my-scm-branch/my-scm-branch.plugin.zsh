_parse_git_dirty() {
  if [ -z "$(git status -s)" ]; then
    echo "%{$fg[green]%}✓%{$reset_color%}"
  else
    echo "%{$fg[yellow]%}⚡%{$reset_color%}"
  fi
}

_parse_hg_dirty() {
  if [ -z "$(hg status 2>/dev/null)" ]; then
    echo "%{$fg[green]%}✓%{$reset_color%}"
  else
    echo "%{$fg[yellow]%}⚡%{$reset_color%}"
  fi
}

_parse_git_branch () {
  git symbolic-ref -q --short HEAD 2>/dev/null
}
_parse_git_tag () {
  git describe --tags --exact-match 2>/dev/null
}
_parse_git_commit () {
  PAGER= git log -1 --format='%h' 2>/dev/null
}

git_or_hg_branch () {
  git_branch=`_parse_git_branch || _parse_git_tag || _parse_git_commit`
  hg_branch=`hg branch 2>/dev/null`

  if [ ! $git_branch = "" ]; then
    echo "±:$git_branch:"`_parse_git_dirty` && return
  elif [ ! $hg_branch = "" ]; then
    echo "☿:$hg_branch:"`_parse_hg_dirty` && return
  else
    echo "○" && return
  fi
}
