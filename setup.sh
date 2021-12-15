# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

function colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

colorEcho "Cloning dotfiles..."
git clone https://github.com/FilipLaz/dotfiles.git ~/dotfiles
# chmod +x ~/dotfiles/bin/*

colorEcho "Installing home brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/core
brew tap homebrew/cask-fonts

colorEcho "Brew install..."
brew install git
brew install node
brew install ssh-copy-id
brew install hub
brew install wget
brew install go
brew install imgur-screenshot
brew install tmux
brew install python3
brew install diff-so-fancy
brew install yt-dlp/taps/yt-dlp

colorEcho "Installing apps using brew cask..."
brew cask install bettertouchtool
brew cask install alfred
brew cask install anvil
brew cask install appcleaner
brew cask install itsycal
brew cask install sourcetree
brew cask install vlc
brew cask install visual-studio-code
brew cask install homebrew/cask-versions/firefox-nightly
# brew cask install google-chrome
# brew cask install google-backup-and-sync
brew cask install iterm2
brew cask install mattr-slate
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json

colorEcho "Installing node global modules..."
npm i -g vtop
npm i -g n
npm i -g eslint
sudo mkdir /usr/local/n
sudo chown -R $(whoami) /usr/local/n

colorEcho "Install and setup zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

colorEcho "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

colorEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

sudo chmod +x ~/dotfiles/osx.sh
~/dotfiles/osx.sh
