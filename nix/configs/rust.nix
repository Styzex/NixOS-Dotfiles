{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        rustup
        gcc
        pkg-config
        cmake
        gnumake
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
    ];

    home.sessionVariables = {
      LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
      ];
      PKG_CONFIG_PATH = with pkgs; lib.makeSearchPathOutput "dev" "lib/pkgconfig" [
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
      ];
    };

    programs.bash.initExtra = ''
      export PATH=$PATH:$HOME/.cargo/bin:${pkgs.cmake}/bin:${pkgs.gnumake}/bin
    '';

    programs.zsh.initExtra = ''
      export PATH=$PATH:$HOME/.cargo/bin:${pkgs.cmake}/bin:${pkgs.gnumake}/bin
    '';
}
