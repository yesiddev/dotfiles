# -*- coding: utf-8 -*-

import os
import re
import socket
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile import qtile

mod = "mod4"                # Set SUPER/WINDOWS 
terminal = "alacritty"      # Default terminal

keys = [Key(key[0], key[1], *key[2:]) for key in[
    ### Window Essentials

    # Switch between windows
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "space", lazy.layout.next()),
    
    # Moving windows in current stack
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Grow windows
    ([mod, "control"], "h", lazy.layout.grow_left()),
    ([mod, "control"], "j", lazy.layout.grow_down()),
    ([mod, "control"], "k", lazy.layout.grow_up()),
    ([mod, "control"], "l", lazy.layout.grow_right()),
    ([mod], "n", lazy.layout.normalize()),  # Reset all window sizes

    # Toggle split/unsplit sides
    ([mod, "shift"], "Return", lazy.layout.toggle_split()),

    # Toggle window states
    ([mod, "shift"], "f", lazy.window.toggle_floating()),       # Floating
    ([mod, "shift"], "m", lazy.window.toggle_fullscreen()),     # Full Screen

    # Toggle between layouts
    ([mod], "Tab", lazy.next_layout()),

    # Qtile essentials
    ([mod], "w", lazy.window.kill()),           # Kill window
    ([mod, "control"], "r", lazy.restart()),    # Restart Qtile
    ([mod, "control"], "q", lazy.shutdown()),   # Shutdown Qtile
    ([mod], "r", lazy.spawncmd()),              # Prompt Widget
    
    # Launch essential apps
    ([mod], "Return", lazy.spawn(terminal)),
    ([mod], "comma", lazy.spawn("rofi -show drun")),
    ([mod], "0", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu")),

    # Hardware Volumen and media controls
    ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 2")),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 2")),
    ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),

    ### Apps
    (["mod1"], "1", lazy.spawn("google-chrome-stable")),
    (["mod1"], "2", lazy.spawn("code-oss")),
    (["mod1"], "3", lazy.spawn("figma-linux"), lazy.group["\uf5ae"].toscreen()),
    (["mod1"], "4", lazy.spawn("spotify"), lazy.group["\uf144"].toscreen()),
    (["mod1"], "8", lazy.spawn("leafpad")),
    (["mod1"], "9", lazy.spawn("pcmanfm")),
    (["mod1"], "0", lazy.spawn(terminal+" -e vifmrun"), lazy.group["\uf07b"].toscreen()),
    (["mod1"], "c", lazy.spawn("galculator")),

]]

groups = [Group(i) for i in [
    "\uf268", # 
    "\uf121", # 
    "\uf5ae", # 
    "\uf144", # 
    "\uf013", # 
    "\uf07b", # 
    "\uf381", # 
    "\uf395", # 
    "\uf120", # 
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

layout_conf = {
    "border_width": 1,
    "margin": 4,
    "border_focus": "#c03c3c",
    }


layouts = [
    layout.Columns(**layout_conf),
    layout.MonadTall(**layout_conf),
    layout.MonadWide(**layout_conf),
    layout.Max(**layout_conf),
    layout.Tile(shift_windows=True, **layout_conf),
    layout.Bsp(**layout_conf),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.TreeTab(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [
        ["#f4f5f9", "#f4f5f9"], # Background
        ["#383c4a", "#383c4a"], # Foreground
        ["#f1404b", "#f1404b"], # Current border
        ["#252c41", "#252c41"], # Other tabs
        ["#9b9ca1", "#9b9ca1"], # Inactives
        ]

widget_defaults = dict(
    font = 'Noto Sans Medium',
    fontsize = 14,
    background = colors[0],
    foreground = colors[1]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    fontsize = 16,
                    borderwidth = 1,
                    active = colors[1],
                    inactive = colors[4],
                    rounded = False,
                    highlight_color = colors[2],
                    block_highlight_text_color = colors[0],
                    highlight_method = 'line',
                    urgent_border = colors[3],
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[4],
                    other_current_screen_border = colors[0],
                    other_screen_border = colors[0],
                    disable_drag = True
                    ),
                widget.Prompt(),
                widget.WindowName(
                    background = colors[1],
                    foreground = colors[0],
                    padding = 8
                    ),
                widget.CurrentLayout(
                    padding = 8,
                    foreground = colors[4]
                    ),
                widget.CheckUpdates(
                    distro = "Arch",
                    colour_have_updates = colors[2],
                    colour_no_updates = colors[1],
                    display_format = "\uf021",
                    foreground = colors[2],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu --noconfirm')}
                    ),
                widget.Systray(
                    padding = 8
                    ),
                widget.Clock(
                    format = '%I:%M %p',
                    padding = 8,
                    fontsize = 16
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
follow_mouse_focus = False
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
    Match(wm_class='lxappearance'),
    Match(wm_class='galculator'),
    Match(wm_class='vlc'),
    Match(wm_class='pavucontrol'),
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
