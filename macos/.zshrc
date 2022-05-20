## Custom
PS1='%F{green}%n@%m:%F{blue}%~%F{white}$ '
alias kc='kubectl'                                                                                                                         
alias kcgc='kubectl config get-contexts'      
alias kcuc='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kcsn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'