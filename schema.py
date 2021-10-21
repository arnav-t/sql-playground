#!/usr/bin/python3

SCHEMA_FILE = 'schema.txt'
TAB = '  '
OUTPUT_FILE = 'init.sql'

with open(SCHEMA_FILE, 'r') as f:
  lines = [line.strip() for line in f.readlines()]

def split_cols(line):
  cols = [c.strip() for c in line.split('|')][1:-1]
  return cols

def create_cmd(name, cols):
  cmd = f'CREATE TABLE {name} (\n'
  cmd += ',\n'.join([f'{TAB}{col} {cols[col]}' for col in cols])
  cmd += f'/*,\n{TAB}PRIMARY KEY (col1, col2)*/\n'
  cmd += ');\n\n'
  return cmd

output = ''
n = len(lines)
i = 0
while i < n:
  if not (lines[i].startswith('|') or lines[i].startswith('+') or len(lines[i]) == 0):
    name = lines[i]
    cols = {}
    j = i+4
    while j < n:
      if not (lines[j].startswith('|') or lines[j].startswith('+')):
        break
      if lines[j].startswith('|'):
        col, type = split_cols(lines[j])
        cols[col] = type
      j += 1
    output += create_cmd(name, cols)
    i = j
  i += 1

print(output)
with open(OUTPUT_FILE, 'a') as f:
  f.write(output)
