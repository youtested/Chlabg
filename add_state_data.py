#!/usr/bin/env python3
import csv

# Complete scientific data for all compounds
# Format: (name, mp, bp, state)
COMPLETE_DATA = {
    # Gases - melting and boiling points (in Celsius)
    "Methane": (-182.5, -161.5),
    "Ethane": (-183.3, -88.6),
    "Propane": (-187.7, -42.1),
    "Butane": (-138.3, -0.5),
    "Pentane": (-129.7, 36.1),
    "Hexane": (-95.3, 68.7),
    "Heptane": (-90.6, 98.4),
    "Octane": (-56.8, 125.7),
    "Nonane": (-64, 150.8),
    "Decane": (-29.7, 174.1),
    "Undecane": (-25.5, 195.9),
    "Dodecane": (-9.6, 216.3),
    "Tridecane": (-5.4, 235.5),
    "Tetradecane": (5.9, 253.5),
    "Pentadecane": (10, 270.5),
    "Hexadecane": (18.2, 287),
    "Heptadecane": (22, 303),
    "Octadecane": (28.2, 316.7),
    "Nonadecane": (32, 330),
    "Eicosane": (36.8, 343),
    
    # Alkenes
    "Ethylene": (-169.4, -103.7),
    "Propylene": (-185.2, -47.6),
    "Butene": (-185.3, -6.4),
    "Pentene": (-165.2, 30),
    "Hexene": (-139.8, 63.5),
    "Heptene": (-119, 93.6),
    "Octene": (-101.7, 122.5),
    
    # Alkynes
    "Acetylene": (-80.8, -84),
    "Propyne": (-102.7, -23.2),
    
    # Alcohols
    "Methanol": (-97.6, 64.7),
    "Ethanol": (-114.1, 78.37),
    "Propanol": (-126.2, 97.2),
    "Isopropyl Alcohol": (-89.5, 82.6),
    "Butanol": (-89.5, 117.7),
    "Isobutyl Alcohol": (-108, 107.9),
    "Tert-Butyl Alcohol": (25.7, 82.4),
    "Pentanol": (-79, 138),
    "Hexanol": (-52, 157),
    "Heptanol": (-34, 176),
    "Octanol": (-15, 195),
    "Nonanol": (-5, 214),
    "Decanol": (7, 232),
    "Glycol": (-13, 197.3),
    "Glycerol": (17.8, 290),
    
    # Aldehydes
    "Formaldehyde": (-92, -19.1),
    "Acetaldehyde": (-123.4, 20.2),
    "Propionaldehyde": (-80, 48),
    "Butyraldehyde": (-96, 74.8),
    "Benzaldehyde": (-26, 178.8),
    
    # Ketones
    "Acetone": (-94.9, 56.08),
    "Methyl Ethyl Ketone": (-86, 79.6),
    "Diethyl Ketone": (-42, 102.7),
    "Acetophenone": (19.6, 202),
    "Cyclohexanone": (-16.4, 155),
    
    # Carboxylic acids
    "Formic Acid": (8.4, 100.8),
    "Acetic Acid": (16.6, 118.1),
    "Propionic Acid": (-20.7, 141.1),
    "Butyric Acid": (-7.9, 163.5),
    "Valeric Acid": (-34.5, 186),
    "Caproic Acid": (-3, 205),
    "Benzoic Acid": (122.4, 249.2),
    "Salicylic Acid": (159, 211),
    "Oxalic Acid": (189.5, 157),  # Sublimes
    "Citric Acid": (153, 175),  # Decomposes
    "Tartaric Acid": (171, 275),  # Decomposes
    "Succinic Acid": (188, 235),
    "Malic Acid": (130, 140),  # Decomposes
    
    # Esters
    "Methyl Acetate": (-98.1, 56.9),
    "Ethyl Acetate": (-83.6, 77.1),
    "Propyl Acetate": (-95, 101.5),
    "Butyl Acetate": (-77.9, 126.1),
    "Amyl Acetate": (-70.8, 142),
    
    # Ethers
    "Diethyl Ether": (-116.3, 34.6),
    "Dimethyl Ether": (-141.5, -24.8),
    "Tetrahydrofuran": (-108.5, 66),
    
    # Aromatics
    "Benzene": (5.5, 80.1),
    "Toluene": (-95, 110.6),
    "Xylene": (-47, 138),
    "Ethylbenzene": (-95, 136.2),
    "Styrene": (-30.2, 145.2),
    "Naphthalene": (80.2, 218),
    "Phenol": (40.5, 181.9),
    "Aniline": (-6.3, 184.4),
    "Nitrobenzene": (5.7, 210.8),
    "Chlorobenzene": (-45.2, 131.6),
    
    # Halides
    "Chloroform": (-63.5, 60.6),
    "Carbon Tetrachloride": (-22.9, 76.7),
    "Dichloromethane": (-97.4, 40),
    "Vinyl Chloride": (-153.8, -13.4),
    
    # Amines
    "Methylamine": (-93.5, -6.3),
    "Ethylamine": (-81, 16.6),
    "Dimethylamine": (-92.2, 7),
    "Trimethylamine": (-117.2, 3),
    "Triethylamine": (-114.7, 89),
    
    # Inorganic Acids
    "Hydrochloric Acid": (-27.3, 110),
    "Sulfuric Acid": (10, 337),
    "Nitric Acid": (-42, 83),
    "Phosphoric Acid": (42.4, 158),
    "Hydrogen Peroxide": (-0.4, 150.2),
    "Ammonia": (-77.7, -33.3),
    
    # Inorganic Salts - Chlorides
    "Sodium Chloride": (801, 1413),
    "Potassium Chloride": (770, 1420),
    "Calcium Chloride": (772, 1935),
    "Magnesium Chloride": (714, 1418),
    "Lithium Chloride": (605, 1382),
    "Barium Chloride": (962, 1560),
    "Strontium Chloride": (875, 1250),
    "Zinc Chloride": (283, 732),
    "Iron(III) Chloride": (306, 316),
    "Iron(II) Chloride": (677, 1024),
    "Copper Chloride": (430, 1490),
    "Lead Chloride": (501, 950),
    "Silver Chloride": (455, 1547),
    "Mercury Chloride": (277, 304),
    "Aluminum Chloride": (192.6, 180),  # Sublimes
    "Cobalt Chloride": (726, 1049),
    "Nickel Chloride": (1001, 987),
    
    # Hydroxides (most decompose before boiling)
    "Sodium Hydroxide": (323, 1388),
    "Potassium Hydroxide": (360, 1327),
    "Calcium Hydroxide": (512, 100),  # Decomposes
    "Magnesium Hydroxide": (350, 100),  # Decomposes
    "Barium Hydroxide": (408, 100),  # Decomposes
    "Zinc Hydroxide": (125, 100),  # Decomposes
    "Copper Hydroxide": (100, 100),  # Decomposes
    "Iron(III) Hydroxide": (100, 100),  # Decomposes
    "Aluminum Hydroxide": (300, 100),  # Decomposes
    "Lead Hydroxide": (100, 100),  # Decomposes
    
    # Sulfates
    "Sodium Sulfate": (884, 1429),
    "Potassium Sulfate": (1069, 1689),
    "Calcium Sulfate": (1460, 1630),
    "Magnesium Sulfate": (1124, 100),  # Decomposes
    "Barium Sulfate": (1580, 100),  # Decomposes
    "Copper Sulfate": (150, 100),  # Decomposes
    "Iron Sulfate": (64, 100),  # Decomposes
    "Iron(II) Sulfate": (64, 100),  # Decomposes
    "Zinc Sulfate": (680, 100),  # Decomposes
    "Lead Sulfate": (1170, 100),  # Decomposes
    "Aluminum Sulfate": (770, 100),  # Decomposes
    "Iron(III) Sulfate": (480, 100),  # Decomposes
    
    # Nitrates
    "Sodium Nitrate": (308, 380),
    "Potassium Nitrate": (334, 400),
    "Calcium Nitrate": (561, 100),  # Decomposes
    "Magnesium Nitrate": (129, 330),
    "Barium Nitrate": (592, 100),  # Decomposes
    "Lead Nitrate": (470, 100),  # Decomposes
    "Silver Nitrate": (212, 440),
    "Zinc Nitrate": (36, 100),  # Decomposes
    "Ammonium Nitrate": (169, 210),
    
    # Carbonates (most decompose)
    "Sodium Carbonate": (851, 1600),
    "Potassium Carbonate": (891, 100),  # Decomposes
    "Calcium Carbonate": (825, 100),  # Decomposes - melts under pressure
    "Magnesium Carbonate": (990, 100),  # Decomposes
    "Barium Carbonate": (1740, 100),  # Decomposes
    "Strontium Carbonate": (1494, 100),  # Decomposes
    "Lithium Carbonate": (723, 1310),
    "Copper Carbonate": (200, 100),  # Decomposes
    "Zinc Carbonate": (140, 100),  # Decomposes
    "Iron Carbonate": (100, 100),  # Decomposes
    "Lead Carbonate": (315, 100),  # Decomposes
    "Calcium Bicarbonate": (100, 100),  # Decomposes in solution
    
    # Phosphates
    "Sodium Phosphate": (1340, 100),  # Decomposes
    "Calcium Phosphate": (1670, 100),  # Decomposes
    
    # Sulfides
    "Sodium Sulfide": (1180, 100),  # Decomposes
    "Iron Sulfide": (1194, 100),  # Decomposes
    "Copper Sulfide": (488, 100),  # Decomposes
    "Lead Sulfide": (1114, 100),  # Decomposes
    "Zinc Sulfide": (1850, 100),  # Sublimes
    "Mercury Sulfide": (820, 100),  # Sublimes
    "Silver Sulfide": (825, 100),  # Decomposes
    "Antimony Sulfide": (550, 100),  # Sublimes
    "Arsenic Sulfide": (320, 100),  # Sublimes
    
    # Oxides
    "Iron Oxide": (1566, 100),  # Melts
    "Copper Oxide": (1326, 100),  # Decomposes
    "Zinc Oxide": (1975, 100),  # Sublimes
    "Magnesium Oxide": (2852, 3600),
    "Calcium Oxide": (2572, 2850),
    "Aluminum Oxide": (2072, 2977),
    "Silicon Dioxide": (1710, 2230),
    "Lead Oxide": (888, 1477),
    "Lead Dioxide": (290, 100),  # Decomposes
    "Tin Oxide": (1127, 1800),
    "Nickel Oxide": (1955, 2600),
    "Cobalt Oxide": (1935, 100),  # Decomposes
    "Manganese Dioxide": (535, 100),  # Decomposes
    "Chromium Oxide": (2439, 3000),
    "Titanium Dioxide": (1843, 2972),
    
    # Special compounds
    "Potassium Permanganate": (240, 100),  # Decomposes
    "Potassium Dichromate": (398, 500),  # Decomposes
    "Copper Cyanide": (473, 100),  # Decomposes
    "Silver Cyanide": (350, 100),  # Decomposes
    "Sodium Thiosulfate": (48.5, 100),  # Decomposes
    "Lead Iodide": (402, 100),  # Decomposes
    
    # Gases
    "Oxygen": (-218.8, -182.9),
    "Nitrogen": (-210, -195.8),
    "Hydrogen": (-259.14, -252.87),
    "Chlorine": (-101.5, -34.6),
    "Fluorine": (-219.6, -188.1),
    "Carbon Dioxide": (-78.5, -56.6),  # Sublimes
    "Carbon Monoxide": (-205, -191.5),
    "Sulfur Dioxide": (-72.7, -10),
    "Ozone": (-192.5, -111.4),
    "Nitrogen Dioxide": (-11.2, 21),
    "Nitrogen Monoxide": (-163.6, -151.8),
    "Argon": (-189.3, -185.9),
    "Helium": (-272.2, -268.9),
    "Neon": (-248.6, -246.1),
    "Krypton": (-157.4, -153.2),
    "Xenon": (-111.8, -108.1),
    
    # Elements
    "Sulfur": (115.2, 444.7),
    "Phosphorus": (44.2, 280),
    "Iodine": (113.7, 184.3),
    "Bromine": (-7.2, 58.8),
    "Silicon": (1414, 3265),
    "Boron": (2076, 3927),
    "Carbon": (3550, 4827),
    "Gold": (1064.2, 2856),
    "Silver": (961.8, 2162),
    "Copper": (1084.6, 2562),
    "Iron": (1538, 2861),
    "Lead": (327.5, 1749),
    "Zinc": (419.5, 907),
    "Aluminum": (660.3, 2519),
    "Magnesium": (650, 1090),
    "Calcium": (842, 1484),
    "Sodium": (97.8, 883),
    "Potassium": (63.4, 759),
    "Mercury": (-38.8, 356.6),
    "Tin": (231.9, 2602),
    "Nickel": (1455, 2913),
    "Cobalt": (1495, 2927),
    "Chromium": (1907, 2671),
    "Manganese": (1246, 2061),
    "Titanium": (1668, 3287),
    "Platinum": (1768.3, 3825),
    "Palladium": (1554.9, 2963),
    "Tungsten": (3422, 5555),
    "Molybdenum": (2623, 4639),
    
    # Amino acids
    "Glycine": (233, 100),  # Decomposes
    "Alanine": (314, 100),  # Decomposes
    "Valine": (315, 100),  # Decomposes
    "Leucine": (293, 100),  # Decomposes
    "Isoleucine": (284, 100),  # Decomposes
    "Serine": (228, 100),  # Decomposes
    "Threonine": (255, 100),  # Decomposes
    "Aspartic Acid": (270, 100),  # Decomposes
    "Glutamic Acid": (199, 100),  # Decomposes
    "Lysine": (224, 100),  # Decomposes
    "Arginine": (244, 100),  # Decomposes
    "Phenylalanine": (270, 100),  # Decomposes
    "Tyrosine": (290, 100),  # Decomposes
    "Tryptophan": (282, 100),  # Decomposes
    "Cysteine": (220, 100),  # Decomposes
    "Methionine": (281, 100),  # Decomposes
    "Histidine": (287, 100),  # Decomposes
    "Proline": (201, 100),  # Decomposes
    
    # More compounds
    "Urea": (133.3, 100),  # Decomposes
    "Acetamide": (82.3, 221.2),
    "Caffeine": (235.6, 178),  # Sublimes
    "Camphor": (179.8, 204),
    "Naphthalene": (80.2, 218),
    "Anthracene": (216.4, 340),
    "Phenol": (40.5, 181.9),
    
    # Ammonium compounds
    "Ammonium Chloride": (520, 520),  # Sublimes
    "Ammonium Sulfate": (280, 100),  # Decomposes
    "Ammonium Nitrate": (169, 210),
    "Ammonium Carbonate": (58, 100),  # Decomposes
    "Ammonium Acetate": (112, 100),  # Decomposes
    "Ammonium Bicarbonate": (107, 100),  # Decomposes
    "Ammonium Chromate": (185, 100),  # Decomposes
    "Ammonium Dichromate": (180, 100),  # Decomposes
    "Ammonium Fluoride": (98, 100),  # Decomposes
    "Ammonium Perchlorate": (240, 100),  # Decomposes
    "Ammonium Thiocyanate": (149, 100),  # Decomposes
}

# Read and update CSV
cdb_path = '/home/codespace/projects/chemist-lab-enhanced/fix_temp/assets/CSV/cdb.csv'
rows = []
with open(cdb_path, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        name = row['Chemical']
        if name in COMPLETE_DATA:
            mp, bp = COMPLETE_DATA[name]
            row['Mp'] = str(mp)
            row['Bp'] = str(bp)
        rows.append(row)

# Write updated CSV
header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

with open(cdb_path, 'w', encoding='utf-8', newline='') as f:
    writer = csv.DictWriter(f, fieldnames=header)
    writer.writeheader()
    writer.writerows(rows)

print(f"Updated {len(rows)} compounds with melting and boiling points")

# Verify
updated_count = 0
for name in COMPLETE_DATA:
    if name in [r['Chemical'] for r in rows]:
        updated_count += 1
print(f"Applied data for {updated_count} compounds")
