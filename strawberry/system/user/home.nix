{ userName, homeVersion, ... }: {
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = homeVersion;
  };
}
