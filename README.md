# LUG OS iso
---
This repo contains the files required to build the ISO file for the [**Linux club**'s](https://lugvitc.org) custom Linux distribution, which can be found at [this repo](https://github.com/lugvitc/LUG_custom_distro).

The ISO can be built and tested on all Arch-based distributions. 

Ensure that you have `archiso` installed from the [Arch repositories](https://archlinux.org/packages/extra/any/archiso/).
To test the ISO, simply clone this repo and run the build script provided:

```bash
git clone https://github.com/lugvitc/LUGOS-iso
cd LUGOS-iso
./build.sh
```

This would produce an ISO that is suitable for installation in VMs and on bare metal.
