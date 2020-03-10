#!/bin/bash

ENV test false

# Updates
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en.UTF-8
sudo apt-get -y update
sudo apt-get -y upgrade

mkdir -p ~/tools

sudo apt update
sudo apt -y install python-dev python-pip
sudo apt -y install python3-dev python3-pip
sudo apt clean

sudo apt update
sudo apt install --no-install-recommends -y build-essential curl gdb
sudo gdb-multiarch gdbserver git
sudo libncursesw5-dev python3-setuptools python-setuptools
sudo python2.7 python3-pip tmux tree stow virtualenvwrapper
sudo wget vim unzip
sudo libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev
sudo squashfs-tools zlib1g-dev liblzma-dev python-magic cmake
sudo z3 python-lzma net-tools strace ltrace
sudo gcc-multilib g++-multilib ruby-full binutils-mips-linux-gnu

# Upgrade pip and ipython
sudo python -m pip install --upgrade pip
sudo python3 -m pip install --upgrade pip
sudo pip2 install -Iv ipython==5.3.0
sudo pip3 install ipython

# Install radare
cd ~/tools
git clone --depth 1 https://github.com/radare/radare2
cd radare2
sudo ./sys/install.sh
sudo make install
sudo pip2 install r2pipe
sudo pip3 install r2pipe

# Install pwntools and pwndbg
sudo pip2 install git+https://github.com/Gallopsled/pwntools
cd ~/tools
git clone --depth 1 https://github.com/pwndbg/pwndbg
cd pwndbg
sudo ./setup.sh

# Install 32bit dependencies
dpkg --add-architecture i386
sudo apt update
sudo apt --no-install-recommends -y install libc6:i386 libncurses5:i386 libstdc++6:i386 libc6-dev-i386 && \
sudo apt clean

# Install ripgrep from Releases
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.9.0/ripgrep_0.9.0_amd64.deb
sudo dpkg -i ripgrep_0.9.0_amd64.deb
sudo rm ripgrep_0.9.0_amd64.deb

# Install ROPgadget
cd ~/tools
git clone --depth 1 https://github.com/JonathanSalwan/ROPgadget.git
cd ROPgadget
sudo python setup.py install

sudo apt-get update
sudo apt-get install --no-install-recommends -y software-properties-common

sudo apt --no-install-recommends -y install qemu qemu-user qemu-user-static
sudo apt -m update
sudo apt install -y libc6-arm64-cross libcc6-dev-i386 libc6-i386 libffi-dev libssl-dev libncurses5-dev 
sudo apt --no-install-recommends -y install 'binfmt*'
sudo apt --no-install-recommends -y install libc6-armhf-armel-cross
sudo apt --no-install-recommends -y install debian-keyring
sudo apt --no-install-recommends -y install debian-archive-keyring
sudo apt --no-install-recommends -y install emdebian-archive-keyring
sudo apt -m update; echo 0
sudo apt --no-install-recommends -y install libc6-mipsel-cross
sudo apt --no-install-recommends -y install libc6-armel-cross libc6-dev-armel-cross
sudo apt --no-install-recommends -y install libc6-dev-armhf-cross
sudo apt --no-install-recommends -y install binutils-arm-linux-gnueabi
sudo apt --no-install-recommends -y install libncurses5-dev
sudo mkdir /etc/qemu-binfmt
sudo ln -s /usr/mipsel-linux-gnu /etc/qemu-binfmt/mipsel
sudo ln -s /usr/arm-linux-gnueabihf /etc/qemu-binfmt/arm
sudo apt clean

#Install Rust
wget https://sh.rustup.rs
chmod +x index.html
sudo ./index.html --default-toolchain nightly -y
sudo rm index.html

# Install one_gadget
sudo gem install one_gadget

# Install arm_now
sudo apt update
sudo apt install e2tools
sudo pip3 install https://github.com/nongiach/arm_now/archive/master.zip --upgrade
sudo apt clean

# Install capstone, keystone, unicorn
cd ~/tools
wget https://raw.githubusercontent.com/hugsy/stuff/master/update-trinity.sh
sed 's/sudo//g' update-trinity.sh > no_sudo_trinity.sh
sudo chmod +x no_sudo_trinity.sh
sudo bash ./no_sudo_trinity.sh
sudo ldconfig

#Install Binwalk
cd ~/tools
git clone --depth 1 https://github.com/ReFirmLabs/binwalk
cd binwalk
sudo python setup.py install

# Install Rust binaries
sudo .cargo/bin/cargo install ripgrep exa bat

# Install gef but keep pwndbg downloaded
wget -O ~/.gdbinit-gef.py -q https://github.com/hugsy/gef/raw/master/gef.py && echo source ~/.gdbinit-gef.py > ~/.gdbinit
wget -O ~/.gdbinit-gef-extras.sh -q https://github.com/hugsy/gef/raw/master/scripts/gef-extras.sh
chmod +x ~/.gdbinit-gef-extras.sh && ~/.gdbinit-gef-extras.sh

#Install GO
wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go*tar.gz


# These are used for some vim plugins
sudo apt-get install ack-grep
sudo apt-get install silversearcher-ag

#Running some tests to see if everything installed correctly
sh -c 'if [ "$test" = true ]; then echo "Running tests"; chmod +x ./test.sh; ./test.sh; else /bin/bash; fi'
