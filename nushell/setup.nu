let custom_env = [$env.HOME, '.dotfiles', 'nushell', 'custom_env.nu'] | path join
let custom_config = [$env.HOME, '.dotfiles', 'nushell', 'custom_config.nu'] | path join

echo $"source ($custom_env)" | save -f $nu.env-path
echo $"source ($custom_config)" | save -f $nu.config-path

echo $"[($nu.env-path)]"
cat $nu.env-path

echo $"\n\n[($nu.config-path)]"
cat $nu.config-path

echo $"\n"

nu _update.nu
