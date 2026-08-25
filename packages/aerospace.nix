# Tiling window manager for macOS
{
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.aerospace];

  home-manager.sharedModules = [
    {
      xdg.configFile."aerospace/aerospace.toml".text = ''
        [gaps]
        inner.horizontal = 8
        inner.vertical = 8
        outer.left = 8
        outer.bottom = 8
        outer.top = 8
        outer.right = 8

        [workspace-to-monitor-force-assignment]
        1 = 'main'
        2 = 'main'
        3 = 'main'
        4 = 'main'
        5 = 'main'
        6 = 'secondary'
        7 = 'secondary'
        8 = 'secondary'
        9 = 'secondary'
        0 = 'secondary'

        [mode.main.binding]
        # App bindings
        cmd-alt-ctrl-b = 'exec-and-forget open -a Firefox'
        cmd-alt-ctrl-t = 'exec-and-forget open -a ghostty'
        cmd-alt-ctrl-f = 'exec-and-forget open -a Finder'
        cmd-alt-ctrl-o = 'exec-and-forget open -a Obsidian'
        cmd-alt-ctrl-p = 'exec-and-forget open -a Preview'
        cmd-alt-ctrl-m = 'exec-and-forget open -a "Proton Mail"'
        cmd-alt-ctrl-s = 'exec-and-forget open -a Slack'
        cmd-alt-ctrl-w = 'exec-and-forget open -a WhatsApp'
        cmd-alt-ctrl-n = 'exec-and-forget open -a Notion'

        # Focus bindings
        cmd-alt-ctrl-h = 'focus left'
        cmd-alt-ctrl-j = 'focus down'
        cmd-alt-ctrl-k = 'focus up'
        cmd-alt-ctrl-l = 'focus right'

        # Move window bindings
        cmd-alt-ctrl-shift-h = 'move left'
        cmd-alt-ctrl-shift-j = 'move down'
        cmd-alt-ctrl-shift-k = 'move up'
        cmd-alt-ctrl-shift-l = 'move right'

        # Workspace bindings
        cmd-alt-ctrl-1 = 'workspace 1'
        cmd-alt-ctrl-2 = 'workspace 2'
        cmd-alt-ctrl-3 = 'workspace 3'
        cmd-alt-ctrl-4 = 'workspace 4'
        cmd-alt-ctrl-5 = 'workspace 5'
        cmd-alt-ctrl-6 = 'workspace 6'
        cmd-alt-ctrl-7 = 'workspace 7'
        cmd-alt-ctrl-8 = 'workspace 8'
        cmd-alt-ctrl-9 = 'workspace 9'
        cmd-alt-ctrl-0 = 'workspace 0'

        # Move node to workspace bindings
        cmd-alt-ctrl-shift-1 = 'move-node-to-workspace 1'
        cmd-alt-ctrl-shift-2 = 'move-node-to-workspace 2'
        cmd-alt-ctrl-shift-3 = 'move-node-to-workspace 3'
        cmd-alt-ctrl-shift-4 = 'move-node-to-workspace 4'
        cmd-alt-ctrl-shift-5 = 'move-node-to-workspace 5'
        cmd-alt-ctrl-shift-6 = 'move-node-to-workspace 6'
        cmd-alt-ctrl-shift-7 = 'move-node-to-workspace 7'
        cmd-alt-ctrl-shift-8 = 'move-node-to-workspace 8'
        cmd-alt-ctrl-shift-9 = 'move-node-to-workspace 9'
        cmd-alt-ctrl-shift-0 = 'move-node-to-workspace 0'

        cmd-alt-ctrl-comma = 'mode layout'   # enter layout mode

        [mode.layout.binding]
        h = ['join-with left',  'mode main']
        j = ['join-with down',  'mode main']
        k = ['join-with up',    'mode main']
        l = ['join-with right', 'mode main']

        s = ['layout tiles horizontal vertical', 'mode main']  # (s)plit toggle: row <-> column
        a = ['layout accordion horizontal vertical', 'mode main']  # (a)ccordion

        esc = 'mode main'
        enter = 'mode main'
      '';
    }
  ];
}
