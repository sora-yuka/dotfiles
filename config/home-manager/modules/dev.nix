{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    python314
    virtualenv
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
