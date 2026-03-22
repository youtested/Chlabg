#!/usr/bin/env python3
import csv

# Read cdb.csv to get all compound data
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
compounds = {}
with open(cdb_path, 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        name = row['Chemical']
        mp = row.get('Mp', '0') or '0'
        bp = row.get('Bp', '0') or '0'
        mm = row.get('Mm', '0') or '0'
        compounds[name] = {'mp': mp, 'bp': bp, 'mm': mm}

print(f"Loaded {len(compounds)} compounds from cdb.csv")

# Read cloudLabDb.txt and update it
labdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/cloudLabDb.txt'

with open(labdb_path, 'r') as f:
    content = f.read()

lines = content.split('\n')
updated = 0
for i, line in enumerate(lines):
    if not line.strip():
        continue
    
    # Parse the line
    parts = line.split('|')
    if len(parts) < 2:
        continue
    
    # Get the data part (after A| or *| etc)
    prefix = parts[0] + '|'
    rest = '|'.join(parts[1:])
    
    # Split by ~ to get fields
    fields = rest.split('~')
    if len(fields) < 10:
        continue
    
    # Find chemical name (usually first or second field)
    chem_name = fields[0] if fields[0] else ''
    
    # Look for this compound in our database
    for name in compounds:
        if name.lower() == chem_name.lower() or name.replace('(', '').replace(')', '').lower() == chem_name.lower():
            mp = compounds[name]['mp']
            bp = compounds[name]['bp']
            
            # Update melting and boiling points in the correct position
            # Based on the format, positions vary - let's find and update them
            # The format seems to be: formula~name~number~density1~density2~~Mp~Bp~Mm~
            if len(fields) > 7:
                # Try to update Mp (usually around position 6-8)
                try:
                    # Find the Mp field (usually right before molecular weight)
                    for j in range(len(fields)):
                        if j > 2 and j < len(fields) - 3:
                            try:
                                val = float(fields[j])
                                if -300 < val < 5000:  # Looks like a temperature
                                    fields[j] = mp
                                    updated += 1
                                    break
                            except:
                                pass
                except:
                    pass
            
            lines[i] = prefix + '~'.join(fields)
            break

# Write updated content
with open(labdb_path, 'w') as f:
    f.write('\n'.join(lines))

print(f"Updated {updated} entries")
