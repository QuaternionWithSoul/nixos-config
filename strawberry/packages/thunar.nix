{ pkgs, ... }: {
  programs = {
    xfconf.enable = true;

    thunar = {
      enable = true;
      
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-dropbox-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}