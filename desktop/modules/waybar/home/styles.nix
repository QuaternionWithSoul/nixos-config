{ ... }: {

  programs.waybar.style = ''
  
    * {
      font-family: JetBrains Mono;
      font-weight: bold;
      font-size: 16px;
      border: none;
    }

    #waybar {
      background: transparent;
    }

    .module {
      background: #383c4a;
      color: white;
      border-radius: 8px;
      margin: 0px 4px 0px 4px;
      padding: 3px 16px 3px 16px;
    }

    #workspaces {
      margin-left: 0;
    }

    #backlight {
      margin-right: 0;
    }

    #language {
      border-radius: 8px 0px 0px 8px;
      margin-right: 0;
      padding-right: 6px;
    }

    #keyboard-state {
      border-radius: 0px 8px 8px 0px;
      margin-left: 0;
      padding-left: 6px;
    }

    #workspaces button {
      color: white;
      padding: 0;
    }

    #workspaces button:hover {
      background: #383c4a;
      text-shadow: none;
      box-shadow: none;
    }

  '';

}
