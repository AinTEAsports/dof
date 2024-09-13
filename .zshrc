# -[ SETUP ]- #
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# -[ PLUGINS ]- #
zinit ice depth=1

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

zinit snippet OMZP::git
# zinit snippet OMZP::zsh-autosuggestions
# zinit snippet OMZP::zsh-syntax-highlighting
zinit snippet OMZP::sudo
zinit snippet OMZP::web-search
zinit snippet OMZP::copybuffer 
zinit snippet OMZP::history
zinit snippet OMZP::jsontools


autoload -U compinit && compinit
autoload -U select-word-style bash

zinit cdreplay -q


HISTSIZE=5000
SAVEHIST="$HISTSIZE"
HISTDUP=erase
HISTFILE="$HOME/.zsh_history"
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
autoload -U select-word-style
select-word-style bash

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes=long select
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# -[ BINDINGS ]- #
bindkey -e

# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey -s ^f "_nvimfzf\n"
# bindkey -s ^e "_cvlcfzf\n"



# -[ EXPORTS ]- #
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

FZF_POINTER=">"
FZF_PROMPT="# "
FZF_OPTS="$FZF_DEFAULT_OPTS --exact --cycle --border rounded --pointer \"$FZF_POINTER\" --prompt \"$FZF_PROMPT\""
# FZF_COLOR_OPTS="--color=dark --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"
# FZF_COLOR_OPTS="--color=fg:#cbccc6,bg:#1f2430,hl:#707a8c --color=fg+:#707a8c,bg+:#191e2a,hl+:#ffcc66 --color=info:#73d0ff,prompt:#707a8c,pointer:#cbccc6 --color=marker:#73d0ff,spinner:#73d0ff,header:#d4bfff"
FZF_COLOR_OPTS=" --color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export FZF_DEFAULT_COMMAND='fd . --hidden -L --exclude ".git" -t f'
export FZF_DEFAULT_OPTS="$FZF_OPTS $FZF_COLOR_OPTS"
export BAT_THEME="Catppuccin-macchiato"


# -[ ALIASES ]- #
alias src="source $HOME/.zshrc"

alias lat="bat --plain"
alias vim="nvim"
alias vz="vim $HOME/.zshrc"
alias vv="vim $HOME/.config/nvim"
alias vc="vim $HOME/.config"
alias vh="vim $HOME/.config/hypr/hyprland.conf"
alias vt="vim $HOME/.config/tmux/tmux.conf"
alias vk="vim $HOME/.config/kitty/kitty.conf"
alias va="vim $HOME/.config/alacritty/alacritty.toml"

alias wa2da='~/.custom-commands/make-webapp.sh'
alias nimblewatch="$HOME/.custom-commands/nimblewatch.sh"

alias cdgh='cd ~/github-projects'
alias cdgp='cd ~/.git-progs'
alias cdcc='cd ~/.custom-commands'

# Existing command aliases
alias exercism="$HOME/.apps/exercism/exercism"
alias todo="nvim $HOME/TODO.norg"
alias hyprshot="hyprshot -o $HOME/Pictures/Screenshots/"
alias paclear="paclear --speed 3 --color yellow"
alias ttmux="tmux -f ~/.config/tty_tmux/tmux.conf -2"
alias rm="trash"
alias bottom="btm"
alias python3="python"

alias ls="exa --classify"
alias l='ls'
alias la='ls -A'
alias l1='ls -1'
alias la1='la -1'
alias ll='exa -l --icons'
alias lla='ll -a'
alias lsd='lsd'
alias lsa='lsd -lAh'
alias cssbeautify='~/node_modules/.bin/cssbeautify-cli'
alias ccat="highlight --out-format=ansi"


# Existing command aliases
alias clearn='clear && echo && _fastfetch'
alias clearm='clear && maxfetch'
alias clearz='clear && zfxtop'
alias clearp="clear && pfetch"
alias gitaddall='git add -A && git commit -m "Some changes" && git push'
alias ccat='pygmentize -g'

[[ "$XDG_SESSION_TYPE" == "wayland" ]] && alias cbc="wl-copy" || alias cbc="xclip -selection c"

alias vif='vim `fzf -e`'
alias ltree='lsd --tree'
alias cwd='echo -n $( pwd ) | cbc'

alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim-test='NVIM_APPNAME="nvim-test" nvim'
alias v='/bin/vi'
alias vie='nvim -u NONE +"set nu rnu syntax"'
alias vz="vim ~/.zshrc"
alias v3="vim ~/.config/i3/config"
alias mim="vim +\"set nonu nornu signcolumn=no\""


# -[ SCRIPTS ]- #
function _nvimfzf {
	DIRECTORY_PRINT=$(echo -e "[DIRECTORY]\n")
	EXA_OPTIONS="--icons -la --color=always"
	BAT_OPTIONS="--number -f"

	NVIM_FZF_PREVIEW="if [[ -d {} ]]; then echo -e \"[DIRECTORY]\n\"; exa $EXA_OPTIONS {}; else bat $BAT_OPTIONS {}; fi"

	dest_file=$(fzf-tmux -p 90%,80% --scheme=path --preview "$NVIM_FZF_PREVIEW")

	if [[ ! -z "$dest_file" ]]; then
		nvim "$dest_file"
	fi
}


function _cvlcfzf {
	MUSIC_DIR="$HOME/Music/Listen"
	dest_file=$(fd . "$MUSIC_DIR" | fzf-tmux -p 90%,70% --scheme=path --preview 'mediainfo {}')

	if [[ ! -z "$dest_file" ]]; then
		cvlc --loop "$dest_file"
	fi
}

function _fastfetch {
	n=19
	k=2
	rdmnu="$((k + $RANDOM % (n - k + 1)))"
	configname="$HOME/.config/fastfetch/${rdmnu}.jsonc"

	echo -e "[CONFIG N=$rdmnu]\n"

	fastfetch --config "$configname"
}


function cdtp {
	cd "$HOME/epita/spe/tp/prog/" || exit 1
	cd $(ls | tail -n 1)
}


function watcher {
	find . -type f | entr -s "clear && $@"
}


# -[ USER SETUP ]- #
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
# source <(fzf --zsh)

eval "$(opam env)"
source "$HOME/.profile"
source "$HOME/.zshenv"

TTY_FONT="ter-v32n"
[[ $(tty) =~ "tty" ]] && setfont "$TTY_FONT"
