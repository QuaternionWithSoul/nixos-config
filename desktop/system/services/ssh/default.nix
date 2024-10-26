{ ... }: {

  networking.firewall.allowedUDPPorts = [ 22 ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
    };
  };

}
