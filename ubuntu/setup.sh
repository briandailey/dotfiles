# Install the things I need on Ubuntu.
sudo apt install \
    vim \
    tmux \
    git \
    mplayer \
    curl \
    rhythmbox

mkdir -p ~/.local/share/fonts
chmod 775 ~/.local/share/fonts
cp ~/.dotfiles/ubuntu/fonts/* ~/.local/share/fonts/
chmod 644 ~/.local/share/fonts/*

mkdir -p ~/.local/share/rhythmbox/
cp ~/.dotfiles/ubuntu/rhythmbox/* ~/.local/share/rhythmbox/
