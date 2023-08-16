{ cofig, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.autorun = true;
}
