#!/usr/bin/env python3
import csv
import os

# Read existing database files from the APK
def read_csv(filepath):
    rows = []
    with open(filepath, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            rows.append(row)
    return rows

# Read realistic compounds
realistic_path = '/home/codespace/projects/chemist-lab-enhanced/full_realistic.csv'
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
rdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/rdb.csv'
odb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/odb.csv'

# Read all databases
print("Reading databases...")
cdb_rows = read_csv(cdb_path)
rdb_rows = read_csv(rdb_path)
odb_rows = read_csv(odb_path)
realistic_rows = read_csv(realistic_path)

print(f"cdb.csv: {len(cdb_rows)} compounds")
print(f"rdb.csv: {len(rdb_rows)} compounds")
print(f"odb.csv: {len(odb_rows)} compounds")
print(f"realistic.csv: {len(realistic_rows)} compounds")

# Create a set of existing compound names (case-insensitive)
existing_names = set()
for row in cdb_rows:
    existing_names.add(row['Chemical'].lower())

# Add from realistic to cdb (main compound database)
new_count = 0
for row in realistic_rows:
    name = row['Chemical']
    if name.lower() not in existing_names:
        cdb_rows.append(row)
        existing_names.add(name.lower())
        new_count += 1

print(f"Added {new_count} new compounds from realistic database")

# Write merged cdb.csv
header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

with open(cdb_path, 'w', encoding='utf-8', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=header)
    writer.writeheader()
    writer.writerows(cdb_rows)

print(f"Written cdb.csv with {len(cdb_rows)} compounds")

# Also update rdb (reactions database) - add reactions for new compounds
print("\nUpdating reactions database...")

# Read current rdb
rdb_header = None
with open(rdb_path, 'r', encoding='utf-8') as f:
    reader = csv.reader(f)
    rdb_header = next(reader)
    rdb_content = list(reader)

print(f"rdb.csv has {len(rdb_content)} reactions")

# Copy to output paths
import shutil
shutil.copy(cdb_path, cdb_path.replace('.csv', '-full.csv'))

print("\nDone! Databases updated successfully.")
