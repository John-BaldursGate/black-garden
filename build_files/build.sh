#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# remove unwanted packages
dnf5 remove firefox firefox-langpacks gnome-software gnome-software-ostree gnome-tour yelp malcontent-control htop nvtop -y

# this installs a package from fedora repos
dnf5 install btop distrobox fastfetch libguestfs-tools libvirt-daemon-config-network libvirt-daemon-kvm mangohud python3-libguestfs qemu-kvm rocm-smi steam steam-devices virt-install virt-manager virt-top virt-viewer wine -y

dnf5 -y copr enable atim/heroic-games-launcher
dnf5 -y copr enable ilyaz/LACT
dnf5 -y install heroic-games-launcher-bin
dnf5 -y install lact
dnf5 -y copr disable atim/heroic-games-launcher
dnf5 -y copr disable ilyaz/LACT
# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable lactd
