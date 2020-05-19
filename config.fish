# abbreviations 
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a gs 'git status'

# git prompt
set __fish_git_prompt_showuntrackles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

if status --is-interactive
	set BASE16_SHELL "$HOME/.config/base16-shell/"
       source "$BASE16_SHELL/profile_helper.fish"	
end

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
	 	set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

