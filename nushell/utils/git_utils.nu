def _parse_git_dirty [] {
  if (^git status -s | str length) > 0 {
    $"(ansi yellow)⚡(ansi reset)"
  } else {
    $"(ansi green)✓(ansi reset)"
  }
}

def _parse_git_branch [] {
  do { ^git symbolic-ref -q --short HEAD } | complete | get stdout | str trim
}
def _parse_git_tag [] {
  do { ^git describe --tags --exact-match } | complete | get stdout | str trim
}
def _parse_git_commit [] {
  $env.PAGER = ""
  do { ^git log -1 --format='%h' } | complete | get stdout | str trim
}
def _git_parse_anyref [] {
  let res = _parse_git_branch
  if (not ($res | is-empty)) { return $res }

  let res = _parse_git_tag
  if (not ($res | is-empty)) { return $res }

  let res = _parse_git_commit
  if (not ($res | is-empty)) { return $res }

  return ""
}

export def git_info [] {
  let gitref = _git_parse_anyref
  if ($gitref | is-empty) { return "" }
  return $"±:($gitref):(_parse_git_dirty)"
}
