mount -o remount,size=2G /run/archiso/cowspace
pacman --noconfirm -Syy
pacman --noconfirm -S git
git clone https://github.com/vonpupp/arch-by-hand.git
