{ username, ... }: {

  users.users.${username} = {

    isNormalUser = true;

    home  = "/home/${username}";

    extraGroups = [
      "wheel"
      "input"
      "scanner"
      "video" 
      "input" 
      "audio"
      "networkmanager"
    ];
    
  };

}
