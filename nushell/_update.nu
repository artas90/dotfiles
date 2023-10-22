def add [path, save_to, --raw] {
  const nu_scripts = "https://raw.githubusercontent.com/nushell/nu_scripts/main";

  let script_path = $"($nu_scripts)/($path)"
  let save_to = $"nu_scripts/($save_to)"

  mut content = http get $script_path | to text
  if $raw {
    let trimmed = $content | str trim --char (char newline)
    $content = $"export def main [] {\n($trimmed)\n}"
  }

  echo $content | save -f $save_to
  echo $"($script_path) -> ($save_to)"
}

mkdir nu_scripts/completions nu_scripts/keybindings nu_scripts/themes

add "themes/nu-themes/tender.nu" "themes/tender.nu"

add "custom-completions/git/git-completions.nu" "completions/cmp-git.nu"
add "custom-completions/npm/npm-completions.nu" "completions/cmp-npm.nu"
add "custom-completions/yarn/yarn-completion.nu" "completions/cmp-yarn.nu"

add "custom-menus/fuzzy/history.nu" "keybindings/fuzzy-history.nu" --raw
add "custom-menus/fuzzy/directory.nu" "keybindings/fuzzy-directory.nu" --raw

config env --default | save -f default_env.nu
echo default_env.nu

config nu --default | save -f default_config.nu
echo default_config.nu
