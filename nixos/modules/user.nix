{ pkgs, user, ... }:

{
  users = {
    users.${user} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
