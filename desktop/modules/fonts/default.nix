{ pkgs, ... }: {

  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    twemoji-color-font
    font-awesome
    terminus_font
    powerline-fonts
    powerline-symbols
    
    ( nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; } )
    ( nerdfonts.override { fonts = [ "JetBrainsMono" ]; } )
  ];
  
}
