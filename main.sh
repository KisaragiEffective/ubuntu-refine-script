function install_all() {
  sudo apt-get install temurin-8-jdk
}

function prepare_all() {
  prepare_termurin-8-jdk
}

function prepare_termurin-8-jdk() {
  sudo apt-get install -y wget apt-transport-https
  sudo wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /usr/share/keyrings/adoptium.asc
  sudo echo "deb [signed-by=/usr/share/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
}

prepare_all
install_all

echo "done"
