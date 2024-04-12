{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    kitty.enable = lib.mkEnableOption "enable kitty";
  };
  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      keybindings = {
        # Create a new window splitting the space used by the existing one so that
        # the two windows are placed one above the other
        "f5" = "launch --location=hsplit";

        # Create a new window splitting the space used by the existing one so that
        # the two windows are placed side by side
        "f6" = "launch --location=vsplit";

        # Create a new window splitting the space used by the existing one so that
        # the two windows aew placed side by side if the existing window is wide or
        # one above the other if the existing window is tall
        "f4" = "launch --location=split";

        # Rotate the current split, changing its split axis from vertical to
        # horizontal or vice versa
        "f7" = "layout_action rotate";

        # Move the active window in the indicated direction
        "shift+up" = "move_window up";
        "shift+left" = "move_window left";
        "shift+right" = "move_window right";
        "shift+down" = "move_window down";

        # Move the window to the indicated screen edge
        "ctrl+shift+up" = "layout_action move_to_screen_edge top";
        "ctrl+shift+left" = "layout_action move_to_screen_edge left";
        "ctrl+shift+right" = "layout_action move_to_screen_edge right";
        "ctrl+shift+down" = "layout_action move_to_screen_edge bottom";

        # Switch focus to the neighboring window in the indicated direction
        "ctrl+left" = "neighboring_window left";
        "ctrl+right" = "neighboring_window right";
        "ctrl+up" = "neighboring_window up";
        "ctrl+down" = "neighboring_window down";
      };
      extraConfig = "include ~/.config/kitty/current-theme.conf 
    font_family JetBrainsMono Nerd Font
    bold_font JetBrainsMono NF Bold
    italic_font JetBrainsMono NF Italic
    bold_italic_font JetBrainsMono NF Bold Italic
    wayland_titlebar_color system
    hide_window_decorations no
    linux_display_server x11
    enabled_layouts splits
    confirm_os_window_close 0
    ";
    };
    home.packages = with pkgs; [kitty-themes];
  };
}
