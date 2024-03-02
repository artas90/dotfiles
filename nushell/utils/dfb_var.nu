export def dfb-var-set [name, val] {
  let fname = $"~/.dotfiles/.vars/($name)";
  echo $val | save -f $fname;
}

export def --env dfb-var [name, --ask] {
  let fname = $"~/.dotfiles/.vars/($name)"
  mut val = if ($fname | path exists) { open $fname | str trim } else { "" }

  if $val == "" or $ask {
    print $"Please enter ($name) \(($val)\): "
    let newval = (input)

    if ($newval | str trim) != "" {
      $val = $newval;
      dfb-var-set $name $val;
    }
  }

  if $val == "" {
    dfb-var $name
    return;
  }

  load-env { $name: $val }
}
