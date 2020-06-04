# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zplug/init.zsh

zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "lib/completion", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
zplug "zsh-users/zsh-autosuggestions", from:github, defer:3
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "agkozak/zsh-z"

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /etc/grc.zsh

PATH=$HOME/.local/bin/:$PATH:/usr/sbin/
SAVEHIST=10
HISTFILE=~/.zsh_history

alias ls="grc ls --color"
alias nmap="grc nmap"
alias apt-search="apt-cache search"
alias apt-install="sudo apt install"
alias search="firefox search"
alias http-server-here="python3 -m http.server"

#
# https://blog.ropnop.com/docker-for-pentesters/
#

function ip-info() {
  curl -s ipinfo.io/$@ | jq
}

impacket-docker() {
    docker run --rm -it rflathers/impacket "$@"
}

smb-server-here() {
    local sharename
    [[ -z $1 ]] && sharename="SHARE" || sharename=$1
    [[ -z $2 ]] && port=445 || port=$2
    docker run --rm -it -p $port:445 -v "${PWD}:/tmp/serve" rflathers/impacket smbserver.py -smb2support $sharename /tmp/serve
}

webdav-here() {
    [[ -z $2 ]] && port=80 || port=$1
    docker run --rm -it -p $port:80 -v "${PWD}:/srv/data/share" rflathers/webdav
}

post-file-dump-here() {
    [[ -z $2 ]] && port=80 || port=$1
    docker run --rm -it -p $port:3000 -v "${PWD}:/data" rflathers/postfiledump
}

http-request-dump() {
    [[ -z $2 ]] && port=80 || port=$1
    docker run --rm -it -p $port:3000 rflathers/reqdump
}
