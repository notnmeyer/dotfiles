function fish_prompt
  function _git_branch_name
    echo (git branch --show-current)
  end

  function _is_git_dirty
    echo (git status -s --ignore-submodules=dirty > /dev/null 2>&1)
  end

  function _is_git_repo
    type -q git; or return 1
    git status -s > /dev/null 2>&1
  end

  function _repo_branch_name
    eval "_$argv[1]_branch_name"
  end

  function _is_repo_dirty
    eval "_is_$argv[1]_dirty"
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  set -l arrow "$red➜ "
  if [ $USER = 'root' ]
    set arrow "$red# "
  end

  set -l host $normal(hostname -s)
  # set -l host $normal


  # short path
  set -l cwd $cyan(basename (prompt_pwd))
  # long path
  set -l cwd $cyan(prompt_pwd)

  set repo_info
  if _is_git_repo
    set -l branch $red(_git_branch_name)
    set -l left $blue(echo "git:")
    set -l right $blue(echo "")
    set repo_info "$left$branch$right"

    if test (_is_git_dirty)
      set -l dirty "$yellow ✗"
      set repo_info "$repo_info$dirty"
    end
  end

  # if aws-vault is installed use the presence
  # of AWS_VAULT to determine if we are credentialed.
  # if we are, include the credentialed profile in the
  # prompt.
  if which aws-vault &>/dev/null
    if test -n "$AWS_VAULT"
      set -l profile $red(echo $AWS_VAULT)
      set -l left $blue(echo "aws:")
      set -l right $blue(echo "")
      set aws "$left$profile$right "
    end
  end

  if which kubectl &>/dev/null
    if kubectl config current-context &>/dev/null
      set -l context $red(kubectl config current-context)
      set -l left $blue(echo "k8s:")
      set -l right $blue(echo "")
      set k8s "$left$context$right "
    end
  end

  if pwd | egrep "\/code\/" >/dev/null
    echo "$host $cwd $k8s$aws$repo_info $normal"
    echo -e -s "" $arrow
  else
    echo "$host $cwd $repo_info $normal"
    echo -e -s "" $arrow
  end
end
