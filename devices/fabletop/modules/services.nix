{ config, pkgs, lib, ... } :
with lib;
{
  config = {
    boot.blacklistedKernelModules = [ "snd_pcsp" ];
    sound.enable = true;
  };

  config.services = {
    acpid.enable = true;
    dbus.enable = true;
    mpd.enable = false;
    nixosManual.showManual = false;
    ntp.enable = true;
    openssh.enable = false;
    printing = {
      enable = true;
      drivers = [ pkgs.gutenprint pkgs.foomatic_filters ];
    };
    pcscd.enable = true;
    transmission.enable = false;
    udev = {
      packages = [ pkgs.yubikey-personalization ];
    };
    udisks2.enable = true;
    upower.enable = true;
    xfs.enable = false;
  };
}
