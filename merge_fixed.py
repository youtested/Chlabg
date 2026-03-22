#!/usr/bin/env python3
import csv
import os

def read_csv(filepath):
    rows = []
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows

realistic_path = '/home/codespace/projects/chemist-lab-enhanced/full_realistic.csv'
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
rdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/rdb.csv'

print("Reading databases...")
cdb_rows = read_csv(cdb_path)
realistic_rows = read_csv(realistic_path)

print(f"cdb.csv: {len(cdb_rows)} compounds")
print(f"realistic.csv: {len(realistic_rows)} compounds")

existing_names = set()
for row in cdb_rows:
    existing_names.add(row['Chemical'].lower())

updated = 0
added = 0
for rrow in realistic_rows:
    name = rrow['Chemical']
    found = False
    for crow in cdb_rows:
        if crow['Chemical'].lower() == name.lower():
            crow['Type'] = rrow['Type']
            crow['State'] = rrow['State']
            crow['Density1'] = rrow['Density1']
            crow['Density2'] = rrow['Density2']
            crow['Density3'] = rrow['Density3']
            crow['Mm'] = rrow['Mm']
            crow['Mp'] = rrow['Mp']
            crow['Bp'] = rrow['Bp']
            crow['color1'] = rrow['color1']
            crow['RName'] = rrow['RName']
            crow['CName'] = rrow['CName']
            crow['DName'] = rrow['DName']
            found = True
            updated += 1
            break
    if not found:
        cdb_rows.append(rrow)
        added += 1

print(f"Updated {updated} compounds with realistic data")
print(f"Added {added} new compounds")

header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

with open(cdb_path, 'w', encoding='utf-8', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=header)
    writer.writeheader()
    writer.writerows(cdb_rows)

print(f"Written cdb.csv with {len(cdb_rows)} compounds")

states = {}
for row in cdb_rows:
    state = row.get('Type', 'N/A')
    states[state] = states.get(state, 0) + 1
print("State distribution:")
for k, v in sorted(states.items()):
    print(f"  {k}: {v}")
