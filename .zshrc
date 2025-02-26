# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="darkblood"

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

########################################################################

########################################################################
# Tilix VTE
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# enable auto-suggestions based on the history       
if [ -f /home/oxyc0don/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    # change suggestion color
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
else
#	git clone https://github.com/zsh-users/zsh-autosuggestions /home/$USER/.zsh/zsh-autosuggestions
#	echo
#	echo "# zsh-autosuggestions installed"
#	source /home/$USER/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#	source /home/$USER/.zshrc
#	echo
fi

#################################################################################################
#########   Environment       ###################################################################
#################################################################################################

# env
export EDITOR='/usr/bin/nano'

#################################################################################################
#########    Alias      #########################################################################
#################################################################################################

alias ls='ls -al --color=auto'
alias la='ls -A'
alias l='ls -CF'

#################################################################################################
#########    Colorize and add text parameters       #############################################
#################################################################################################

blk=$(tput setaf 0) # black
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
ylw=$(tput setaf 3) # yellow
blu=$(tput setaf 4) # blue
mga=$(tput setaf 5) # magenta
cya=$(tput setaf 6) # cyan
wht=$(tput setaf 7) # white
#
txtbld=$(tput bold) # Bold
bldblk=${txtbld}$(tput setaf 0) # black
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldylw=${txtbld}$(tput setaf 3) # yellow
bldblu=${txtbld}$(tput setaf 4) # blue
bldmga=${txtbld}$(tput setaf 5) # magenta
bldcya=${txtbld}$(tput setaf 6) # cyan
bldwht=${txtbld}$(tput setaf 7) # white
txtrst=$(tput sgr0) # Reset
                                                              
#########      BANNER      ########################################################################
###################################################################################################

show_date=$(date |  cut -c -15)
cpu_type=$(lscpu | grep "Model name:" | cut -c 24-)
cpu_cores=$(lscpu | grep "^CPU(s)" | cut -c 24-)
block_dev=$(echo -e "${Yellow}Block Devices: \n${Green}$(lsblk | grep "sd." | awk '{print "'${Red}'> '${Green}'"$1" '${Yellow}'Type: '${Green}'"$6" '${Yellow}'Size: '${Green}'"$4" '${Green}'"$7}' | column -t | sed 's/>/    >/')")
kversion=$(uname -srm)
shell="$SHELL"
gpu_temp=$(echo -e "$(sensors | grep "temp1:" | cut -c 16-22)")
cpu_temp=$(echo -e "$(sensors | grep "Package id 0:" | cut -c 17-23)")
ip_public=$(dig +short myip.opendns.com @resolver1.opendns.com)
ip_local=$(ip address | grep 'inet ' | grep 'scope global' | grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' -o | head -1)

#####################################################################################################
##########    BANNER    #############################################################################
echo
echo
#echo "               		      $red $show_date                         ${txtrst}"
echo "${bldwht}		  ██████  ██░ ██ ▓█████  ██▓     ██▓     ██░ ██ ▓█████  ██▓     ██▓    ${bldwht}"
echo "${bldwht}		▒██    ▒ ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    ▓██░ ██▒▓█   ▀ ▓██▒    ▓██▒    ${bldwht}"
echo "${bldwht}		░ ▓██▄   ▒██▀▀██░▒███   ▒██░    ▒██░    ▒██▀▀██░▒███   ▒██░    ▒██░    ${bldwht}"
echo "${bldwht}		  ▒   ██▒░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    ░▓█ ░██ ▒▓█  ▄ ▒██░    ▒██░    ${bldwht}"
echo "${bldwht}		▒██████▒▒░▓█▒░██▓░▒████▒░██████▒░██████▒░▓█▒░██▓░▒████▒░██████▒░██████▒${bldwht}"
echo "${bldwht}		▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░ ▒ ░░▒░▒░░ ▒░ ░░ ▒░▓  ░░ ▒░▓  ░${bldwht}"
echo "${bldwht}		░ ░▒  ░ ░ ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░ ▒ ░▒░ ░ ░ ░  ░░ ░ ▒  ░░ ░ ▒  ░${bldwht}"
echo "${bldwht}		░  ░  ░   ░  ░░ ░   ░     ░ ░     ░ ░    ░  ░░ ░   ░     ░ ░     ░ ░   ${bldwht}"
echo "${bldwht}		      ░   ░  ░  ░   ░  ░    ░  ░    ░  ░ ░  ░  ░   ░  ░    ░  ░    ░  ░${bldwht}"
echo ""
#echo ""
echo "		      			$bldwht [$kversion] $txtrst"
echo "		               		       $red $show_date                         ${txtrst}"
echo "${bldwht}				public:$txtrst$red $ip_public  ${bldwht} local:$txtrst$red $ip_local"
echo ""
echo ""         
#########################################################################################################
#########      END        ###############################################################################
#########################################################################################################
