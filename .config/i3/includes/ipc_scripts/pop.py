#!/usr/bin/env python

import i3ipc

# Connect to the i3 IPC socket
ipc = i3ipc.Connection()

# Function to set up the Pop!_OS tiling layout
def set_popos_tiling_layout():
    command = """
    layout splitv
    split horizontal
    focus up
    layout splith
    focus left
    layout tabbed
    focus right
    layout tabbed
    focus right
    layout tabbed
    """
    ipc.command(command)

# Callback function for workspace focus events
def on_workspace_focus(ipc, event):
    workspace = event.current
    if workspace and workspace.name == "4:Term":
        set_popos_tiling_layout()

# Subscribe to workspace focus events
ipc.on('workspace::focus', on_workspace_focus)

# Start the event loop
ipc.main()
 
