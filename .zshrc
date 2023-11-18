#!/bin/zsh

# Zsh options
setopt extended_glob

# ZDOTDIR="/usr/share/zsh-antidote"
# ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
# fpath=($ZFUNCDIR $fpath)
# autoload -Uz $fpath[1]/*(.:t)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# usr/share/oh-my-zsh - Arch aur install location
export ZSH="$HOME/.oh-my-zsh"
# export ZSH="/usr/share/oh-my-zsh"

# Antidote Path
# export ANTIDOTE="/usr/share/zsh-antidote"
export SHELL="$(which zsh)"

# Pager to use
export PAGER="bat"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

fpath=(~/.zfunc $fpath)

function zvm_config() {
   ZVM_INIT_MODE=sourcing
   ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
   ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
   ZVM_VI_EDITOR=nvim
}

# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
   [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
   # ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}} = ZSH_CUSTOM OR ZSH OR ~/.oh-my-zsh
   [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src ] && \
      fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/zsh-completions.plugin.zsh
   [ -f ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
      fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
}

# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# The current instructions: README.md#oh-my-zsh, suggest to add zsh-completions to plugins and rerun compinit.
#
# But that's sub-optimal. This will cause Zsh to rebuild the completion cache twice on each Zsh invocation: 
# The first when you source oh-my-zsh, and the second time when you rerun compinit. 
# This defeats the whole point of the completions cache, and will negatively impact the startup time of Zsh.
#
# Sadly, oh-my-zsh doesn't seem to have a way for a plugin to add more fpath entries, besides the root folder of the plugin, 
# before it invokes compinit. I think it's best to just suggest adding the zsh-completions src dir to fpath before 
# the source $ZSH/oh-my-zsh.sh line, in order to avoid this issue. 
# Something like this: fpath=($ZSH/custom/plugins/zsh-completions/src $fpath)
#
# Must be sourced before oh-my-zsh.sh
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(alias-finder fzf-zsh-plugin git terraform zsh-vi-mode)
plugins=(alias-finder git gh terraform zsh-vi-mode)
# Temp Disable
# zsh-vi-mode

# Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Antidote
# source ${ANTIDOTE}/antidote.zsh
# antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# User configuration

# GPG signing needed this added to work
export GPG_TTY=$(tty)

# FZF Options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#Oh My Posh Prompt Theme
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/custom-posh-theme.omp.json)"

# Starship Prompt
eval "$(starship init zsh)"

# eval $(thefuck --alias)


export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# If above works delete this line
# usr/share/nvm/init-nvm.sh

# Command Completion
# autoload bashcompinit && bashcompinit
# autoload -Uz compinit && compinit
# complete -C '/usr/bin/aws_completer'

# source /usr/bin/aws_zsh_completer.sh

neofetch
