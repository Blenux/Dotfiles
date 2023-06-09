#!/usr/bin/env python

import i3ipc

# Connect to the i3 IPC socket
ipc = i3ipc.Connection()

# Function to switch to tabbed layout
def switch_to_tabbed_layout():
    command = "layout tabbed"
    ipc.command(command)

# Callback function for window events
def on_window_event(ipc, event):
    if event.change == 'new':
        workspace = ipc.get_tree().find_focused().workspace()
        if len(workspace.leaves()) > 4:
            switch_to_tabbed_layout()

# Subscribe to window events
ipc.on('window', on_window_event)

# Start the event loop
ipc.main()
