{ ... }: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$username$git_branch$git_metrics$directory$character";
      add_newline = false;

      username = {
        show_always = true;
        style_user = "bold #89b4fa";
        format = "[$user]($style) ";
      };

      git_branch = {
        format = "[$branch(:$remote_branch)]($style) ";
        style = "bold #af89fa";
      };

      git_metrics = {
        disabled = false;
        format = "[+$added]($added_style)/[-$deleted]($deleted_style) ";
        added_style = "bold #8be8ad";
        deleted_style = "bold #eb7267";
        only_nonzero_diffs = false;
      };

      directory = {
         format = "[$path]($style)[$read_only]($read_only_style) ";
         style = "bold #8be8ad";
      };
    };
  };
}
