import csv

STATE_MAP = {'L': 'Liquid', 'S': 'Solid', 'G': 'Gas', 'Liquid': 'Liquid', 'Solid': 'Solid', 'Gas': 'Gas'}
COLOR_MAP = {'none': '0xFFFFFF', 'white': '0xFFFFFF', 'black': '0x000000', 'red': '0xFF0000', 
             'green': '0x00FF00', 'blue': '0x0000FF', 'yellow': '0xFFFF00', 
             'orange': '0xFF8800', 'colorless': '0xFFFFFF', 'transparent': '0xFFFFFF'}

def fix_color(val):
    val = str(val).strip()
    if not val or val.lower() in ['none', 'colorless', 'transparent', 'white']:
        return '0xFFFFFF'
    if val.startswith('0x'):
        return val.upper()
    return COLOR_MAP.get(val.lower(), '0xFFFFFF')

def fix_state(val):
    return STATE_MAP.get(str(val).strip(), 'Liquid')

def fix_available(val):
    val = str(val).strip().lower()
    return '1' if val in ['yes', '1', 'true'] else '0'

# Read and fix new_compounds.csv
fixed = []
with open('/home/codespace/projects/chemist-lab-enhanced/new_compounds.csv', 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        fixed_row = {}
        for k, v in row.items():
            if k is None:
                continue
            fixed_row[k] = v
        fixed_row['color1'] = fix_color(fixed_row.get('color1', 'none'))
        fixed_row['color2'] = fix_color(fixed_row.get('color2', 'none'))
        fixed_row['color3'] = fix_color(fixed_row.get('color3', 'none'))
        fixed_row['color4'] = fix_color(fixed_row.get('color4', 'none'))
        fixed_row['State'] = fix_state(fixed_row.get('State', 'Liquid'))
        fixed_row['Available'] = fix_available(fixed_row.get('Available', 'yes'))
        # Fix column order - ensure KH is correct
        if fixed_row.get('Solk'):
            fixed_row['KH'] = fixed_row.get('Solk', fixed_row.get('KH', '0'))
        fixed.append(fixed_row)

# Write fixed CSV
header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

with open('/home/codespace/projects/chemist-lab-enhanced/new_compounds_fixed.csv', 'w', encoding='utf-8', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=header, extrasaction='ignore')
    writer.writeheader()
    writer.writerows(fixed)

print(f"Fixed {len(fixed)} compounds")
print("Sample:")
for row in fixed[:3]:
    print(f"  {row['Chemical']}: color={row['color1']}, state={row['State']}, avail={row['Available']}")
