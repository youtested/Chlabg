import csv
import os

def merge_all():
    header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
              'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
              'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
              'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

    # Read existing compounds
    existing = []
    with open('/home/codespace/chlabg_work/decompiled/assets/CSV/cdb.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            existing.append(row)

    existing_chemicals = {row['Chemical'] for row in existing}

    # Read new realistic compounds
    new_compounds = []
    with open('/home/codespace/projects/chemist-lab-enhanced/new_compounds_realistic.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row['Chemical'] not in existing_chemicals:
                new_compounds.append(row)

    # Write merged cdb
    with open('/home/codespace/projects/chemist-lab-enhanced/cdb_realistic.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=header, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(existing)
        writer.writerows(new_compounds)

    print(f"cdb: {len(existing)} original + {len(new_compounds)} realistic = {len(existing) + len(new_compounds)} total")

    # Copy other files
    import shutil
    shutil.copy('/home/codespace/chlabg_work/decompiled/assets/CSV/rdb.csv', '/home/codespace/projects/chemist-lab-enhanced/rdb_realistic.csv')
    shutil.copy('/home/codespace/chlabg_work/decompiled/assets/CSV/odb.csv', '/home/codespace/projects/chemist-lab-enhanced/odb_realistic.csv')

    print("Reaction and element databases copied")

if __name__ == '__main__':
    merge_all()
    print("\nRealistic database created!")
