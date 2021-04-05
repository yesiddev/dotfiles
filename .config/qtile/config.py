# -*- coding: utf-8 -*-
from libqtile import qtile
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"

# ----- KEY BINDINGS -----
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "space", lazy.layout.next()),

    # Moe windows in current stack
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Grow windows 
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod], "n", lazy.layout.normalize()),  # Reset window sizes

    # Toggle between split and unsplit sides of stack.
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),

    # Qtile Essentials
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),

    # Toggle window states
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    Key([mod, "shift"], "m", lazy.window.toggle_fullscreen()),

    # Essential Apps
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "comma", lazy.spawn("rofi -show drun")),
    Key([mod], "s", lazy.spawn("rofi -show power-menu -modi 'power-menu:rofi-power-menu --choices=lockscreen/logout/reboot/shutdown'")),

    # Hardware Volumen and media controls
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    # Apps Keys
    Key(["mod1"], "1", lazy.spawn("google-chrome-stable")),
    Key(["mod1"], "2", lazy.spawn("spotify"), lazy.group["\uf144"].toscreen()),
    Key(["mod1"], "3", lazy.spawn(terminal+" -e vifmrun")),
    Key(["mod1"], "4", lazy.spawn("pcmanfm")),
    Key(["mod1"], "5", lazy.spawn("figma-linux")),
    Key(["mod1"], "6", lazy.spawn("firefox")),
    Key(["mod1"], "7", lazy.spawn("transmission-gtk")),
    Key(["mod1"], "8", lazy.spawn("Qalculate!")),
]

# ----- GROUPS -----
groups_names = [
    ("\uf015", {'layout': 'columns'}), # 
    ("\uf121", {'layout': 'monadtall', 'matches': [Match(wm_class=["atom", "code-oss"])]}), # 
    ("\uf5ae", {'layout': 'max', 'matches': [Match(wm_class=["figma-linux", "gimp"])]}), # 
    ("\uf144", {'layout': 'columns', 'matches': [Match(wm_class=["vlc"])]}), # 
    ("\uf382", {'layout': 'floating', 'matches': [Match(wm_class=["VirtualBox Manager"])]}) # 
]

groups = [Group(name, **kwargs) for name, kwargs in groups_names]

for i, group in enumerate(groups):
    actual = str(i + 1)
    keys.extend([
        # mod1 + number = switch to group
        Key([mod], actual, lazy.group[group.name].toscreen()),

        # mod1 + shift + number = switch to & move focused window to group
        Key([mod, "shift"], actual, lazy.window.togroup(group.name, switch_group=True)),
    ])

# ----- LAYOUTS -----
layout_config = {
    "border_width": 2,
    "margin": 4,
    "border_focus": "#5494e2"
}

layouts = [
    layout.Columns(**layout_config),
    layout.MonadTall(**layout_config),
    layout.Max(**layout_config),
    layout.Floating(**layout_config),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# ----- WIDGETS -----
colors = [
    ["#404552", "#404552"], # base dark
    ["#ffffff", "#ffffff"], # base light
    ["#3b3e45", "#3b3e45"], # text dark
    ["#d3dae3", "#d3dae3"], # text light
    ["#383c4a", "#383c4a"], # bg dark
    ["#f5f6f7", "#f5f6f7"], # bg light
    ["#5294e2", "#5294e2"], # selected
    ["#f27835", "#f27835"], # warning
    ["#fc4138", "#fc4138"], # error
    ["#73d216", "#73d216"]  # success
]

widget_defaults = dict(
    font = 'Dejavu Sans Mono',
    fontsize = 14,
    padding = 3,
    background = colors[4],
    foreground = colors[3]
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(
                    scale = 0.6
                ),
                widget.GroupBox(
                    borderwidth = 1,
                    active = colors[1],
                    inactive = colors[0],
                    rounded = False,
                    highlight_color = colors[6],
                    block_highlight_text_color = colors[1],
                    highlight_method = 'line',
                    urgent_border = colors[7],
                    this_current_screen_border = colors[6],
                    this_screen_border = colors[5],
                    other_current_screen_border = colors[4],
                    other_screen_border = colors[4],
                    hide_unused = True,
                    disable_drag = True
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.CheckUpdates(
                    distro = "Arch",
                    colour_have_updates = colors[8],
                    colour_no_updates = colors[3],
                    display_format = "\uf021 {updates}",
                    update_interval = 1600,
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal+' -e sudo pacman -Syu --noconfirm')}
                ),
                widget.Systray(
                    padding = 8
                ),
                widget.Clock(
                    format = '%I:%M %p',
                    padding = 8
                ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='pcmanfm'),
    Match(wm_class='leafpad'),
    Match(wm_class='Qalculate!'),
    Match(wm_class='vlc'),
    Match(wm_class='pavucontrol'),
    Match(wm_class='sxiv'),
    Match(wm_class='file-roller'),
    Match(wm_class='VirtualBox Manager'),
    Match(wm_class='Lightdm-gtk-greeter-settings'),
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
