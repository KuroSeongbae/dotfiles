{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    heroic
    steam-run
    wineWowPackages.stable
  ];
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;  
  }; 
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          libgdiplus
        ]);
      });
    })
  ];
}
