{ pkgs, ... }: {
  home.packages = with pkgs; [
    # hanami package for creating new apps
    #   use with a shell: nix shell .#hanami
    # hanami
  ];

  xdg.configFile."zellij/layouts/hanami.kdl".text = ''
    layout {
      default_tab_template {
        children
        pane size=1 borderless=true {
          plugin location="zellij:compact-bar"
        }
      }
      tab name="Edit" split_direction="vertical" {
        pane
        pane command="bundle" size="35%" {
          args "exec" "rake"
        }
      }
      tab name="Servers" split_direction="vertical" {
        pane command="hanami" {
          args "server"
          start_suspended true
        }
        pane command="zsh" {
          args "-c" "postgres -D $PGDATA -k $PGDATA"
        }
      }
    }
  '';
}
