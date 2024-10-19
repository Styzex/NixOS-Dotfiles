{ config, pkgs, inputs, ... }:

{
    home.packages = with pkgs; [
        rustup
        gcc
        pkg-config
        cmake
        gnumake
        SDL2
        SDL2.dev
        libGL
        libGLU
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
    ];

    home.sessionVariables = {
      LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
        libGL
        libGLU
        SDL2
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
      ];
      PKG_CONFIG_PATH = with pkgs; lib.makeSearchPathOutput "dev" "lib/pkgconfig" [
        libGL
        libGLU
        SDL2
        xorg.libX11
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libxkbcommon
      ];
    };

    programs.bash.initExtra = ''
      export PATH=$PATH:$HOME/.cargo/bin:${pkgs.cmake}/bin:${pkgs.gnumake}/bin
      export LD_LIBRARY_PATH=${pkgs.libGL}/lib:${pkgs.libGLU}/lib:${pkgs.SDL2}/lib:$LD_LIBRARY_PATH
      export LIBRARY_PATH=${pkgs.libGL}/lib:${pkgs.libGLU}/lib:${pkgs.SDL2}/lib:$LIBRARY_PATH
    '';

    programs.zsh.initExtra = ''
      export PATH=$PATH:$HOME/.cargo/bin:${pkgs.cmake}/bin:${pkgs.gnumake}/bin
      export LD_LIBRARY_PATH=${pkgs.libGL}/lib:${pkgs.libGLU}/lib:${pkgs.SDL2}/lib:$LD_LIBRARY_PATH
      export LIBRARY_PATH=${pkgs.libGL}/lib:${pkgs.libGLU}/lib:${pkgs.SDL2}/lib:$LIBRARY_PATH
    '';
}