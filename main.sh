#!/bin/bash
function install_all() {
  sudo apt-get install temurin-8-jdk
  sudo apt-get install --upgrade git
}

function prepare_all() {
  prepare_termurin-8-jdk
  prepare_git-ppa
  prepare_rustup
  prepare_via-cargo
}

function prepare_via-cargo() {
  cargo install jaq bat cargo-edit
}

function prepare_termurin-8-jdk() {
  sudo apt-get install -y wget apt-transport-https
  sudo wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /usr/share/keyrings/adoptium.asc
  sudo echo "deb [signed-by=/usr/share/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
}

function prepare_git-ppa() {
  sudo add-apt-repository -y https://launchpad.net/~git-core/+archive/ubuntu/ppa
}

function prepare_rustup() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

prepare_all
install_all

echo "done"
