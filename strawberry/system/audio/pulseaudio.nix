{ ... }: {
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  services.pipewire.enable = false;
}
