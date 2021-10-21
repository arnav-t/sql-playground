#!/usr/bin/python3

ROWS_FILE = 'rows.txt'
TAB = '  '
OUTPUT_FILE = 'init.sql'

with open(ROWS_FILE, 'r') as f:
  lines = [line.strip() for line in f.readlines()]

def split_cols(line):
  cols = [c.strip() for c in line.split('|')][1:-1]
  return cols

def create_cmd(name, col_names, vals):
  cmd = f'INSERT INTO {name} ({", ".join(col_names)})\n'
  vals = [f"'{val}'" for val in vals]
  cmd += f'{TAB}VALUES ({", ".join(vals)});\n'
  return cmd

output = ''
n = len(lines)
i = 0
while i < n:
  if not (lines[i].startswith('|') or lines[i].startswith('+') or len(lines[i]) == 0):
    name = lines[i]
    col_names = split_cols(lines[i+2])
    j = i+4
    while j < n:
      if not (lines[j].startswith('|') or lines[j].startswith('+')):
        break
      if lines[j].startswith('|'):
        val = split_cols(lines[j])
        output += create_cmd(name, col_names, val)
      j += 1
    i = j
  i += 1

print(output)
with open(OUTPUT_FILE, 'a') as f:
  f.write(output)
