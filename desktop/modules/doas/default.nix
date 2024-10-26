{ username, ... }: {
  
  security.doas.enable = true;

  security.doas.extraRules = [ {
    users = [ "${username}" ];
    keepEnv = true;
    persist = true;
  } ];

}
