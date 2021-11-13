#!/usr/bin/python3

buffer = ''

while table := input('Table Name? '):
    buffer += f'{table}\n+\n|\n+\n'
    while column := input('Column? '):
        ctype = input('Type? ')
        buffer += f'| {column} | {ctype} |\n'
    buffer += '+\n\n'

if buffer:
    with open('schema.txt', 'w') as f:
        f.write(buffer)

