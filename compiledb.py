#!/usr/bin/env python3
import json
import os
import subprocess
import sys


def is_valid_file(file_name: str) -> bool:
    if os.path.exists(file_name):
        _, ext = os.path.splitext(file_name)
        if ext.lower() == '.c' or ext.lower() == '.cpp' or ext.lower() == '.cc':
            return True
    return False


def is_data_duplicated(
        compile_commands: list[dict[str, str]],
        data: str) -> bool:
    for item in compile_commands:
        if data == item['file']:
            return True
    return False


command = ' '.join(sys.argv[1:])
res = subprocess.run(command, shell=True, env=os.environ)

if res.returncode != 0:
    exit(res.returncode)

db_file_name = 'compile_commands.json'

if os.path.exists(db_file_name):
    with open(db_file_name, 'r') as file:
        compile_commands = json.load(file)
else:
    compile_commands = []

generated_command = []
command_to_remove = []
dir = ''
file = ''
for index, arg in enumerate(sys.argv[1:]):
    if arg == '-o':
        command_to_remove.append(arg)
        command_to_remove.append(sys.argv[index + 2])
    if is_valid_file(arg):
        if generated_command[index - 1] != '-c':
            generated_command.append('-c')
        dir = os.getcwd()
        file = os.path.abspath(arg)
    generated_command.append(arg)

# remove output related commands
for cmd in command_to_remove:
    generated_command.remove(cmd)

# append new generated command to compile commands data file
generated_command = ' '.join(generated_command)
data = {'directory': dir, 'command': generated_command, 'file': file}
if not is_data_duplicated(compile_commands, file):
    compile_commands.append(data)

with open(db_file_name, 'w') as file:
    json.dump(compile_commands, file, sort_keys=False, indent=4)
