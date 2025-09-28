#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# remove unwanted packages
dnf remove firefox firefox-langpacks gnome-software gnome-software-ostree gnome-tour yelp malcontent-control htop nvtop -y

# this installs a package from fedora repos
dnf install btop distrobox fastfetch libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm mangohud python3-libguestfs qemu-kvm rocm-smi steam-devices virt-install virt-manager virt-top virt-viewer wine -y

# rpm fusion
dnf -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y install steam
dnf -y remove rpmfusion-free-release rpmfusion-nonfree-release

dnf -y copr enable atim/heroic-games-launcher
dnf -y copr enable ilyaz/LACT
dnf -y install heroic-games-launcher-bin
dnf -y install lact
dnf -y copr disable atim/heroic-games-launcher
dnf -y copr disable ilyaz/LACT
# Use a COPR Example:
#
# dnf -y copr enable ublue-os/staging
# dnf -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable lactd
