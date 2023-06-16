#!/usr/bin/env python

import i3ipc

# Connect to the i3 IPC socket
ipc = i3ipc.Connection()

# Function to switch to tabbed layout
def switch_to_tabbed_layout():
    command = "layout tabbed"
    ipc.command(command)

# Function to switch to split layout
def switch_to_split_layout():
    command = "layout splith"
    ipc.command(command)

# Callback function for window events
def on_window_event(ipc, event):
    workspace = ipc.get_tree().find_focused().workspace()
    num_windows = len(workspace.leaves())
    if num_windows > 2:
        switch_to_tabbed_layout()
    elif num_windows < 3:
        switch_to_split_layout()

# Subscribe to window events
ipc.on('window', on_window_event)

# Start the event loop
ipc.main()
