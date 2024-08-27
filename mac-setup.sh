#!/bin/zsh

# Function to check if Homebrew is installed
check_homebrew() {
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew not found, installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "Homebrew is already installed."
    fi
}

# Install Homebrew if not already installed
check_homebrew

# Install applications
brew install --cask visual-studio-code
brew install --cask firefox
brew install --cask rectangle-pro
brew install --cask alfred
brew install --cask handbrake
brew install --cask logi-options-plus

# Install Python 3.11
brew install python@3.11

# Upgrade pip for the installed Python version
python3.11 -m ensurepip
python3.11 -m pip install --upgrade pip

# Inform the user of successful setup
echo "Setup completed! Applications installed and Python 3.11 with pip is ready to use."
