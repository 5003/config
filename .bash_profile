hash -r
: ${BASH_PROFILE_PATH:=~/.5003_profile}
if type SDO_MODE &> /dev/null
  then
SDO_MODE || wget -qO- https://github.com/5003/config/raw/master/.bash_profile > "${BASH_PROFILE_PATH}"
    fi
SDO_MODE() {
  :
}
if [ -f ${BASH_PROFILE_PATH} ]
  then
export BASH_PROFILE_PATH
    fi
export EDITOR=vi
alias datetimesuffix='date +%Y-%m-%d_%H%M%S'
alias ll='ls -aFl'
if type python2 &> /dev/null
  then
alias p4='python2 -m SimpleHTTPServer 4000'
    fi
if type dig &> /dev/null
  then
alias dig='dig +nocmd +nocomments +nostats'
    fi
if type vagrant &> /dev/null
  then
alias vag='vagrant'
    fi
if type aws &> /dev/null
  then
alias ec2daz='aws ec2 describe-availability-zones --region $AWS_DEFAULT_REGION | jq --raw-output ".AvailabilityZones | map(.ZoneName) | .[]"'
    fi
if type docker &> /dev/null
  then
dcc() {
  docker run --interactive --tty --rm "$@"
}
alias dangling='docker images --quiet --filter dangling=true'
alias danglingrmi='docker rmi --force $(dangling)'
alias psc='docker ps --format "{{ .ID }} / {{ .Names }} // {{ .Image }} /// {{ .Ports }}"'
alias psci='docker images --format "{{ .Repository }} / {{ .Tag }} // {{ .Size }}" | LANG=C sort'
ansibledock() {
  : ${ANSIBLEDOCK_BASE_IMAGE:=5003/centos-ansible-ci:2.1.x}
  container_id=$(mktemp)
  docker run --detach --privileged --volume /vagrant/:/vagrant/ --volume /sys/fs/cgroup/:/sys/fs/cgroup/:ro "${ANSIBLEDOCK_BASE_IMAGE}" > "${container_id}" \
  && docker exec --interactive --tty "$(cat ${container_id})" env TERM=xterm bash \
  && sleep 5 && docker rm --force "$(cat ${container_id})"
}
    fi
if type docker-compose &> /dev/null
  then
alias fig='docker-compose'
    fi
if type docker-machine &> /dev/null
  then
alias dmm='docker-machine'
alias dmmd='dmm --debug'
dmmev() {
  eval "$(dmm env $1)"
}
    fi
if type direnv &> /dev/null
  then
type bash &> /dev/null && eval "$(direnv hook bash)"
alias pp='direnv allow'
alias ppp='direnv deny'
    fi
if type ansible &> /dev/null
  then
ansiblewizard() {
  for i in `seq 3`
    do . <(wget --output-document - https://github.com/5003/scripts/raw/master/ansible_test.sh) "$@"
  done
}
    fi