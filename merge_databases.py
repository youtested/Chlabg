#!/usr/bin/env python3
import csv
import os

COLOR_MAP = {
    'white': '0xFFFFFF', 'black': '0x000000', 'red': '0xFF0000',
    'green': '0x00FF00', 'blue': '0x0000FF', 'yellow': '0xFFFF00',
    'purple': '0x800080', 'orange': '0xFF8800', 'pink': '0xFFC0CB',
    'brown': '0x8B4513', 'gray': '0x808080', 'grey': '0x808080',
    'cyan': '0x00FFFF', 'none': '0xFFFFFF'
}

def convert_color(val):
    val = val.strip().lower()
    if not val or val == 'none':
        return '0xFFFFFF'
    if val.startswith('0x'):
        return val.upper()
    return COLOR_MAP.get(val, '0xFFFFFF')

def convert_state(state):
    state = state.strip().upper()
    if state == 'L':
        return 'Liquid'
    elif state == 'S':
        return 'Solid'
    elif state == 'G':
        return 'Gas'
    return state

def convert_available(avail):
    avail = str(avail).strip().lower()
    if avail in ['yes', '1', 'true']:
        return '1'
    return '0'

def convert_new_compound_row(row):
    out = []
    out.append(row['Chemical'])  # Chemical
    out.append(row['Type'])  # Type
    out.append(convert_state(row['State']))  # State
    out.append(convert_available(row['Available']))  # Available
    out.append(row['RName'])  # RName
    out.append(row['CName'])  # CName
    out.append(row['DName'])  # DName
    out.append(row['Density1'])  # Density1
    out.append(row['Density2'])  # Density2
    out.append(row['Density3'])  # Density3
    out.append(row['Mm'])  # Mm
    out.append(row['Sol'])  # Sol
    out.append(row['Mp'])  # Mp
    out.append(row['Bp'])  # Bp
    kh_val = row['KH'] if row.get('KH') else '0'
    out.append(kh_val)  # KH
    out.append(convert_color(row.get('color1', 'none')))  # color1
    out.append(row.get('alpha1', '1'))  # alpha1
    out.append(convert_color(row.get('color2', 'none')))  # color2
    out.append(row.get('alpha2', '1'))  # alpha2
    out.append(convert_color(row.get('color3', 'none')))  # color3
    out.append(row.get('alpha3', '1'))  # alpha3
    out.append(convert_color(row.get('color4', 'none')))  # color4
    out.append(row.get('alpha4', '1'))  # alpha4
    out.append(row.get('friction', '0.5'))  # friction
    out.append(row.get('restitution', '0.15'))  # restitution
    out.append(row.get('JPN', ''))  # JPN
    out.append(row.get('CHN', ''))  # CHN
    out.append(row.get('TW', ''))  # TW
    out.append(row.get('KR', ''))  # KR
    out.append(row.get('Solk', '0'))  # Solk
    out.append(row.get('MOH', '0'))  # MOH
    out.append(row.get('KOH', '0'))  # KOH
    out.append(row.get('MH', '0'))  # MH
    out.append(row.get('KH', '0'))  # KH
    out.append(row.get('PTN', '1'))  # PTN
    return out

