#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="StratOS"
iso_label="StratOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="LUGVITC <https://lugvitc.org>"
iso_application="Live ISO for LUGVITC's Linux distro"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="stratos"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/gshadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/StratOS-configure-gnome"]="0:0:777"
  ["/usr/local/bin/StratOS-configure-theme"]="0:0:777"
  ["/usr/local/bin/StratOS-configure-bedrock"]="0:0:777"
  ["/usr/local/bin/StratOS-configure-browser"]="0:0:777"
  ["/usr/local/bin/StratOS-configure-ubuntu"]="0:0:777"
  ["/usr/local/bin/install-bedrock-x86_64"]="0:0:777"
)
