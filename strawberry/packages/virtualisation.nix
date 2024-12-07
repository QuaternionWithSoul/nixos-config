{ ... }: {
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
    enableKvm = true;
    enableWebService = true;
  };
}