def merge_compound_databases():
    header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
              'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
              'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
              'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'KH', 'PTN']

    existing = []
    with open('/tmp/chlabg_work/decompiled/assets/CSV/cdb.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        rows = list(reader)
        header_row = rows[0]
        for row in rows[1:]:
            if len(row) >= len(header_row):
                existing.append(row)

    new_compounds = []
    with open('/home/codespace/projects/chemist-lab-enhanced/new_compounds.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        new_compounds = list(reader)

    existing_chemicals = {row[0] for row in existing}

    with open('/home/codespace/projects/chemist-lab-enhanced/cdb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(header)
        for row in existing:
            if len(row) < len(header):
                row = row + [''] * (len(header) - len(row))
            writer.writerow(row[:len(header)])
        for row in new_compounds:
            if row['Chemical'] not in existing_chemicals:
                converted = convert_new_compound_row(row)
                writer.writerow(converted)

    print(f"Merged cdb: {len(existing)} original + {sum(1 for r in new_compounds if r['Chemical'] not in existing_chemicals)} new = {len(existing) + sum(1 for r in new_compounds if r['Chemical'] not in existing_chemicals)} total")

def merge_reaction_databases():
    header = ['Name', 'Speed', 'Reactants', 'Products', 'Modulus', 'Temps', 'States', 'Effects', 'Rek', 'Effect Color', '']

    existing = []
    with open('/tmp/chlabg_work/decompiled/assets/CSV/rdb.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        existing = list(reader)

    new_reactions = []
    reactions_file = '/home/codespace/projects/chemist-lab-enhanced/reactions_acid_base.csv'
    if os.path.exists(reactions_file):
        with open(reactions_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            new_reactions = list(reader)

    existing_names = {row['Name'] for row in existing}

    with open('/home/codespace/projects/chemist-lab-enhanced/rdb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['Name', 'Speed', 'Reactants', 'Products', 'Modulus', 'Temps', 'States', 'Effects', 'Rek', 'Effect Color', ''])
        for row in existing:
            writer.writerow([row.get(h, '') for h in header[:10]] + [''])
        for row in new_reactions:
            if row['Name'] not in existing_names:
                writer.writerow([row.get(h, '') for h in header[:10]] + [''])

    print(f"Merged rdb: {len(existing)} original + {sum(1 for r in new_reactions if r['Name'] not in existing_names)} new")

def merge_odb_with_elements():
    header = ['', 'Chemical', 'Type', 'Category', 'Available', 'RName', 'CName', 'DName',
             'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
             'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
             'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'KH', 'PTN']

    existing = []
    with open('/tmp/chlabg_work/decompiled/assets/CSV/odb.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            if len(row) >= 35:
                existing.append(row)

    new_elements = []
    with open('/home/codespace/projects/chemist-lab-enhanced/new_elements.csv', 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        new_elements = list(reader)

    existing_chemicals = set()
    for row in existing[1:]:
        if len(row) > 1 and row[1]:
            existing_chemicals.add(row[1])

    with open('/home/codespace/projects/chemist-lab-enhanced/odb_full.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(header)
        for row in existing:
            writer.writerow(row[:36] if len(row) >= 36 else row + [''] * (36 - len(row)))

        for elem in new_elements:
            symbol = elem.get('Symbol', '')
            if symbol and symbol not in existing_chemicals:
                mm = float(elem.get('Atomic Mass', 0))
                mp = elem.get('Melting Point °C', '0')
                bp = elem.get('Boiling Point °C', '0')
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

                new_row = ['', symbol, 'Element', 'Periodic Table', '1', symbol, symbol, symbol,
                          density, '1', '0.001', mm, '0', mp, bp, '0',
                          color, '1', color, '1', '0xFFFFFF', '0', '0xFFFFFF', '0',
                          '0.5', '0.15', symbol, symbol, symbol, symbol,
                          '0', '0', '0', '0', '0', '2']
                writer.writerow(new_row)
                existing_chemicals.add(symbol)

    print(f"Merged odb: {len(existing)-1} original + {sum(1 for e in new_elements if e.get('Symbol','') not in existing_chemicals)} new elements")

def update_cloud_lab_db():
    cloud_reactions = [
        'Methane_O2~CO2-H2O~1-2-1-2~500-1000~BURN3~12~0x00FFFF',
        'Ethane_O2~CO2-H2O~2-3-4-6~500-1000~BURN3~12~0x00FFFF',
        'Propane_O2~CO2-H2O~1-5-3-4~500-1000~BURN3~11~0x00FFFF',
        'Butane_O2~CO2-H2O~2-6-5-8~500-1000~BURN3~11~0x00FFFF',
        'CH3OH_O2~CO2-H2O~2-3-2-4~400-800~BURN3~10~0x00FFFF',
        'C2H5OH_O2~CO2-H2O~1-3-2-3~400-800~BURN3~10~0x00FFFF',
        'C6H6_O2~CO2-H2O~2-15-12-6~500-1000~BURN3~14~0xFFFF00',
        'C6H5CH3_O2~CO2-H2O~1-9-7-8~500-1000~BURN3~13~0xFFFF00',
        'Benzene_O2~CO2-H2O~2-15-12-6~500-1000~BURN3~14~0xFFFF00',
        'Toluene_O2~CO2-H2O~1-9-7-8~500-1000~BURN3~13~0xFFFF00',
        'Glucose_O2~CO2-H2O~1-6-6-6~400-800~BURN3~10~0x00FFFF',
        'Sucrose_O2~CO2-H2O~1-12-11-12~400-800~BURN3~10~0x00FFFF',
    ]

    output_path = '/home/codespace/projects/chemist-lab-enhanced/cloudLabDb_full.txt'

    with open('/tmp/chlabg_work/decompiled/assets/cloudLabDb.txt', 'r', encoding='utf-8') as f:
        content = f.read()

    for reaction in cloud_reactions:
        parts = reaction.split('~')
        if len(parts) >= 6:
            name = parts[0]
            if name not in content:
                content += '\n' + reaction

    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"Updated cloudLabDb with {len(cloud_reactions)} new reaction patterns")

if __name__ == '__main__':
    print("Merging chemistry databases...")
    merge_compound_databases()
    merge_reaction_databases()
    merge_odb_with_elements()
    update_cloud_lab_db()
    print("\nAll databases merged successfully!")
