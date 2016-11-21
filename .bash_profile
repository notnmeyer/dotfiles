if [[ -z "$TMUX" ]]; then
  tmux attach || tmux
fi

# check for CVEs
dig +short -t txt istheinternetonfire.com

source $HOME/.bashrc
source $HOME/.secrets

export TEST_DATA_BAG_PATH=/th/chef-test-data-bags/data_bags
export TEST_DATA_BAG_SECRET=/th/chef-test-data-bags/encrypted_data_bag_secret
export INFRASTRUCTURE_REPO=/th/infrastructure
export SETUP_COOKBOOK_PATH=/th/base-cookbook/test/fixtures/cookbooks/setup

export EDITOR=vim
export HISTFILESIZE=99999999

export PYENV_ROOT="$HOME/.pyenv"
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$PYENV_ROOT/bin:$RBENV_ROOT/bin:$HOME/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ruby aliases
alias be="bundle exec"

# git aliases
alias g="git"
alias gap="git add -p"
alias gpr="git pull --rebase"
alias gc="git commit"
alias ga="git add"
alias gd="git diff"
alias gco="git co"
alias gcl="git clone"
alias gm="git merge"
alias gp="git push"
alias gpo="git push origin"
alias gs="git status"

function glc {
  git log --pretty=format:"* %an: %s" -$1
}

# test kitchen aliases
alias kis="kitchen setup"
alias kic="kitchen converge"
alias kil="kitchen list"
alias kid="kitchen destroy"
alias kiv="kitchen verify"
alias kilo="kitchen login"

# berks
alias b="berks"
alias bupload="berks upload"
alias bupdate="berks update"
alias bapply="berks apply"

# knife aliases/functions
alias ks="knife status"
alias knl="knife node list"
alias ksearch="knife search"
alias kssh="knife ssh"
alias kns="knife node show"
alias kdbs="knife data bag show"

function kk { 
  sed -i "${1}d" $HOME/.ssh/known_hosts
}

function servers_from_stack {
  for server in $(openstack stack resource list $1 -n 2 | egrep "::Server\s" | awk '{print $4}'); do
    addresses=$(openstack server show $server | egrep '\| addresses\s' | awk '{print $4}')
    name=$(openstack server show $server | egrep '\| name\s' | awk '{print $4}')
    echo "${name}: ${addresses}"
  done
}
