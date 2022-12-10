{
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  environment.etc."wireplumber/main.lua.d/51-pulsarcustom.lua" = {
    text = ''
          alsa_monitor.rules = {
        {
          matches = {
            {
              -- Matches all sources.
              { "node.name", "matches", "alsa_input.*" },
            },
            {
              -- Matches all sinks.
              { "node.name", "matches", "alsa_output.*" },
            },
          },
          apply_properties = {
            ["api.alsa.headroom"]      = 64,
          },
        },
      }
    '';
  };
}
