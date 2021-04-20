# init prompt
starship init fish | source

# update default settings and color scheme
set fish_greeting
set fish_color_command white --bold
set fish_color_param white
set fish_color_end white --bold
set fish_color_quote green

# set global variables
set -gx LC_ALL 'en_US.UTF-8'
set -gx EDITOR micro
set -gx VISUAL micro

# use gnu version of utils(find, grep, aws, etc.) on osx by default
if type gfind &>/dev/null
  set GNUBINPATH (gfind -L /usr/local/opt -maxdepth 3 -type d -name gnubin)
  set GNUMANPATH (gfind -L /usr/local/opt -maxdepth 3 -type d -name gnuman)

  set PATH $GNUBINPATH $PATH
  set MANPATH $GNUMANPATH $MANPATH
end

# custom functions

function dict_set --argument-names dict key value
  set -g $dict'__'$key $value
end

function dict_get --argument-names dict key
  eval echo \$$dict'__'$key
end
