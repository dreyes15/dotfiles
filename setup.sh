sudo dpkg --add-architecture i386

sudo apt update && dpkg -l | grep ^ii | cut -d' ' -f3 | grep -v '^libgcc-s1:amd64$' | xargs apt-get install -y --reinstall

sudo apt  install -y sudo \
                       build-essential \
                       git \
                       tree \
                       gcc-multilib \
                       g++-multilib \
                       clang \
                       llvm \
                       gdb \
                       gdbserver \
                       gdb-multiarch \
                       qemu-system \
                       qemu \
                       python3-dev \
                       python3-pip \
                       ipython3 \
                       python3-setuptools \
                       default-jdk \
                       net-tools \
                       iproute2 \
                       nasm \
                       cmake \
                       rubygems \
                       vim \
                       tmux \
                       strace \
                       ltrace \
                       autoconf \
                       socat \
                       netcat \
                       nmap \
                       curl \
                       wget \
                       tcpdump \
                       exiftool \
                       hexedit \
                       patchelf \
                       binutils \
                       pcaputils \
                       pcre2-utils \
                       psutils \
                       squashfs-tools \
                       unzip \
                       bison \
                       bc \
                       flex \
                       libelf-dev \
                       libtool-bin \
                       libini-config-dev \
                       libssl-dev \
                       libffi-dev \
                       libglib2.0-dev \
                       libseccomp-dev \
                       libedit-dev \
                       libpixman-1-dev \
                       libc6:i386 \
                       libc6-dev-i386 \
                       libstdc++6:i386 \
                       libncurses5:i386 \
                       zlib1g-dev \
                       liblzma-dev \
                       python-magic \ 
                       cmake \
                       z3 \ 
                       python-lzma \
                       gcc-multilib \ 
                       g++-multilib \
                       ruby-full \
                       binutils-mips-linux-gnu


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

# Install one_gadget
sudo gem install one_gadget

# Install arm_now
sudo apt update
sudo apt install e2tools
sudo pip3 install https://github.com/nongiach/arm_now/archive/master.zip --upgrade
sudo apt clean
