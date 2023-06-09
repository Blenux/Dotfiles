import i3ipc

def on_window_event(i3, e):
    global window_counter

    if e.change == "new":
        window_counter += 1

        if window_counter == 2:
            # Switch to tabbed layout for the second window
            i3.command('[con_mark="__new_window__"] layout tabbed')
        elif window_counter > 2:
            # Move the new window to the last tabbed container
            last_tabbed_container = i3.get_tree().find_marked('__new_window__')
            if last_tabbed_container and last_tabbed_container.type == 'con':
                i3.command('[con_id={}] move container to mark last_tabbed'.format(e.container.id))

i3 = i3ipc.Connection()
window_counter = 0

i3.on("window", on_window_event)

i3.main()
