#!/usr/bin/env python3
import csv

# Add missing data
MISSING_DATA = {
    "H2O": (0, 100),
    "Litmus": (0, 0),
    "Green": (0, 0),
    "Mint": (0, 0),
    "Blue": (0, 0),
    "Purple": (0, 0),
    "Yellow": (0, 0),
    "White": (0, 0),
    "Orange": (0, 0),
    "Acetylene Tetrabromide": (0, 242),
    "Sucrose": (186, 0),
    "Glucose": (146, 0),
    "Sodium Acetate": (324, 0),
    "Sodium Bicarbonate": (50, 0),
    "Potassium Bicarbonate": (292, 0),
    "Ammonium Benzoate": (198, 0),
    "Ammonium Persulfate": (120, 0),
    "Ammonium Sulfamate": (130, 0),
    "Antimony Pentoxide": (450, 0),
    "Arsenic Pentoxide": (315, 0),
    "Barium Peroxide": (450, 0),
    "Bismuth Subnitrate": (260, 0),
    "Cadmium Acetate": (256, 0),
    "Cadmium Cyanide": (150, 0),
    "Cadmium Hydroxide": (150, 0),
    "Calcium Bicarbonate": (100, 0),
    "Chloral Hydrate": (51, 96),
    "Chromium Nitrate": (60, 0),
    "Copper Nitrite": (100, 0),
    "Copper Tartrate": (120, 0),
    "Cresol": (30, 202),
    "Creosol": (35, 221),
    "Decahydronaphthalene": (-43, 194),
    "Deuterium Oxide": (3.8, 101.4),
    "Diallyl Phthalate": (-70, 290),
    "Dibenzyl Ether": (1.8, 298),
    "Dibromobenzene": (87, 219),
    "Dibromochloropropane": (-35, 196),
    "Dichlorophenol": (45, 210),
    "Dichloropropane": (-100, 96),
    "Dichloropropene": (-50, 94),
    "Dicyclopentadiene": (33, 170),
    "Dihexyl Ether": (-43, 226),
    "Dihydroxyacetone": (23, 202),
    "Diisobutyl Ketone": (-46, 168),
    "Dinitrobenzene": (89, 291),
    "Dinitrotoluene": (70, 300),
    "Diborane": (-165.5, -92.5),
    "Boron Tribromide": (-46, 91.7),
    "Boron Trichloride": (-107.3, 12.5),
    "Boron Trifluoride": (-126.7, -99.9),
}

cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
rows = []
with open(cdb_path, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        name = row['Chemical']
        if name in MISSING_DATA:
            mp, bp = MISSING_DATA[name]
            if mp != 0:
                row['Mp'] = str(mp)
            if bp != 0:
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

print("Fixed missing data")

# Verify
with open(cdb_path, 'r') as f:
    reader = csv.DictReader(f)
    has_mp = sum(1 for r in reader if r.get('Mp') and r['Mp'] != '0')
print(f"Total with MP: {has_mp}")
