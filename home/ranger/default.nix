{ ... }: {
    home.file.".config/ranger/rc.conf".text = ''
        set preview_images true
        set preview_images_method kitty
        set preview_script /home/jamison/.config/ranger/scope.sh
        set show_hidden true
    '';

    home.file.".config/ranger/scope.sh" = {
        source = ./scope.sh;
    };
}
