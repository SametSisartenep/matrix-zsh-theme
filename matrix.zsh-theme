#
# -=[ Matrix ZSH Theme ]=-
#
#----------------------------------------------------------------------·
# Morpheus: Neo, sooner or later you're going to realize just as I did |
# that there's a difference between knowing the path and walking the   |
# path.                                                                |
#----------------------------------------------------------------------·
#
# Comment: Handy if you work on different servers all the time;

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	GIT_STATUS=$(git_prompt_status)
	[[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function precmd () {
  print -Pn "\e]0;$USER ‒ %~ ‒ $0\a"
}

function preexec () {
  progname=$(echo $1 | awk '{print $1}')
  print -Pn "\e]0;$USER ‒ %~ ‒ $progname\a"
}

# Colored prompt
ZSH_THEME_COLOR_USER="040" 
ZSH_THEME_COLOR_HOST="028" 
ZSH_THEME_COLOR_PWD="049" 
test -n "$SSH_CONNECTION" && ZSH_THEME_COLOR_USER="red" && ZSH_THEME_COLOR_HOST="red"
test `id -u` = 0 && ZSH_THEME_COLOR_USER="magenta" && ZSH_THEME_COLOR_HOST="magenta"
PROMPT='%{$FG[$ZSH_THEME_COLOR_USER]%}%n%{$FG[036]%}@%{$FG[$ZSH_THEME_COLOR_HOST]%}%M%{$reset_color%}:%{$FG[$ZSH_THEME_COLOR_PWD]%}%~%{$reset_color%} $(my_git_prompt_info)%(!.#.$) '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

