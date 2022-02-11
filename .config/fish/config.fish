set fish_greeting ""

# File commands
alias cls="clear"
alias v="command vim"
alias vim="nvim"
alias ide="vim ."
alias python="python3"
alias ls="exa --group-directories-first --icons"
alias ll="ls -l --git"
alias la="ls -la --git"
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push" 

# npm & vim plugin
alias lsv="open http://localhost:8000/ && python -m http.server"
alias f="floaterm"

# WSL only
alias exp="explorer.exe"
alias open="powershell.exe /c start"

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

# FZF
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='-m --ansi --cycle --height 70% --layout reverse --info inline --border'

# fzf.fish
set fzf_preview_file_cmd bat --color=always --style=plain --line-range=:500 

