set fish_greeting ""

# File commands
alias cls="clear"
alias v="command vim"
alias vim="nvim"
alias ide="vim ."
alias python="python3"
alias ls="exa --sort type --group-directories-first --icons"
alias ll="ls -l --git --grid"
alias la="ls -la --git --grid"
alias g="git"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push" 
alias npm="pnpm"
alias npx="pnpm dlx"


# Live server & vim plugin
alias lsv="open -inprivate http://localhost:8000/ && live-server --port=8000"
alias f="floaterm"


# Python
function py -d "Run python script" 
  command python3 $argv
end


# C / C++
function cl -d "Compile c/cpp files and run"
	set --local extension (echo $argv | awk -F. '{print $NF}')
	if test "cpp" = $extension
		set -l out (string replace .cpp .out $argv) 
    command g++ $argv -o $out && ./$out
	else 
		set -l out (string replace .c .out $argv) 
		command gcc $argv -o $out && ./$out
	end
end


# Java
function jv -d "Run java project"
  command javac $argv && java (string replace .java '' $argv)
end

export JDTLS_HOME=/home/tientrinh/.jdtls


# Themes
starship init fish | source


# FZF
export FZF_DEFAULT_COMMAND='fd --type file --color=always'
export FZF_DEFAULT_OPTS='-m --ansi --cycle --height 70% --layout reverse --info inline --border'

# fzf.fish
set fzf_preview_file_cmd bat --color=always --style=plain --line-range=:500 


# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH


# WSL only
alias see="explorer.exe"
alias open="cmd.exe /c start msedge"

# Window terminal (duplicate tab/pane)
function storePathForWindowsTerminal --on-variable PWD
    if test -n "$WT_SESSION"
      printf "\e]9;9;%s\e\\" (wslpath -w "$PWD")
    end
end
