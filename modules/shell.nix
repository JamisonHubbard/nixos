{
  config,
  pkgs,
  ...
}: {
  imports = [];

  environment.shellAliases = {
    ll = "ls -l";
    la = "ls -al";
    gs = "git status";
    gb = "git branch";
  };

  programs.starship = {
    enable = true;
    settings = {
      format = "$username$hostname$git_branch$git_metrics$directory$character";
      add_newline = false;

      username = {
        show_always = true;
        style_user = "bold #db8427";
        format = "[$user]($style) ";
      };

      hostname = {
        ssh_only = true;
        format = "@(blue)[$hostname](bold blue) ";
      };

      git_branch = {
        format = "[$branch(:$remote_branch)]($style) ";
      };

      git_metrics = {
        disabled = false;
        format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
        only_nonzero_diffs = false;
      };
    };
  };
}
