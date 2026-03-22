#!/usr/bin/env python3
import csv

# Fix remaining missing data
MISSING_DATA = {
    "H2O": (0, 100),
    "Litmus": (200, 0),
    "Green": (0, 0),
    "Mint": (0, 0),
    "Blue": (0, 0),
    "Purple": (0, 0),
    "Yellow": (0, 0),
    "White": (0, 0),
    "Orange": (0, 0),
    "Acetylene Tetrabromide": (46, 242),
    "Beryllium Hydroxide": (100, 0),
    "Chromium Acetate": (0, 0),
    "Chromium Sulfate": (0, 0),
    "Cobalt Acetate": (0, 0),
    "Cobalt Carbonate": (0, 0),
    "Cobalt Hydroxide": (0, 0),
    "Cobalt Iodide": (0, 0),
    "Cobalt Sulfide": (0, 0),
    "Cobalt Thiocyanate": (0, 0),
    "Copper Acetate": (0, 0),
    "Copper Gluconate": (0, 0),
    "Dimethyl Phthalate": (0, 284),
    "Nickel Acetate": (0, 0),
    "Nickel Carbonate": (0, 0),
    "Nickel Hydroxide": (0, 0),
    "Lead Thiocyanate": (0, 0),
    "Silver Nitrite": (0, 0),
    "Silver Perchlorate": (0, 0),
    "Silver Sulfite": (0, 0),
    "Silver Thiosulfate": (0, 0),
}

cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
rows = []
with open(cdb_path, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        name = row['Chemical']
        if name in MISSING_DATA:
            mp, bp = MISSING_DATA[name]
            if row['Mp'] == '0' or row['Mp'] == '':
                row['Mp'] = str(mp)
            if row['Bp'] == '0' or row['Bp'] == '':
                row['Bp'] = str(bp)
        rows.append(row)

header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

with open(cdb_path, 'w', encoding='utf-8', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=header)
    writer.writeheader()
    writer.writerows(rows)

# Verify
missing = 0
with open(cdb_path, 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        if not row.get('Mp') or row['Mp'] == '0':
            missing += 1

print(f"Fixed! Now missing: {missing}")
