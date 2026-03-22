#!/usr/bin/env python3
import csv

def read_csv(filepath):
    rows = []
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows

realistic_path = '/home/codespace/projects/chemist-lab-enhanced/realistic_colors.csv'
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'

print("Reading databases...")
cdb_rows = read_csv(cdb_path)
realistic_rows = read_csv(realistic_path)

print(f"cdb.csv: {len(cdb_rows)} compounds")
print(f"realistic.csv: {len(realistic_rows)} compounds")

existing_names = {}
for i, row in enumerate(cdb_rows):
    existing_names[row['Chemical'].lower()] = i

updated = 0
added = 0
for rrow in realistic_rows:
    name = rrow['Chemical']
    name_lower = name.lower()
    
    if name_lower in existing_names:
        idx = existing_names[name_lower]
        cdb_rows[idx]['Type'] = rrow['Type']
        cdb_rows[idx]['State'] = rrow['State']
        cdb_rows[idx]['Density1'] = rrow['Density1']
        cdb_rows[idx]['Density2'] = rrow['Density2']
        cdb_rows[idx]['Density3'] = rrow['Density3']
        cdb_rows[idx]['Mm'] = rrow['Mm']
        cdb_rows[idx]['Mp'] = rrow['Mp']
        cdb_rows[idx]['Bp'] = rrow['Bp']
        cdb_rows[idx]['color1'] = rrow['color1']
        cdb_rows[idx]['color2'] = rrow['color1']
        cdb_rows[idx]['color3'] = rrow['color1']
        cdb_rows[idx]['color4'] = rrow['color1']
        updated += 1
    else:
        cdb_rows.append(rrow)
        existing_names[name_lower] = len(cdb_rows) - 1
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
