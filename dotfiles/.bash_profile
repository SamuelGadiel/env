HOST_NAME=asclat

# Enable auto navigation when cd is ommited
shopt -s autocd
# cd command will work even with small writing errors
shopt -s cdspell

# Enable navigating through history with up and down arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Define colors for terminal
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

# Define emojis to be displayed before the prompt
emojis=("🎩" "🚧" "💻" "💾" "🆘" "🐞")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

# What's printed before the prompt
print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}


PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI> "


# Load aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Load path and variables exporters
if [ -f ~/.exporters ]; then
    . ~/.exporters
fi
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[ -f /Users/samuelavila/.dart-cli-completion/bash-config.bash ] && . /Users/samuelavila/.dart-cli-completion/bash-config.bash || true
## [/Completion]

