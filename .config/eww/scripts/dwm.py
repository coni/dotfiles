#!/bin/python3

from subprocess import Popen, PIPE
import json
import math
import sys

def read_stdout_json(p):
    out = p.stdout.read1().decode("utf-8")
    try:
        res = json.loads(out)
    except:
        res = {}
    return res

def bits(number, max_bits=0):
    bit = 1
    count = 0
    while number >= bit:
        count += 1
        if number & bit:
           yield 1
        else:
           yield 0
        bit <<= 1
    if max_bits > count:
        for i in range(max_bits - count):
            yield 0

def change_workspace(workspace):
    Popen([ "dwm-msg", "run_command", "view", workspace ], stdout=PIPE)

def get_len_tags():
    p = Popen([ "dwm-msg", "get_tags" ], stdout=PIPE)
    event = read_stdout_json(p)
    return len(event)

def get_current_workspaces(max_tags):
    p = Popen([ "dwm-msg", "get_monitors" ], stdout=PIPE)
    event = read_stdout_json(p)

    occupied = event[0]["tag_state"]["occupied"]
    current = event[0]["tag_state"]["selected"]
    workspaces = []

    event_out = { "max": max_tags }
    event_out["current"] = int(math.log(current, 2) + 1)

    counter = 1
    for i in bits(occupied, max_tags):
        current_workspace = {"id": counter, "windows": i}
        workspaces.append(current_workspace)
        counter += 1
    event_out["workspaces"] = workspaces

    return event_out

def print_json(obj):
    out = str(obj).replace("'", '"')
    print(out, flush=True)

def get_workspaces():
    max_tags = get_len_tags()
    event_out = { "max": max_tags }

    print_json(get_current_workspaces(max_tags))

    p = Popen(["dwm-msg", "subscribe", "tag_change_event"], stdout=PIPE)

    event = read_stdout_json(p)
    if event["result"] != "success":
        print(event)
        return 1


    while True:
        event = read_stdout_json(p)
        if event == {}:
            continue

        occupied = event["tag_change_event"]["new_state"]["occupied"]
        current = event["tag_change_event"]["new_state"]["selected"]
        event_out["current"] = int(math.log(current, 2) + 1)

        counter = 1
        workspaces = []
        for i in bits(occupied, max_tags):
            current_workspace = {"id": counter, "windows": i}
            workspaces.append(current_workspace)
            counter += 1
        event_out["workspaces"] = workspaces

        print_json(event_out)

def main(argc, argv):
    if argc < 2:
        exit(1)
    if argv[1] == "title":
        print("")
    elif argv[1] == "workspaces":
        get_workspaces()
    elif argv[1] == "workspace":
        if argc < 3 or not argv[2].isnumeric():
            exit(1)
        workspace = int(math.pow(2, int(argv[2]) - 1))
        change_workspace(str(workspace))

if __name__ == "__main__":
    main(len(sys.argv), sys.argv)
