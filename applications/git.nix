{
  config,
  pkgs,
  ...
}: {
  imports = [];

  programs.git = {
    enable = true;
    userName = "JamisonHubbard";
    userEmail = "jhubbard956@gmail.com";
    aliases = {
      gs = "git status";
      gb = "git branch";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
