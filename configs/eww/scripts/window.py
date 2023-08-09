#!/usr/bin/python

import subprocess
import os
import socket

def update_window(active_window):
    
    prompt = f"(label :limit-width 60 :text \"{active_window}\" )"
    
    subprocess.run(f"echo '{prompt}'", 
                   shell=True)

sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

server_address = f'/tmp/hypr/{os.environ["HYPRLAND_INSTANCE_SIGNATURE"]}/.socket2.sock'

sock.connect(server_address)

while True:
    new_event = sock.recv(4096).decode("utf-8")
    
    for item in new_event.split("\n"):
            
        if "activewindow>>" == item[0:14]:
            active_window = item.split(",",1)[1]
            
            if not active_window:
                active_window = "Time to start something new!"

            update_window(str(active_window))
