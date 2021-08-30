sudo dpkg --add-architecture i386

sudo apt update && dpkg -l | grep ^ii | cut -d' ' -f3 | grep -v '^libgcc-s1:amd64$' | xargs apt-get install -y --reinstall

sudo apt  install -y sudo \
                       build-essential \
                       git \
                       gcc-multilib \
                       g++-multilib \
                       clang \
                       llvm \
                       gdb \
                       gdb-multiarch \
                       qemu-system \
                       qemu \
                       python3-dev \
                       python3-pip \
                       ipython3 \
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
                       libncurses5:i386