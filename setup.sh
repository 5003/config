hash -r
if ! type wget &> /dev/null
  then
type yum &> /dev/null && sudo yum clean all && sudo yum -y install wget
type apt-get &> /dev/null && sudo apt-get clean && sudo apt-get -y install wget
    fi
SDO_MODE() {
  return 1
}
. <(wget -qO- https://github.com/5003/config/raw/master/.bash_profile)