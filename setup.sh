# Stop if something fails
set -e

# Scatter the dotfiles home
cd ~/.dotfiles

for df in \
	.bash_profile \
	.gitconfig
do
		tput setaf 5; echo "Linking ${df}"; tput sgr0
		if [[ -e ~/${df} ]]
		then
			tput setaf 5; echo "Backing up existing ~/${df}"; tput sgr0
			mv ~/${df} ~/${df}.bak
		fi
		ln -s ~/.dotfiles/${df} ~/${df}
done

#
# Core installations
#

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install applications
brew cask install atom
brew cask install google-chrome
brew cask install intellij-idea
brew cask install iterm2
brew cask install java
brew cask install slack
brew cask install spectacle
brew cask install spotify

# Install utilities
brew install awscli
brew install bash-completion
brew install git
brew install htop
brew install jq
brew install node
brew install python
brew install sbt
brew install scala
brew install tree
brew install nvm
brew install chromedriver
brew install coreutils
brew install exiftool
brew install nginx
brew install ripgrep
brew install typesafe-activator
brew install wget
brew install yarn
brew install mkdocs

# Install editor plugins
apm install \
ensime \
atom-beautify \
file-icons \
intentions \
language-scala \
latex \
linter \
merge-conflicts \
minimap \
minimap-cursorline

pip install --upgrade pip
pip install virtualenv
pip install virtualenvwrapper

# install gems
gem install --pre asciidoctor-pdf
gem install coderay pygments.rb
gem install prism-marauder

#################
#OS X Preferences
#################
echo "Set setting: System Preferences > Security & Privacy > General > Allow apps to be downloaded from: Anywhere"
read

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Don't create .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Set the function keys to be always on
defaults write NSGlobalDomain com.apple.keyboard.fnState -int 1;

#Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#Show the ~/Library folder
chflags nohidden ~/Library

# See ALL the files (and dirs)
defaults write com.apple.finder AppleShowAllFiles YES

# Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE HH:mm"
defaults write com.apple.menuextra.clock FlashDateSeparators -int 0
defaults write com.apple.menuextra.clock IsAnalog -int 0

# remove these useless folders
sudo find / -name ".DS_Store" -depth -exec rm {} \;

killall SystemUIServer
echo "Done. Note that some of these changes require a logout/restart to take effect."

#
# Manual
#

echo "Set user avatar"
read
echo "Set keyboard shortcuts (screenshots, spotlight etc)"
read
