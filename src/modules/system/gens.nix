{ config, lib, pkgs, inputs, ... }:

{
nix.gc = {
  automatic = true;  # Enable automatic garbage collection
  dates = "03:15";   # Schedule the cleanup at 3:15 AM daily
  options = "--delete-older-than 3d";
 };
}
