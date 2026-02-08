{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    
    windowManager.oxwm.enable = true;
  };
}
