# manage aws-vault and kube context together
function ak
  # if we're already in a aws-vault'd shell, we need to unset the aws-vault env vars.
  # aws-vault doesnt have a mechanism to scrub the env for us, the expectation is that
  # you'd just start a new unpopulated shell. that's the right way to do it, but this
  # is also a way.
  set -l vars (env | grep AWS | grep -v DEFAULT | awk -F'=' '{print $1}')
  for var in $vars
    set --erase $var
  end

  kubectl config use-context $argv
  aws-vault exec $argv
  kubectl config unset current-context
end
