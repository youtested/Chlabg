import csv
import os

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

def merge_compound_databases():
    header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
              'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
              'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
              'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

    existing = []
    with open('/home/codespace/chlabg_work/decompiled/assets/CSV/cdb.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            existing.append(row)

    existing_chemicals = {row['Chemical'] for row in existing}

    new_compounds = []
    with open('/home/codespace/projects/chemist-lab-enhanced/new_compounds.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            # Fix colors and state
            row['color1'] = fix_color(row.get('color1', 'none'))
            row['color2'] = fix_color(row.get('color2', 'none'))
            row['color3'] = fix_color(row.get('color3', 'none'))
            row['color4'] = fix_color(row.get('color4', 'none'))
            row['State'] = fix_state(row.get('State', 'Liquid'))
            row['Available'] = fix_available(row.get('Available', 'yes'))
            if row['Chemical'] not in existing_chemicals:
                new_compounds.append(row)

    with open('/home/codespace/projects/chemist-lab-enhanced/cdb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=header, extrasaction='ignore')
        writer.writeheader()
        writer.writerows(existing)
        writer.writerows(new_compounds)

    print(f"cdb: {len(existing)} original + {len(new_compounds)} new = {len(existing) + len(new_compounds)} total")

def merge_reaction_databases():
    header = ['Name', 'Speed', 'Reactants', 'Products', 'Modulus', 'Temps', 'States', 'Effects', 'Rek', 'Effect Color', '']

    existing = []
    with open('/home/codespace/chlabg_work/decompiled/assets/CSV/rdb.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        existing = list(reader)

    existing_names = {row['Name'] for row in existing}

    reactions_acid_base = []
    if os.path.exists('/home/codespace/projects/chemist-lab-enhanced/reactions_acid_base.csv'):
        with open('/home/codespace/projects/chemist-lab-enhanced/reactions_acid_base.csv', 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                if row['Name'] not in existing_names:
                    reactions_acid_base.append(row)

    reactions_redox = []
    if os.path.exists('/home/codespace/projects/chemist-lab-enhanced/reactions_redox_precip.csv'):
        with open('/home/codespace/projects/chemist-lab-enhanced/reactions_redox_precip.csv', 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                if row['Name'] not in existing_names:
                    reactions_redox.append(row)

    reactions_organic = []
    if os.path.exists('/home/codespace/projects/chemist-lab-enhanced/reactions_organic_complex.csv'):
        with open('/home/codespace/projects/chemist-lab-enhanced/reactions_organic_complex.csv', 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                if row['Name'] not in existing_names:
                    reactions_organic.append(row)

    with open('/home/codespace/projects/chemist-lab-enhanced/rdb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=header, extrasaction='ignore')
        writer.writeheader()
        for row in existing:
            writer.writerow(row)
        for row in reactions_acid_base + reactions_redox + reactions_organic:
            writer.writerow(row)

    print(f"rdb: {len(existing)} original + {len(reactions_acid_base)+len(reactions_redox)+len(reactions_organic)} new")

def merge_odb_with_elements():
    existing = []
    with open('/home/codespace/chlabg_work/decompiled/assets/CSV/odb.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            if len(row) >= 35:
                existing.append(row)

    existing_chemicals = set()
    for row in existing[1:]:
        if len(row) > 1 and row[1]:
            existing_chemicals.add(row[1])

    new_elements = []
    with open('/home/codespace/projects/chemist-lab-enhanced/new_elements.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            if row.get('Symbol', '') and row['Symbol'] not in existing_chemicals:
                new_elements.append(row)

    header = ['', 'Chemical', 'Type', 'Category', 'Available', 'RName', 'CName', 'DName',
              'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
              'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
              'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

    with open('/home/codespace/projects/chemist-lab-enhanced/odb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(header)
        for row in existing:
            writer.writerow(row[:36] if len(row) >= 36 else row + [''] * (36 - len(row)))
        for elem in new_elements:
            symbol = elem.get('Symbol', '')
            if symbol and symbol not in existing_chemicals:
                mm = float(elem.get('Atomic Mass', 0))
                mp = elem.get('Melting Point', elem.get('Melting Point °C', '0'))
                bp = elem.get('Boiling Point', elem.get('Boiling Point °C', '0'))
                density = elem.get('Density g/cm3', '1')
                state = elem.get('State at Room Temp', 'Solid')
                color_appearance = elem.get('Color Appearance', 'Silver').lower()

                color = '0xC0C0C0'
                if 'gray' in color_appearance or 'grey' in color_appearance:
                    color = '0x808080'
                elif 'white' in color_appearance:
                    color = '0xFFFFFF'
                elif 'yellow' in color_appearance:
                    color = '0xFFFF00'
                elif 'blue' in color_appearance:
                    color = '0x0000FF'
                elif 'green' in color_appearance:
                    color = '0x00FF00'
                elif 'red' in color_appearance:
                    color = '0xFF0000'
                elif 'silver' in color_appearance:
                    color = '0xC0C0C0'
                elif 'brown' in color_appearance:
                    color = '0x8B4513'
                elif 'orange' in color_appearance:
                    color = '0xFF8800'
                elif 'purple' in color_appearance:
                    color = '0x800080'
                elif 'pink' in color_appearance:
                    color = '0xFFC0CB'
                elif 'black' in color_appearance:
                    color = '0x000000'
                elif 'colorless' in color_appearance:
                    color = '0xFFFFFF'

                new_row = ['', symbol, 'Element', 'Periodic Table', '1', symbol, symbol, symbol,
                          density, '1', '0.001', mm, '0', mp, bp, '0',
                          color, '1', color, '1', '0xFFFFFF', '0', '0xFFFFFF', '0',
                          '0.5', '0.15', symbol, symbol, symbol, symbol,
                          '0', '0', '0', '0', '0', '2']
                writer.writerow(new_row)
                existing_chemicals.add(symbol)

    print(f"odb: {len(existing)-1} original + {len(new_elements)} new elements")

if __name__ == '__main__':
    print("Merging chemistry databases...")
    merge_compound_databases()
    merge_reaction_databases()
    merge_odb_with_elements()
    print("\nAll databases merged successfully!")
