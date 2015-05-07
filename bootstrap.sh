#ssh root@localhost -p 2222 'pacman -Sy && pacman --noconfirm -S git && git clone https://github.com/vonpupp/arch-by-hand.git'
#
#
#loadkeys uk
#wifi-menu
#dhcpcd
#pacman -Syy --noconfirm git
#git clone https://flexiondotorg@bitbucket.org/flexiondotorg/archinstaller.git
#cd ArchInstaller

# Clone archinstaller
git clone https://github.com/vonpupp/archinstaller

# Remove ssh id and add it again
ssh-keygen -R "[localhost]:2222"
ssh-copy-id root@localhost -p 2222

# Mount livecd pacman's cache
ssh root@localhost -p 2222 '[[ ! -d "/var/cache/pacman/pkg" ]] && mkdir -m 755 -p "/var/cache/pacman/pkg"'
ssh root@localhost -p 2222 '[[ ! -d "/var/lib/pacman/sync" ]] && mkdir -m 755 -p "/var/lib/pacman/sync"'
ssh root@localhost -p 2222 'mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/lib/pacman/sync /var/lib/pacman/sync'
ssh root@localhost -p 2222 'mount -t nfs -o nolock nas:/share/cache/arch/$(uname -m)/var/cache/pacman/pkg /var/cache/pacman/pkg'

# Result: WORKS OK!
#ssh root@localhost -p 2222 'pacman -Syy --noconfirm git && git clone https://github.com/vonpupp/archinstaller'
#ssh root@localhost -p 2222 'cd archinstaller && git checkout feature/noefi'
#ssh root@localhost -p 2222 'cd archinstaller && git clone https://github.com/vonpupp/arch-install-scripts'
#ssh root@localhost -p 2222 'cd archinstaller/arch-install-scripts && git checkout feature/bios-nocrypt'

## Result: MISSING STUFF
#ssh root@localhost -p 2222 'pacman -Syy --noconfirm git && git clone https://github.com/vonpupp/archinstaller'
#ssh root@localhost -p 2222 'cd archinstaller && git checkout feature/bios-crypt'
#ssh root@localhost -p 2222 'cd archinstaller && git clone https://github.com/vonpupp/arch-install-scripts'
#ssh root@localhost -p 2222 'cd archinstaller/arch-install-scripts && git checkout feature/bios'
## Partition by hand
## Mount NFS

## Result: WORKS OK!
#ssh root@localhost -p 2222 'pacman -Syy --noconfirm git && git clone https://github.com/vonpupp/archinstaller'
#ssh root@localhost -p 2222 'cd archinstaller && git checkout feature/efi-nocrypt'
#ssh root@localhost -p 2222 'cd archinstaller && git clone https://github.com/vonpupp/arch-install-scripts'
#ssh root@localhost -p 2222 'cd archinstaller/arch-install-scripts && git checkout feature/efi-nocrypt'
## Partition: NO partition by hand, only use archinstaller and gummiboot
## Mount NFS
##HOOKS="base udev autodetect modconf block keymap filesystems keyboard fsck"

# Result: BROKEN EFI
ssh root@localhost -p 2222 'pacman -Syy --noconfirm git && git clone https://github.com/vonpupp/archinstaller'
ssh root@localhost -p 2222 'cd archinstaller && git checkout feature/efi-crypt'
ssh root@localhost -p 2222 'cd archinstaller && git clone https://github.com/vonpupp/arch-install-scripts'
ssh root@localhost -p 2222 'cd archinstaller/arch-install-scripts && git checkout master'
# Partition by hand
# Mount NFS
#HOOKS="base udev autodetect modconf block keymap encrypt lvm2 filesystems keyboard fsck"
#GRUB_CMDLINE_LINUX_DEFAULT="crptdevice=/dev/disk/by-partlabel/cryptlvm:storage root=/dev/mapper/storage-root quiet"


#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
#  /run/lvm/lvmetad.socket: connect failed: No such file or directory
#  WARNING: Failed to connect to lvmetad. Falling back to internal scanning.
