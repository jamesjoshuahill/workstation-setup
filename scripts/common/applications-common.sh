# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew cask install flycut
brew cask install shiftit
brew cask install quicklook-json
brew install lastpass-cli

# Terminals

brew cask install iterm2

# Browsers

brew cask install google-chrome

# Communication

brew cask install slack

# Text Editors

brew cask install jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew cask install atom
set -e

# Scripts

mkdir -p ~/bin/
echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bash_profile

cp files/bin/load-key ~/bin/
