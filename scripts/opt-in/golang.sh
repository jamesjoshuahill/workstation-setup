echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go
brew install dep
brew cask install goland

echo 'export PATH="$PATH:$HOME/go/bin"' >> ~/.bash_profile

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=goland
popd

### Tools for ISM

install_kubebuilder() {
  local version=1.0.8 # latest stable version
  local arch=amd64

  # create temp dir
  local dir
  dir=$(mktemp -d)
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
  echo 'export PATH="$PATH:/usr/local/kubebuilder/bin"' >> ~/.bash_profile
}

install_kustomize() {
  local version=1.0.11  # latest v1.x version

  # create temp dir
  local dir
  dir=$(mktemp -d)
  pushd $dir

  # download binary
  wget "https://github.com/kubernetes-sigs/kustomize/releases/download/v${version}/kustomize_${version}_darwin_amd64"
  install "kustomize_${version}_darwin_amd64" /usr/local/bin/kustomize

  # clean up temp dir
  popd
  rm -rf $dir
}

brew cask install virtualbox
brew cask install minikube

go get -u github.com/onsi/ginkgo/ginkgo
go get -u github.com/maxbrunsfeld/counterfeiter

install_kubebuilder
install_kustomize
