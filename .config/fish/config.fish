set fish_greeting ""

# File commands
alias cls="clear"
alias v="command vim"
alias vim="nvim"
alias python="python3"
alias cl="g++"
alias ls="exa --group-directories-first --icons"

function py -d "Run python script without typing the extension" 
  command python3 $argv.py
end

function cl -d "Compile c/cpp files and run (without typing the extension)"
  if test -e $argv.c
    command gcc $argv.c -o $argv && ./$argv
  else if test -e $argv.cpp
    command g++ $argv.cpp -o $argv && ./$argv
  end
end

# Themes
starship init fish | source

# Env variables
export FZF_DEFAULT_OPTS='-m --height 50% --layout reverse --info inline --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'
