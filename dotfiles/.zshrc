HOST_NAME=" asclat"

# Enable correcting small spelling errors in the cd command
setopt correct

# Enable navigating through history with up and down arrows based on partial input
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Define colors for terminal using ANSI escape sequences
txtred='\033[0;31m'   # Red
txtgrn='\033[0;32m'   # Green
bldgrn='\033[1;32m'   # Bold Green
bldpur='\033[1;35m'   # Bold Purple
txtrst='\033[0m'      # Text Reset

# Define emojis to be displayed before the prompt
emojis=("🎩" "🚧" "💻" "💾" "🆘" "🐞")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

# Enable vcs_info (similar to vcprompt)
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '[git:%b]'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }

# What's printed before the prompt
print_before_the_prompt () {
    dir=$PWD
    dir=${dir/"$HOME"/"~"}
    printf "\n${txtred}%s: ${bldpur}%s ${txtgrn}%s${txtrst}\n" "$HOST_NAME" "$dir" "$vcs_info_msg_0_"
}

# Hook to call print_before_the_prompt before each prompt
precmd_functions+=(print_before_the_prompt)

# Set the prompt
PROMPT="$EMOJI> "


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
[[ -f /Users/samuelavila/.dart-cli-completion/zsh-config.zsh ]] && . /Users/samuelavila/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

