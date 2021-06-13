# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nix-workstation"; # Define your hostname.
  # networking.wireless.enable = true;   # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  systemd.services.systemd-udev-settle.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  # Fix save hardware clock shutdown bottleneck
  time.hardwareClockInLocalTime = true;
  


  # Set your time zone.
  time.timeZone = "America/Chicago";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
#  servic#es.dhcpd4.enabwmii false;
#  services.dhcpd6.enable = false;
#  netwmiiing.useDHCP = false;
#  networking.interfaces.enp0s25.useDHCP = true;
#  networking.interfaces.wlp3s0.useDHCP = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
    };

  # Enable Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.defaultSession = "none+xmonad";
 # services.xserver.windowManager.fvwm.gestures = true;
 # services.xserver.windowManager.xmonad.enable = true;
#  services.xserver.windowManager.xmonad.enable = true;
#  services.xserver.autorun = false;
#  services.xserver.exportConfiguration = true;

  services.xserver.windowManager = {                     # Open configuration for the window manager.
    xmonad.enable = true;                                # Enable xmonad.
    xmonad.enableContribAndExtras = true;                # Enable xmonad contrib and extras.
    xmonad.extraPackages = hpkgs: [                      # Open configuration for additional Haskell packages.
      hpkgs.xmonad-contrib                               # Install xmonad-contrib.
      hpkgs.xmonad-extras                                # Install xmonad-extras.
      hpkgs.xmonad                                       # Install xmonad itself.
    ];
    default = "xmonad";                                  # Set xmonad as the default window manager.
  };


#Enable automatic system update
system.autoUpgrade.enable = true;
system.autoUpgrade.allowReboot = true;

users.extraUsers.xenophile = {
      shell = pkgs.ksh;
    };

environment.variables.XDG_CONFIG_DIRS = [ "/etc/xdg" ]; # we should probably have this in NixOS by default
environment.etc."xdg/mimeapps.list" = {
      text = ''
          [Default Applications]
                  mime/text=kakoune.desktop;
                    '';
};

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
#  services.xserver = {
#    xkbOptions = "caps:swapescape";
#  };



  #Enable and configure doas
  security.doas.enable = true;
  security.doas.extraRules = [{
    users = [ "xenophile" ];
    persist = true;
    keepEnv = true;
  }];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  #nixpkgs.config.pulseaudio = true;
  #hardware.pulseaudio.package = pkgs.pulseaudioFull;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xenophile = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager""audio" ]; # Enable ‘sudo’ for the user.
   };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     wget
     firefox
     xfce.xfce4-terminal	
     pywal
     feh
     imagemagick
     picom
     xfce.thunar
     fff
     glances
     cmus 
     canto-curses
     qutebrowser
     pavucontrol
     soulseekqt
     mpv
     rofi
     bashmount
     ntfs3g
     exfat-utils
     udevil
     zsh
     htop
     nmon
     neofetch
     haxor-news
     nyxt
     libnma
     alacritty
     termite
     i3lock
     gtypist
     weechat
     ranger
     kitty
     git
     python3
     cmake
     nodejs
     unzip
     ibm-plex
     nerdfonts
     rtorrent
     googler
     neo-cowsay
     protonvpn-cli
     dwm
     dmenu
     gnupatch
     xorg.xinit
     cmake
     gnumake
     pkg-config-unwrapped
     freetype
     haskellPackages.freetype2
     st
     ly
     xterm
     haskellPackages.xmobar
     rofi
     cwm
     gnome3.gedit
     xorg.xdm
     lightdm-tiny-greeter
     lightdm-mini-greeter
     pfetch
     terminus_font_ttf
     brave
     dina-font
     dina-font-pcf
     arandr
     nodePackages.coinmon
     cointop
     flashfocus
     gimp
     sc-im
     go
     gomuks
     scim
     nicotine-plus
     xorg.xclock
     xorg.xcalc
     ksh
     nnn
     ranger
     wily
     edit
     sam
     vis
     doas
     tmux
     home-manager
     aileron
     liberation_ttf
     arkpandora_ttf
     inter
     iosevka
     castor
     xorg.xsetroot
     plan9port
     rc
     xorg.xload
     conky
     peaclock
     fvwm
     wmii_hg
     libstroke
     dash
     spectrwm
     ed
     zathura
  ];

fonts.fonts = with pkgs; [
  ibm-plex
  nerdfonts
  terminus_font_ttf
  dina-font
  dina-font-pcf
  aileron
  liberation_ttf
  arkpandora_ttf
  inter
  iosevka
  pipewire
];

  nixpkgs.config.allowUnfree = true;



  # Enable device auto-mounting
  services.devmon.enable = true;


  


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
