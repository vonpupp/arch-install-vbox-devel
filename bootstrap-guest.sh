mount -o remount,size=2G /run/archiso/cowspace
pacman --noconfirm -Syy
pacman --noconfirm -S git
git clone https://github.com/vonpupp/arch-install-scripts.git
git clone -b feature/efi-crypt https://github.com/vonpupp/arch-installer.git
git clone https://github.com/vonpupp/arch-by-hand.git
