# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=3000
SAVEHIST=3000
setopt appendhistory autocd extendedglob nonomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/maosuzha/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# 自动记住已访问目录栈
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
# rm * 时不要提示
setopt rm_star_silent
# 允许在交互模式中使用注释
setopt interactive_comments
# disown 后自动继续进程
setopt auto_continue
setopt extended_glob
# 单引号中的 '' 表示一个 ' （如同 Vimscript 中者）
setopt rc_quotes
# 补全列表不同列可以使用不同的列宽
setopt listpacked
# 补全 identifier=path 形式的参数
setopt magic_equal_subst
# 为方便复制，右边的提示符只在最新的提示符上显示
setopt transient_rprompt
# setopt 的输出显示选项的开关状态
setopt ksh_option_print
setopt no_bg_nice
setopt noflowcontrol
stty -ixon # 上一行在 tmux 中不起作用
# 历史记录{{{2
# 不保存重复的历史记录项
setopt hist_save_no_dups
setopt hist_ignore_dups
# setopt hist_ignore_all_dups
# 在命令前添加空格，不将此命令添加到记录文件中
setopt hist_ignore_space
# 补全与 zstyle {{{1
# 自动补全 {{{2
# 用本用户的所有进程补全
zstyle ':completion:*:processes' command 'ps -afu$USER'
zstyle ':completion:*:*:*:*:processes' force-list always
# 进程名补全
zstyle ':completion:*:processes-names' command  'ps c -u ${USER} -o command | uniq'

# 警告显示为红色
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
# 描述显示为淡色
zstyle ':completion:*:descriptions' format $'\e[2m -- %d --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;33m -- %d (errors: %e) --\e[0m'

# cd 补全顺序
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
# 在 .. 后不要回到当前目录
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# complete manual by their section, from grml
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true

zstyle ':completion:*' menu select
# 分组显示
zstyle ':completion:*' group-name ''
# 歧义字符加粗（使用「true」来加下划线）；会导致原本的高亮失效
# http://www.thregr.org/~wavexx/rnd/20141010-zsh_show_ambiguity/
# zstyle ':completion:*' show-ambiguity '1;37'
# _extensions 为 *. 补全扩展名
# 在最后尝试使用文件名
if [[ $ZSH_VERSION =~ '^[0-4]\.' || $ZSH_VERSION =~ '^5\.0\.[0-5]' ]]; then
  zstyle ':completion:*' completer _complete _match _approximate _expand_alias _ignored _files
else
  zstyle ':completion:*' completer _complete _extensions _match _approximate _expand_alias _ignored _files
fi
# 修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle -e ':completion:*' special-dirs \
  '[[ $PREFIX == (../)#(|.|..) ]] && reply=(..)'
# 使用缓存。某些命令的补全很耗时的（如 aptitude）
zstyle ':completion:*' use-cache on
_cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh
zstyle ':completion:*' cache-path $_cache_dir
unset _cache_dir

# complete user-commands for git-*
# https://pbrisbin.com/posts/deleting_git_tags_with_style/
zstyle ':completion:*:*:git:*' user-commands ${${(M)${(k)commands}:#git-*}/git-/}

compdef pkill=killall
compdef pgrep=killall
compdef proxychains=command
compdef watch=command
#compdef rlwrap=command
#compdef ptyless=command
#compdef grc=command

PS1=$'%{\033[38;5;37m%}%n%{\033[38;5;214m%}@%{\033[38;5;2m%}%M%{\033[38;5;214m%}:%{\033[38;5;9m%}%1~%{\033[38;5;214m%}$%{\033[0m%} '
# 次提示符：使用暗色
PS2=$'%{\033[2m%}%_>%{\033[0m%} '

# set bindkey
bindkey -e
if [[ -n "$TMUX" ]]; then
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[4~" end-of-line
else
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
fi
bindkey "^[J" backward-word
bindkey "^[K" backward-word

export KEYTIMEOUT=1

alias l='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -ahlF --color=always'
# alias vim=nvim
alias vi='vim'

# set proxy
# export all_proxy=child-prc.intel.com:913
# export http_proxy=child-prc.intel.com:913
# export https_proxy=child-prc.intel.com:913
# export ftp_proxy=child-prc.intel.com:913

# set default editor
# export EDITOR=nvim
