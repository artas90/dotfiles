export def main [] {
  let ns_dir = [$env.HOME, '.dotfiles', 'nushell', 'nu_scripts'] | path join
  let dir_exists = $ns_dir | path exists

  if not $dir_exists {
    git clone https://github.com/nushell/nu_scripts.git --depth 1 $ns_dir
  }
}
