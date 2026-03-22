#!/usr/bin/env python3
import csv

def read_csv(filepath):
    rows = []
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows

transparent_path = '/home/codespace/projects/chemist-lab-enhanced/transparent_colors.csv'
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'

print("Reading databases...")
cdb_rows = read_csv(cdb_path)
transparent_rows = read_csv(transparent_path)

print(f"cdb.csv: {len(cdb_rows)} compounds")
print(f"transparent.csv: {len(transparent_rows)} compounds")

existing_names = {}
for i, row in enumerate(cdb_rows):
    existing_names[row['Chemical'].lower()] = i

updated = 0
added = 0
for trow in transparent_rows:
    name = trow['Chemical']
    name_lower = name.lower()
    
    if name_lower in existing_names:
        idx = existing_names[name_lower]
        cdb_rows[idx]['Type'] = trow['Type']
        cdb_rows[idx]['State'] = trow['State']
        cdb_rows[idx]['Density1'] = trow['Density1']
        cdb_rows[idx]['Density2'] = trow['Density2']
        cdb_rows[idx]['Density3'] = trow['Density3']
        cdb_rows[idx]['Mm'] = trow['Mm']
        cdb_rows[idx]['Mp'] = trow['Mp']
        cdb_rows[idx]['Bp'] = trow['Bp']
        cdb_rows[idx]['color1'] = trow['color1']
        cdb_rows[idx]['alpha1'] = trow['alpha1']
        cdb_rows[idx]['color2'] = trow['color2']
        cdb_rows[idx]['alpha2'] = trow['alpha2']
        cdb_rows[idx]['color3'] = trow['color3']
        cdb_rows[idx]['alpha3'] = trow['alpha3']
        cdb_rows[idx]['color4'] = trow['color4']
        cdb_rows[idx]['alpha4'] = trow['alpha4']
        updated += 1
    else:
        cdb_rows.append(trow)
        existing_names[name_lower] = len(cdb_rows) - 1
        added += 1

print(f"Updated {updated} compounds with transparent colors")
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
