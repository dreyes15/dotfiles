echo "Checking to see if all tools were properly installed..."
bad=0
if !(python -c "from pwn import *" 2>&1); then
    echo pwntool not installed
   bad=1
fi
if !(binwalk  2>&1 | rg "Extraction Options:" 2>&1 >/dev/null); then
    echo binwalk not installed
   bad=1
fi
if !(ROPgadget  2>&1 | rg "Need a binary filename" 2>&1 >/dev/null); then
    echo ropgadget not installed 
   bad=1
fi
if !(strace  2>&1 | rg "Try 'strace -h'" 2>&1 >/dev/null); then
    echo strace not installed
   bad=1
fi
if !(ltrace  2>&1 | rg "too few arguments" 2>&1 >/dev/null); then
    echo ltrace not installed
   bad=1
fi
if !(python3 -c "import r2pipe" 2>&1); then
    echo r2pipe python3 not installed
   bad=1
fi
if !(python2 -c "import r2pipe" 2>&1); then
    echo r2pipe python2 not installed
   bad=1
fi
if !(qemu-arm --help 2>&1 | rg "usage: qemu-arm" 2>&1 >/dev/null); then
    echo qemu-arm not installed
   bad=1
fi
if !(qemu-mips --help 2>&1 | rg "usage: qemu-mips" 2>&1 >/dev/null); then
    echo qemu-mips not installed
   bad=1
fi
if !(rg --version 2>&1 | rg "ripgrep" 2>&1 >/dev/null); then
    echo ripgrep not installed
   bad=1
fi
if !(/home/user/.cargo/bin/cargo --help 2>&1 | rg "See 'cargo help " 2>&1 >/dev/null); then
    echo cargo not installed
   bad=1
fi
if !(/home/user/.cargo/bin/rustup --help 2>&1 | rg "The Rust toolchain installer" 2>&1 >/dev/null); then
    echo rustup not installed
   bad=1
fi
if !(one_gadget --help 2>&1 | rg "Usage: one_gadget " 2>&1 >/dev/null); then
    echo one_gadget not installed
   bad=1
fi
if !(arm_now --help 2>&1 | rg "arm_now list " 2>&1 >/dev/null); then
    echo arm_now not installed
   bad=1
fi
if !(bash --version 2>&1 | rg "(4.4|5.0)" 2>&1 >/dev/null); then
    echo bash 4.4 not installed 
   bad=1
fi
if !(python -c "import capstone" 2>&1); then
    echo capstone python2 not installed
   bad=1
fi
if !(python -c "import keystone" 2>&1); then
    echo keystone python2 not installed
   bad=1
fi
if !(python -c "import unicorn" 2>&1); then
    echo unicorn python2 not installed
   bad=1
fi
if !(python3 -c "import capstone" 2>&1); then
    echo capstone python2 not installed
   bad=1
fi
if !(python3 -c "import keystone" 2>&1); then
    echo keystone python2 not installed
   bad=1
fi
if !(python3 -c "import unicorn" 2>&1); then
    echo unicorn python2 not installed
   bad=1
fi
if !(netstat  2>&1 | rg "Active Internet connections" 2>&1 >/dev/null); then
    echo net-tools not installed
   bad=1
fi
if !(python -V 2>&1 | rg "2." 2>&1 >/dev/null); then
    echo python -V not 2.x not installed
   bad=1
fi
if !(gdb --version 2>&1 | rg "GNU gdb" 2>&1 >/dev/null); then
    echo gdb not installed
   bad=1
fi
if [ $bad -eq 1 ]; then
    echo "Some programs wre not succefully installed or wrong versions were installed..."
	exit 1
fi
echo "All programs sucessfully installed..."
echo "You are free to hack away."
exit 0
