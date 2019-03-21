echo
echo "Installing Golang Development tools"

mkdir -p ~/go/src
brew install go
brew install dep
brew cask install goland

echo
echo "Adding ~/go/bin to your PATH..."
echo 'export PATH="$PATH:$HOME/go/bin"' >> ~/.bash_profile

source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
pushd ~/workspace/pivotal_ide_prefs/cli
./bin/ide_prefs install --ide=goland
popd

go get -u github.com/onsi/ginkgo/ginkgo
go get -u github.com/maxbrunsfeld/counterfeiter
