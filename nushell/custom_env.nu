source ./default_env.nu
use ./utils/git_utils.nu

def my_left_prompt [] {
  let user_color = (if (is-admin) { ansi red } else { ansi yellow })
  let user_segment = $"($user_color)($env.USER)(ansi reset)"

  let hostname = $"(ansi green)(sys | get host.hostname)(ansi reset)"

  let dir = $env.PWD | str replace --regex  $"^($nu.home-path)" "~"
  let path_segment = $"(ansi cyan)($dir)(ansi reset)"

  $"($user_segment):($hostname):($path_segment) (git_utils git_info)\nλ "
}

$env.PROMPT_COMMAND = { my_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| "" }

$env.PROMPT_INDICATOR = {|| "" }
