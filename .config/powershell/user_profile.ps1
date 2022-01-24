# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme powerline #robbyrussel

# PSReadLine
Set-PSReadLineOption -EditMode Emacs 
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Icons
Import-Module -Name Terminal-Icons

# Alias
Set-Alias vim nvim
Set-Alias g git
Set-Alias ll dir
Set-Alias grep findstr
Set-Alias ide "C:\Users\tqtie\.config\powershell\ide.ps1"

# Utilities
function wtd([string]$command) {
  wt -w 0 $Command
}

function split([float]$size) {
  if ($size -eq $null) { wt -w 0 sp }
  else {
    wt -w 0 sp -s $size 
  }
}

function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
