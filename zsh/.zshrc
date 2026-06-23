#GENERAL
HISTSIZE=10000

# FZF
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# ALIASES
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'
alias v=nvim
alias vz='nvim ~/.zshrc'
alias ezat='eza -l --icons=always --group-directories-first --tree --level=2 -I".DS_Store|.git|.gitignore"'
alias ezatt='eza -l --icons=always --total-size --group-directories-first --tree --level=2 -I".DS_Store|.git|.gitignore"'
alias eza='eza -1 --icons=always --group-directories-first'
alias ls='eza -1 --icons=always --group-directories-first'
alias lst='eza -l --icons=always --group-directories-first --tree --level=2 -I".DS_Store|.git|.gitignore"'
alias lstt='eza -l --icons=always --total-size --group-directories-first --tree --level=2 -I".DS_Store|.git|.gitignore"'

#ZINIT PLUGIN MANAGER
source /opt/homebrew/opt/zinit/zinit.zsh

#STARSHIP THEME
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

#ZSH PLUGINS
zstyle ':completion:*' menu select
zinit load agkozak/zsh-z

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Load completions efficiently (after prompt is ready)
autoload -Uz compinit
compinit

# fzf tab tiene que ir AFTER comletions
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zinit light Aloxaf/fzf-tab


