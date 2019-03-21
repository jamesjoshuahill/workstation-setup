echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
# configures ShiftIt to select 1/3 screen width, 1/2 screen width and 2/3 screen width
defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES

open /Applications/ShiftIt.app

echo "Configuring FlyCut"
open /Applications/Flycut.app

echo
echo "Installing vim configuration"
pushd ~/
if [ ! -d ~/.vim ]; then
    git clone https://github.com/pivotal/vim-config.git ~/.vim
    ~/.vim/bin/install
fi
popd
