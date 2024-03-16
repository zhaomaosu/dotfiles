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


def is_data_duplicated(compile_commands: list[dict[str, str]], data: str) -> bool:
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

for index, arg in enumerate(sys.argv[1:]):
    if is_valid_file(arg):
        if sys.argv[index] != '-c':
            print("not a compile command")
            exit(0)
        dir = os.getcwd()
        file = os.path.abspath(arg)
        data = {'directory': dir, 'command': command, 'file': file}
        if not is_data_duplicated(compile_commands, file):
            compile_commands.append(data)
        break

with open(db_file_name, 'w') as file:
    json.dump(compile_commands, file, sort_keys=False, indent=4)
