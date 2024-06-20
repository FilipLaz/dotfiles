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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/core
brew tap homebrew/cask-fonts

colorEcho "Brew install..."
brew install autojump
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
brew install --cask obsidian
brew install --cask bettertouchtool
brew install --cask alfred
brew install --cask anvil
brew install --cask appcleaner
brew install --cask itsycal
brew install --cask sourcetree
brew install --cask vlc
brew install --cask visual-studio-code
brew install --cask homebrew/cask-versions/firefox-nightly
brew install --cask iterm2
brew install --cask mattr-slate
brew install --cask quicklook-json
brew install --cask mark-text
brew install --cask drawio
# brew install --cask google-chrome
# brew install --cask google-backup-and-sync
# brew install --cask qlcolorcode
# brew install --cask qlmarkdown
# brew install --cask qlstephen

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
