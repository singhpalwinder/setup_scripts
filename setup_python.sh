#!/bin/bash

# Update package lists and install GCC
echo "Installing GCC..."
sudo apt-get update
sudo apt-get install -y gcc

# Ensure curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl could not be found, installing curl..."
    sudo apt-get install -y curl
fi

# Install dependencies required to build Python
echo "Installing required build dependencies..."
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Install pyenv
echo "Installing pyenv..."
curl https://pyenv.run | bash

# Set up environment variables for pyenv in the current shell session
echo -e 'export PYENV_ROOT="$HOME/.pyenv"\nexport PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'eval "$(pyenv init --path)"\neval "$(pyenv init -)"' >> ~/.bashrc

#reload shell
echo "reloading shell..."
source ~/.bashrc

# Install Python 3.11.9 using pyenv
echo "Installing Python 3.11.9..."
pyenv install 3.11.9

# Set Python 3.11.9 as the global version
echo "Setting Python 3.11.9 as the global Python version..."
pyenv global 3.11.9

# Verify the installation
python_version=$(python --version)
if [[ "$python_version" == "Python 3.11.9" ]]; then
    echo "Python 3.11.9 installed and set as global version successfully!"
else
    echo "There was an issue setting Python 3.11.9 as the global version."
fi