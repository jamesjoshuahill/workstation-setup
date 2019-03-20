echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go
brew install dep
brew cask install goland

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=goland
popd

go get -u github.com/onsi/ginkgo/ginkgo
go get -u github.com/maxbrunsfeld/counterfeiter

install_kubebuilder() {
  local version=1.0.8 # latest stable version
  local arch=amd64

  # create temp dir
  local dir="$(mktemp -d)"
  pushd $dir

  # download the release
  curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${version}/kubebuilder_${version}_darwin_${arch}.tar.gz"

  # extract the archive
  tar -zxvf kubebuilder_${version}_darwin_${arch}.tar.gz
  mv kubebuilder_${version}_darwin_${arch} kubebuilder
  sudo rm -rf /usr/local/kubebuilder/
  sudo mv kubebuilder /usr/local/

  # clean up temp dir
  popd
  rm -rf $dir

  # update your PATH to include /usr/local/kubebuilder/bin
  if ! cat ~/.bash_profile | grep 'export PATH="$PATH:/usr/local/kubebuilder/bin"'; then
    echo 'export PATH="$PATH:/usr/local/kubebuilder/bin"' >> ~/.bash_profile
  fi
}

install_kubebuilder

brew install kustomize
