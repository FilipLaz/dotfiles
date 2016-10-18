function loudEcho () {
    echo "------------------------------------"
    echo $1
    echo "------------------------------------"
}

loudEcho "Cloning dotfiles..."
git clone git@github.com:FilipLaz/dotfiles.git ~/dotfiles

loudEcho "Setup some OSX settings..."
sudo chmod +x ~/dotfiles/osx.sh
~/dotfiles/osx.sh

loudEcho "Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

loudEcho "Brew tap..."
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

loudEcho "Brew install..."
brews=(
    git
    php56
    ack
    wget
    node
    youtube-dl
    caskroom/cask/brew-cask
    ssh-copy-id
)
brew install ${brews[@]}
brew linkapps

loudEcho "Brew install vim..."
brew install vim --with-lua
sudo mv /usr/bin/vim /usr/bin/vim73

loudEcho "Brew cask..."
apps=(
    anvil
    alfred
    appcleaner
    cloudup
    charles
    caffeine
    dropbox
    evernote
    firefox
    flux
    gitup
    iterm2
    itsycal
    imageoptim
    lastpass
    mattr-slate
    macdown
    handbrake
    qlcolorcode
    qlmarkdown
    qlstephen
    quicklook-json
    skype
    sublime-text
    sourcetree
    transmission
    tunnelblick
    vlc
    visual-studio-code
    karabiner
    seil
)
brew cask install ${apps[@]}

loudEcho "NPM install global modules..."
npmModules=(
    gulp
    eslint
    n
    bower
    nodemon
)
npm i -g ${npmModules[@]}


loudEcho "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

loudEcho "Installing zsh-autosuggestions..."
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet

loudEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done
