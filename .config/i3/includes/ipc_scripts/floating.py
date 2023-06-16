# import i3ipc

def set_floating_properties(window):
    window.command('floating enable')
    window.command('resize set 800 640')
    window.command('move position center')

def on_window_focus(ipc, event):
    if event.change == 'focus':
        focused_window = ipc.get_tree().find_focused()
        set_floating_properties(focused_window)

# Connect to the i3 IPC
ipc = i3ipc.Connection()

# Subscribe to window focus events
ipc.on('window', on_window_focus)

# Start the main event loop
ipc.main()