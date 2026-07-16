{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    python314
    uv
    virtualenv
    direnv
    nix-direnv
    nodejs_24
    gnumake42
    postgresql
    docker
    redis
    hoppscotch
    httpie
    openssl
  ];
}
