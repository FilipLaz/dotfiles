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
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions

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
    cloudup
    google-chrome
    caffeine
    dropbox
    firefox
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
    skype
    sourcetree
    transmission
    vlc
    visual-studio-code
    ffmpeg
    cakebrew
    istat-menus
)
brew cask install ${apps[@]}

loudEcho "NPM install global modules..."
npmModules=(
    n
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
