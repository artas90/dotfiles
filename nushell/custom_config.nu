source ./default_config.nu
use ./nu_scripts/themes/tender.nu
# use ./nu_scripts/completions *
use ./nu_scripts/keybindings/fuzzy-history.nu
use ./nu_scripts/keybindings/fuzzy-directory.nu

let keybindings_cfg = $env.config.keybindings
  | append (fuzzy-history)
  | append (fuzzy-directory)

$env.config = ($env.config | merge {
  show_banner: false
  color_config: (tender)
  table: {
    mode: light # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: auto # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
    header_on_separator: true # show header text on separator/border line
  }
  keybindings: $keybindings_cfg
})

# aliases
alias .. = cd ..
alias la = ls --all
alias ll = ls

def lst [] { ls | get name | to text }
