function loudEcho () {
    echo "------------------------------------"
    echo $1
    echo "------------------------------------"
}

loudEcho "Cloning dotfiles..."
git clone https://github.com/FilipLaz/dotfiles.git ~/dotfiles

loudEcho "Setup some OSX settings..."
sudo chmod +x ~/dotfiles/osx.sh
~/dotfiles/osx.sh

loudEcho "Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

loudEcho "Brew tap..."
brew tap homebrew/core

loudEcho "Brew install..."
brews=(
    git
    ack
    wget
    node
    youtube-dl
    caskroom/cask/brew-cask
    ssh-copy-id
    tmux
    httpie
    archey
)
brew install ${brews[@]}

loudEcho "Brew cask..."
apps=(
    anvil
    alfred
    appcleaner
    gitup
    iterm2
    itsycal
    imageoptim
    lastpass
    mattr-slate
    handbrake
    qlcolorcode
    qlmarkdown
    qlstephen
    quicklook-json
    sourcetree
    vlc
    visual-studio-code
    cakebrew
    istat-menus
)
brew cask install ${apps[@]}

loudEcho "NPM install global modules..."
npmModules=(
    n
    eslint
    vtop
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
