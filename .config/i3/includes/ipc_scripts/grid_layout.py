#!/usr/bin/env python

import i3ipc

# Connect to the i3 IPC socket
ipc = i3ipc.Connection()

# Function to switch to grid layout
def switch_to_grid_layout():
    command = "layout default"
    ipc.command(command)

# Callback function for window events
def on_window_event(ipc, event):
    if event.change == 'new':
        workspace = ipc.get_tree().find_focused().workspace()
        num_windows = len(workspace.leaves())
        if num_windows <= 4:
            switch_to_grid_layout()

# Subscribe to window events
ipc.on('window', on_window_event)

# Start the event loop
ipc.main()
