echo
echo "Installing ISM Development tools"

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

  echo
  echo "Adding /usr/local/kubebuilder/bin to your PATH..."
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

install_kubebuilder
install_kustomize
