# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew cask install flycut
brew cask install shiftit
brew cask install dash
brew cask install postman
brew cask install quicklook-json
brew install lastpass-cli

# Terminals

brew cask install iterm2

# Browsers

brew cask install google-chrome
brew cask install firefox

# Communication

brew cask install slack

# Text Editors

brew cask install macdown
brew cask install sublime-text
brew cask install textmate
brew cask install macvim
brew cask install jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew cask install visual-studio-code
brew cask install atom
set -e

# Scripts

mkdir -p ~/bin/
echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bash_profile

cp files/bin/load-key ~/bin/
