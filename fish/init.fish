starship init fish | source

set -gx LC_ALL 'en_US.UTF-8'
set -gx EDITOR micro
set -gx VISUAL micro

if type gfind &>/dev/null
  set GNUBINS (gfind -L /usr/local/opt -maxdepth 3 -type d -name gnubin)
  set GNUMANPATH (gfind -L /usr/local/opt -maxdepth 3 -type d -name gnuman)

  set PATH $GNUBINS $PATH
  set MANPATH $GNUMANPATH $MANPATH
end
