
[[ -f "$HOME/.terminal/zsh/git-prompt.sh" ]] && source "$HOME/.terminal/zsh/git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

PROMPT='
%{$fg[blue]%}── %{$reset_color%}'

RPROMPT='%{$fg[red]%}$(__git_ps1 "[%s]") %{$fg[green]%}%~%{$reset_color%}'

SPROMPT="Correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [nyae]? "


