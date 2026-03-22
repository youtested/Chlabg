#!/usr/bin/env python3
import csv

header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
          'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
          'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
          'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']

# Format: (name, state, mm, mp, bp, density, color, alpha)
# Colors with lower alpha = more transparent
# GASES - Most are colorless, so we use light tints with transparency
COMPOUNDS = [
    # Pure gases - use transparent light blue/cyan with transparency
    ("Methane", "Gas", 16.04, -182.5, -161.5, 0.668, "0x87CEEB", 0.6),
    ("Ethane", "Gas", 30.07, -183.3, -88.6, 1.265, "0x87CEEB", 0.6),
    ("Propane", "Gas", 44.09, -187.7, -42.1, 1.867, "0x87CEEB", 0.6),
    ("Butane", "Gas", 58.12, -138.3, -0.5, 2.493, "0x87CEEB", 0.6),
    ("Pentane", "Gas", 72.15, -129.7, 36.1, 0.626, "0x87CEEB", 0.6),
    ("Ethylene", "Gas", 28.05, -169.4, -103.7, 0.001, "0xB0E0E6", 0.6),
    ("Propylene", "Gas", 42.08, -185.2, -47.6, 0.001, "0xB0E0E6", 0.6),
    ("Butene", "Gas", 56.11, -185.3, -6.4, 0.001, "0xB0E0E6", 0.6),
    ("Acetylene", "Gas", 26.04, -80.8, -84, 0.001, "0xADD8E6", 0.6),
    ("Propyne", "Gas", 40.06, -102.7, -23.2, 0.001, "0xADD8E6", 0.6),
    # Real colored gases - more opaque
    ("Oxygen", "Gas", 32, -218.8, -182.9, 0.001, "0xADD8E6", 0.7),
    ("Nitrogen", "Gas", 28.02, -210, -195.8, 0.001, "0xE0FFFF", 0.5),
    ("Hydrogen", "Gas", 2.02, -259.14, -252.87, 0.001, "0xFFFFFF", 0.3),
    ("Chlorine", "Gas", 70.9, -101.5, -34.6, 0.003, "0xADFF2F", 0.8),
    ("Fluorine", "Gas", 38, -219.6, -188.1, 0.002, "0xFFFACD", 0.7),
    ("Carbon Dioxide", "Gas", 44.01, -78.5, -56.6, 0.001, "0xF0FFFF", 0.4),
    ("Carbon Monoxide", "Gas", 28.01, -205, -191.5, 0.001, "0xE8F4F8", 0.4),
    ("Sulfur Dioxide", "Gas", 64.07, -72.7, -10, 0.003, "0xFFF8DC", 0.6),
    ("Ozone", "Gas", 48, -192.5, -111.4, 0.002, "0xB0E0E6", 0.7),
    ("Nitrogen Dioxide", "Gas", 46.01, -11.2, 21, 0.002, "0xFF6347", 0.9),
    ("Nitrogen Monoxide", "Gas", 30.01, -163.6, -151.8, 0.001, "0xD3D3D3", 0.5),
    ("Argon", "Gas", 39.95, -189.3, -185.9, 0.001, "0xE8F4F8", 0.4),
    ("Diborane", "Gas", 27.67, -165.5, -92.5, 0.001, "0xE8F4F8", 0.5),
    ("Cyanogen", "Gas", 52.03, -27.9, -21.2, 0.002, "0xE8F4F8", 0.5),
    ("Cyanogen Chloride", "Gas", 61.47, -6.5, 13.1, 0.001, "0xE8F4F8", 0.6),
    ("Boron Tribromide", "Gas", 250.52, -46, 91.7, 0.003, "0xD2B48C", 0.7),
    ("Boron Trichloride", "Gas", 117.17, -107.3, 12.5, 0.005, "0xE8F4F8", 0.5),
    ("Boron Trifluoride", "Gas", 67.81, -126.7, -99.9, 0.003, "0xE8F4F8", 0.4),
    ("Bromomethane", "Gas", 94.94, -93.7, 3.6, 0.003, "0xD3D3D3", 0.6),
    ("Chloroethane", "Gas", 64.51, -138.4, 12.3, 0.002, "0xE8F4F8", 0.5),
    ("Chloroethylene", "Gas", 62.5, -153.8, -13.4, 0.002, "0xE8F4F8", 0.5),
    ("Chloromethane", "Gas", 50.49, -97.6, -24.1, 0.002, "0xE8F4F8", 0.5),
    ("Chlorine Dioxide", "Gas", 67.45, -59, 11, 0.003, "0xFFD700", 0.8),
    ("Chlorine Trifluoride", "Gas", 92.45, -76.3, 11.8, 0.004, "0xFFFACD", 0.8),
    ("Dimethyl Ether", "Gas", 46.07, -141.5, -24.8, 0.002, "0xE8F4F8", 0.5),
    ("Ethyl Chloride", "Gas", 64.51, -138.4, 12.3, 0.002, "0xE8F4F8", 0.5),
    ("Ethyl Nitrite", "Gas", 75.07, -50, 17.2, 0.9, "0xE8F4F8", 0.6),
    ("Ethylene Oxide", "Gas", 44.05, -111.3, 10.6, 0.001, "0xE8F4F8", 0.5),
    ("Deuterium", "Gas", 4.03, -254.5, -249.7, 0.001, "0xFFFFFF", 0.3),
    ("Butadiene", "Gas", 54.09, -109, -4.4, 0.001, "0xE8F4F8", 0.5),
    ("Formaldehyde", "Gas", 30.03, -92, -19.1, 0.815, "0xE8F4F8", 0.6),
    ("Methylamine", "Gas", 31.06, -93.5, -6.3, 0.001, "0xE8F4F8", 0.5),
    ("Dimethylamine", "Gas", 45.08, -92.2, 7, 0.001, "0xE8F4F8", 0.5),
    ("Trimethylamine", "Gas", 59.11, -117.2, 3, 0.001, "0xE8F4F8", 0.5),
    ("Vinyl Chloride", "Gas", 62.5, -153.8, -13.4, 0.002, "0xE8F4F8", 0.5),
    
    # LIQUIDS - use transparent tints
    # Alkanes - transparent colorless (slight blue tint)
    ("Hexane", "Liquid", 86.18, -95.3, 68.7, 0.659, "0xE0F7FA", 0.4),
    ("Heptane", "Liquid", 100.2, -90.6, 98.4, 0.684, "0xE0F7FA", 0.4),
    ("Octane", "Liquid", 114.23, -56.8, 125.7, 0.703, "0xE0F7FA", 0.4),
    ("Nonane", "Liquid", 128.25, -64, 150.8, 0.718, "0xE0F7FA", 0.4),
    ("Decane", "Liquid", 142.29, -29.7, 174.1, 0.73, "0xE0F7FA", 0.4),
    ("Undecane", "Liquid", 156.31, -25.5, 195.9, 0.74, "0xE0F7FA", 0.4),
    ("Dodecane", "Liquid", 170.33, -9.6, 216.3, 0.75, "0xE0F7FA", 0.4),
    ("Tridecane", "Liquid", 184.36, -5.4, 235.5, 0.76, "0xE0F7FA", 0.4),
    ("Tetradecane", "Liquid", 198.39, 5.9, 253.5, 0.76, "0xE0F7FA", 0.4),
    ("Pentadecane", "Liquid", 212.41, 10, 270.5, 0.77, "0xE0F7FA", 0.4),
    ("Hexadecane", "Liquid", 226.44, 18.2, 287, 0.77, "0xE0F7FA", 0.4),
    ("Heptadecane", "Liquid", 240.46, 22, 303, 0.77, "0xE0F7FA", 0.4),
    ("Octadecane", "Liquid", 254.49, 28.2, 316.7, 0.78, "0xE0F7FA", 0.4),
    ("Nonadecane", "Liquid", 268.52, 32, 330, 0.78, "0xE0F7FA", 0.4),
    ("Eicosane", "Liquid", 282.55, 36.8, 343, 0.79, "0xE0F7FA", 0.4),
    # Alkenes
    ("Pentene", "Liquid", 70.13, -165.2, 30, 0.64, "0xE0F7FA", 0.4),
    ("Hexene", "Liquid", 84.16, -139.8, 63.5, 0.67, "0xE0F7FA", 0.4),
    ("Heptene", "Liquid", 98.19, -119, 93.6, 0.7, "0xE0F7FA", 0.4),
    ("Octene", "Liquid", 112.21, -101.7, 122.5, 0.71, "0xE0F7FA", 0.4),
    
    # Alcohols - slight amber/yellow tint (like real alcohol)
    ("Methanol", "Liquid", 32.04, -97.6, 64.7, 0.792, "0xFFF8DC", 0.3),
    ("Ethanol", "Liquid", 46.07, -114.1, 78.37, 0.789, "0xFFF8DC", 0.3),
    ("Propanol", "Liquid", 60.1, -126.2, 97.2, 0.804, "0xFFF8DC", 0.3),
    ("Isopropyl Alcohol", "Liquid", 60.1, -89.5, 82.6, 0.786, "0xFFF8DC", 0.3),
    ("Butanol", "Liquid", 74.12, -89.5, 117.7, 0.81, "0xFFF8DC", 0.35),
    ("Isobutyl Alcohol", "Liquid", 74.12, -108, 107.9, 0.802, "0xFFF8DC", 0.35),
    ("Tert-Butyl Alcohol", "Liquid", 74.12, 25.7, 82.4, 0.786, "0xFFF8DC", 0.35),
    ("Pentanol", "Liquid", 88.15, -79, 138, 0.81, "0xFFF8DC", 0.4),
    ("Hexanol", "Liquid", 102.17, -52, 157, 0.82, "0xFFF8DC", 0.4),
    ("Heptanol", "Liquid", 116.2, -34, 176, 0.82, "0xFFF8DC", 0.4),
    ("Octanol", "Liquid", 130.23, -15, 195, 0.83, "0xFFF8DC", 0.4),
    ("Nonanol", "Liquid", 144.25, -5, 214, 0.83, "0xFFF8DC", 0.4),
    ("Decanol", "Liquid", 158.28, 7, 232, 0.83, "0xFFF8DC", 0.4),
    ("Glycol", "Liquid", 62.07, -13, 197.3, 1.11, "0xFFF8DC", 0.4),
    ("Glycerol", "Liquid", 92.09, 17.8, 290, 1.261, "0xFFF8DC", 0.5),
    ("Allyl Alcohol", "Liquid", 58.08, -129, 97, 0.854, "0xFFF8DC", 0.35),
    ("Ethanolamine", "Liquid", 61.08, 10.3, 171, 1.02, "0xFFF8DC", 0.4),
    ("Diethanolamine", "Liquid", 105.14, 28, 269, 1.09, "0xFFF8DC", 0.5),
    ("Ethylene Glycol", "Liquid", 62.07, -13, 197.3, 1.11, "0xFFF8DC", 0.4),
    ("Diethylene Glycol", "Liquid", 106.12, -8, 245, 1.12, "0xFFF8DC", 0.4),
    
    # Ketones - transparent
    ("Acetone", "Liquid", 58.08, -94.9, 56.08, 0.784, "0xF5F5F5", 0.25),
    ("Methyl Ethyl Ketone", "Liquid", 72.11, -86, 79.6, 0.8, "0xF5F5F5", 0.25),
    ("Diethyl Ketone", "Liquid", 86.13, -42, 102.7, 0.81, "0xF5F5F5", 0.25),
    ("Acetophenone", "Liquid", 120.15, 19.6, 202, 1.03, "0xFFFACD", 0.4),
    ("Cyclohexanone", "Liquid", 98.14, -16.4, 155, 0.95, "0xF5F5F5", 0.3),
    
    # Carboxylic acids - transparent
    ("Formic Acid", "Liquid", 46.03, 8.4, 100.8, 1.22, "0xF5F5F5", 0.3),
    ("Acetic Acid", "Liquid", 60.05, 16.6, 118.1, 1.049, "0xF5F5F5", 0.3),
    ("Propionic Acid", "Liquid", 74.08, -20.7, 141.1, 0.99, "0xF5F5F5", 0.3),
    ("Butyric Acid", "Liquid", 88.11, -7.9, 163.5, 0.964, "0xF5F5F5", 0.3),
    ("Valeric Acid", "Liquid", 102.13, -34.5, 186, 0.939, "0xF5F5F5", 0.3),
    ("Caproic Acid", "Liquid", 116.16, -3, 205, 0.93, "0xF5F5F5", 0.35),
    
    # Esters - transparent fruity colors
    ("Methyl Acetate", "Liquid", 74.08, -98.1, 56.9, 0.93, "0xF0F8FF", 0.3),
    ("Ethyl Acetate", "Liquid", 88.11, -83.6, 77.1, 0.9, "0xF0F8FF", 0.3),
    ("Propyl Acetate", "Liquid", 102.13, -95, 101.5, 0.89, "0xF0F8FF", 0.3),
    ("Butyl Acetate", "Liquid", 116.16, -77.9, 126.1, 0.88, "0xF0F8FF", 0.3),
    ("Amyl Acetate", "Liquid", 130.18, -70.8, 142, 0.87, "0xF0F8FF", 0.35),
    ("Ethyl Acrylate", "Liquid", 100.12, -71.2, 99.4, 0.92, "0xF0F8FF", 0.3),
    ("Butyl Acrylate", "Liquid", 128.17, -64.6, 145.4, 0.9, "0xF0F8FF", 0.35),
    ("Ethyl Butyrate", "Liquid", 116.16, -93.2, 121, 0.88, "0xF0F8FF", 0.3),
    ("Ethyl Propionate", "Liquid", 102.13, -73.9, 99.1, 0.89, "0xF0F8FF", 0.3),
    
    # Ethers - transparent
    ("Diethyl Ether", "Liquid", 74.12, -116.3, 34.6, 0.71, "0xF8F8FF", 0.2),
    ("Tetrahydrofuran", "Liquid", 72.11, -108.5, 66, 0.89, "0xF8F8FF", 0.25),
    ("Dioxane", "Liquid", 88.11, 11.8, 101, 1.03, "0xF8F8FF", 0.3),
    ("Diisopropyl Ether", "Liquid", 102.17, -85.5, 68.5, 0.73, "0xF8F8FF", 0.25),
    ("Dibutyl Ether", "Liquid", 130.23, -95.2, 141, 0.77, "0xF8F8FF", 0.3),
    ("Diglyme", "Liquid", 134.17, -68, 162, 0.94, "0xF8F8FF", 0.3),
    
    # Aromatics - slight yellow/brown tint
    ("Benzene", "Liquid", 78.11, 5.5, 80.1, 0.879, "0xFFFEF0", 0.25),
    ("Toluene", "Liquid", 92.14, -95, 110.6, 0.867, "0xFFFEF0", 0.25),
    ("Xylene", "Liquid", 106.16, -47, 138, 0.86, "0xFFFEF0", 0.25),
    ("Ethylbenzene", "Liquid", 106.16, -95, 136.2, 0.87, "0xFFFEF0", 0.25),
    ("Styrene", "Liquid", 104.15, -30.2, 145.2, 0.906, "0xFFFEF0", 0.3),
    ("Cumene", "Liquid", 120.19, -96, 152.4, 0.86, "0xFFFEF0", 0.3),
    ("Cyclohexane", "Liquid", 84.16, 6.5, 80.7, 0.779, "0xE8F4F8", 0.3),
    ("Cyclopentane", "Liquid", 70.13, -93.9, 49.3, 0.75, "0xE8F4F8", 0.3),
    ("Decalin", "Liquid", 138.25, -43, 194, 0.88, "0xE8F4F8", 0.35),
    
    # Colored liquids - more opaque
    ("Aniline", "Liquid", 93.13, -6.3, 184.4, 1.022, "0x8B4513", 0.8),
    ("Nitrobenzene", "Liquid", 123.11, 5.7, 210.8, 1.2, "0xFFD700", 0.85),
    ("Bromine", "Liquid", 159.81, -7.2, 58.8, 3.12, "0x8B0000", 0.95),
    ("Bromine Pentafluoride", "Liquid", 149.9, -61.3, 40.3, 2.47, "0xCD5C5C", 0.9),
    ("Furfural", "Liquid", 96.08, -38.7, 161.7, 1.16, "0xDAA520", 0.8),
    ("Aqua Regia", "Liquid", 140, -42, 110, 1.12, "0xFFA500", 0.7),
    ("Chromic Acid", "Liquid", 118, -20, 196, 1.35, "0xFF4500", 0.85),
    
    # Acids - transparent
    ("Hydrochloric Acid", "Liquid", 36.46, -27.3, 110, 1.18, "0xF0FFFF", 0.35),
    ("Sulfuric Acid", "Liquid", 98.08, 10, 337, 1.84, "0xFFFEF0", 0.5),
    ("Nitric Acid", "Liquid", 63.01, -42, 83, 1.51, "0xFFF0F0", 0.5),
    ("Phosphoric Acid", "Liquid", 98, 42.4, 158, 1.88, "0xF8F8FF", 0.5),
    ("Hydrogen Peroxide", "Liquid", 34.01, -0.4, 150.2, 1.45, "0xADD8E6", 0.4),
    ("Ammonia", "Liquid", 17.03, -77.7, -33.3, 0.73, "0xADD8E6", 0.4),
    ("Deuterium Oxide", "Liquid", 20.03, 3.8, 101.4, 1.11, "0xADD8E6", 0.4),
    
    # More liquids
    ("Acetaldehyde", "Liquid", 44.05, -123.4, 20.2, 0.78, "0xF5F5F5", 0.3),
    ("Propionaldehyde", "Liquid", 58.08, -80, 48, 0.81, "0xF5F5F5", 0.3),
    ("Butyraldehyde", "Liquid", 72.11, -96, 74.8, 0.8, "0xF5F5F5", 0.3),
    ("Benzaldehyde", "Liquid", 106.12, -26, 178.8, 1.04, "0xFFFEF0", 0.35),
    ("Acrolein", "Liquid", 56.06, -87, 52.7, 0.84, "0xF5F5F5", 0.3),
    ("Acetone Cyanohydrin", "Liquid", 85.09, -20, 82, 0.93, "0xF5F5F5", 0.4),
    ("Acetyl Chloride", "Liquid", 78.5, -112, 50.9, 1.1, "0xF5F5F5", 0.35),
    ("Chloroform", "Liquid", 119.38, -63.5, 60.6, 1.48, "0xF8F8FF", 0.4),
    ("Carbon Tetrachloride", "Liquid", 153.82, -22.9, 76.7, 1.594, "0xF8F8FF", 0.4),
    ("Dichloromethane", "Liquid", 84.93, -97.4, 40, 1.33, "0xF8F8FF", 0.35),
    ("Ethylamine", "Liquid", 45.08, -81, 16.6, 0.69, "0xADD8E6", 0.35),
    ("Triethylamine", "Liquid", 101.19, -114.7, 89, 0.73, "0xF0F8FF", 0.3),
    ("Acetonitrile", "Liquid", 41.05, -43.8, 81.6, 0.79, "0xF8F8FF", 0.25),
    ("Acrylonitrile", "Liquid", 101.07, -83.5, 77.3, 0.81, "0xF8F8FF", 0.25),
    ("Cyclohexanol", "Liquid", 100.16, 25.9, 161.1, 0.96, "0xFFFEF0", 0.4),
    ("Dimethyl Sulfoxide", "Liquid", 78.13, 18.5, 189, 1.1, "0xF8F8FF", 0.4),
    ("Dimethyl Formamide", "Liquid", 73.09, -60.4, 153, 0.94, "0xF8F8FF", 0.3),
    ("Dimethyl Acetamide", "Liquid", 87.12, -20, 165, 0.94, "0xF8F8FF", 0.3),
    
    # Halides
    ("Chloroethane", "Liquid", 64.51, -138.4, 12.3, 0.002, "0xF8F8FF", 0.3),
    ("Bromoethane", "Liquid", 108.97, -118.6, 38.4, 1.46, "0xFFFEF0", 0.4),
    ("Iodoethane", "Liquid", 155.97, -108, 72.4, 1.95, "0xFFFEF0", 0.45),
    ("Chlorobenzene", "Liquid", 112.56, -45.2, 131.6, 1.11, "0xFFFEF0", 0.4),
    ("Benzyl Chloride", "Liquid", 126.58, -39, 179.4, 1.1, "0xFFFEF0", 0.4),
    ("Benzoyl Chloride", "Liquid", 140.57, -1, 197.2, 1.21, "0xFFFEF0", 0.4),
    ("Ethyl Chloroacetate", "Liquid", 122.55, -26, 144, 1.15, "0xF8F8FF", 0.35),
    ("Ethyl Iodide", "Liquid", 155.97, -108, 72.4, 1.95, "0xFFFEF0", 0.45),
    ("Ethylene Dichloride", "Liquid", 98.96, -35.7, 83.5, 1.25, "0xF8F8FF", 0.35),
    ("Dichloroethane", "Liquid", 98.96, -35.7, 83.5, 1.25, "0xF8F8FF", 0.35),
    
    # SOLIDS - Inorganic salts with transition metal colors
    ("Sodium Chloride", "Solid", 58.44, 801, 1413, 2.165, "0xFFFFFF", 1.0),
    ("Potassium Chloride", "Solid", 74.55, 770, 1420, 1.984, "0xFFFFFF", 1.0),
    ("Calcium Chloride", "Solid", 110.98, 772, 1935, 2.15, "0xF5F5F5", 1.0),
    ("Magnesium Chloride", "Solid", 95.21, 714, 1418, 2.32, "0xFFFFFF", 1.0),
    ("Lithium Chloride", "Solid", 42.39, 605, 1382, 2.07, "0xFFFFFF", 1.0),
    ("Barium Chloride", "Solid", 208.23, 962, 1560, 3.86, "0xFFFFFF", 1.0),
    ("Strontium Chloride", "Solid", 158.53, 875, 1250, 3.05, "0xFFFFFF", 1.0),
    ("Zinc Chloride", "Solid", 136.29, 283, 732, 2.91, "0xFFFFFF", 1.0),
    
    # Iron compounds - Fe3+ is yellow/brown, Fe2+ is green
    ("Iron(III) Chloride", "Solid", 162.2, 306, 316, 2.9, "0xD4A017", 1.0),
    ("Iron(II) Chloride", "Solid", 126.75, 677, 1024, 3.16, "0x90EE90", 1.0),
    ("Copper Chloride", "Solid", 134.45, 430, 1490, 3.39, "0x4169E1", 1.0),
    ("Lead Chloride", "Solid", 278.1, 501, 950, 5.85, "0xFFFFFF", 1.0),
    ("Silver Chloride", "Solid", 143.32, 455, 1547, 5.56, "0xFFFFE0", 1.0),
    ("Mercury Chloride", "Solid", 271.52, 277, 304, 5.44, "0xFFFFFF", 1.0),
    ("Aluminum Chloride", "Solid", 133.34, 192.6, 180, 2.48, "0xF5F5F5", 1.0),
    
    # Cobalt compounds - Co2+ is pink/blue
    ("Cobalt Chloride", "Solid", 129.84, 726, 0, 3.356, "0xFFB6C1", 1.0),
    # Nickel compounds - Ni2+ is green
    ("Nickel Chloride", "Solid", 129.6, 1001, 0, 3.51, "0x98FB98", 1.0),
    
    # Hydroxides
    ("Sodium Hydroxide", "Solid", 40, 323, 1388, 2.13, "0xFFFFFF", 1.0),
    ("Potassium Hydroxide", "Solid", 56.11, 360, 1327, 2.12, "0xFFFFFF", 1.0),
    ("Calcium Hydroxide", "Solid", 74.09, 512, 0, 2.21, "0xFFFFFF", 1.0),
    ("Magnesium Hydroxide", "Solid", 58.32, 350, 0, 2.37, "0xFFFFFF", 1.0),
    ("Barium Hydroxide", "Solid", 171.34, 408, 0, 3.74, "0xFFFFFF", 1.0),
    ("Zinc Hydroxide", "Solid", 99.39, 125, 0, 3.05, "0xF5F5F5", 1.0),
    ("Copper Hydroxide", "Solid", 97.56, 0, 0, 3.37, "0x87CEEB", 1.0),
    ("Iron(III) Hydroxide", "Solid", 106.87, 0, 0, 3.9, "0xD2691E", 1.0),
    ("Aluminum Hydroxide", "Solid", 78, 300, 0, 2.42, "0xF5F5F5", 1.0),
    
    # Sulfates - many are white, some are colored
    ("Sodium Sulfate", "Solid", 142.04, 884, 1429, 2.66, "0xFFFFFF", 1.0),
    ("Potassium Sulfate", "Solid", 174.26, 1069, 0, 2.66, "0xFFFFFF", 1.0),
    ("Calcium Sulfate", "Solid", 136.14, 1460, 0, 2.96, "0xFFFAF0", 1.0),
    ("Magnesium Sulfate", "Solid", 120.37, 1124, 0, 2.66, "0xFFFFFF", 1.0),
    ("Barium Sulfate", "Solid", 233.39, 1580, 0, 4.49, "0xFFFFFF", 1.0),
    ("Copper Sulfate", "Solid", 159.61, 150, 0, 3.6, "0x4169E1", 1.0),
    ("Iron Sulfate", "Solid", 151.91, 64, 0, 3.65, "0x98FB98", 1.0),
    ("Iron(II) Sulfate", "Solid", 151.91, 64, 0, 3.65, "0x90EE90", 1.0),
    ("Zinc Sulfate", "Solid", 161.47, 680, 0, 3.54, "0xFFFFFF", 1.0),
    ("Lead Sulfate", "Solid", 303.26, 1170, 0, 6.2, "0xFFFFFF", 1.0),
    ("Aluminum Sulfate", "Solid", 342.15, 770, 0, 2.71, "0xF5F5F5", 1.0),
    
    # Nitrates - mostly white/colorless
    ("Sodium Nitrate", "Solid", 84.99, 308, 380, 2.26, "0xFFFFFF", 1.0),
    ("Potassium Nitrate", "Solid", 101.1, 334, 400, 2.11, "0xFFFFFF", 1.0),
    ("Calcium Nitrate", "Solid", 164.09, 561, 0, 2.5, "0xFFFFFF", 1.0),
    ("Magnesium Nitrate", "Solid", 148.31, 129, 330, 1.46, "0xFFFFFF", 1.0),
    ("Barium Nitrate", "Solid", 261.34, 592, 0, 3.24, "0xFFFFFF", 1.0),
    ("Lead Nitrate", "Solid", 331.2, 470, 0, 4.53, "0xFFFFFF", 1.0),
    ("Silver Nitrate", "Solid", 169.87, 212, 440, 4.35, "0xFFFFFF", 1.0),
    ("Zinc Nitrate", "Solid", 189.4, 36, 0, 2.07, "0xFFFFFF", 1.0),
    ("Ammonium Nitrate", "Solid", 80.04, 169, 210, 1.73, "0xFFFFFF", 1.0),
    
    # Carbonates - white except copper (green-blue)
    ("Sodium Carbonate", "Solid", 105.99, 851, 1600, 2.54, "0xFFFFFF", 1.0),
    ("Potassium Carbonate", "Solid", 138.21, 891, 0, 2.43, "0xFFFFFF", 1.0),
    ("Calcium Carbonate", "Solid", 100.09, 825, 0, 2.71, "0xFFFAF0", 1.0),
    ("Magnesium Carbonate", "Solid", 84.31, 990, 0, 2.96, "0xFFFFFF", 1.0),
    ("Barium Carbonate", "Solid", 197.34, 1740, 0, 4.29, "0xFFFFFF", 1.0),
    ("Strontium Carbonate", "Solid", 147.63, 1494, 0, 3.5, "0xFFFFFF", 1.0),
    ("Lithium Carbonate", "Solid", 73.89, 723, 1310, 2.11, "0xFFFFFF", 1.0),
    ("Copper Carbonate", "Solid", 123.55, 200, 0, 4.0, "0x40E0D0", 1.0),
    ("Zinc Carbonate", "Solid", 125.39, 140, 0, 4.4, "0xFFFFFF", 1.0),
    ("Iron Carbonate", "Solid", 115.86, 0, 0, 3.9, "0x98FB98", 1.0),
    ("Lead Carbonate", "Solid", 267.21, 315, 0, 6.0, "0xFFFFFF", 1.0),
    
    # Phosphates
    ("Sodium Phosphate", "Solid", 163.94, 1340, 0, 2.54, "0xFFFFFF", 1.0),
    ("Calcium Phosphate", "Solid", 310.18, 1670, 0, 3.14, "0xFFFAF0", 1.0),
    
    # Sulfides - some have colors
    ("Sodium Sulfide", "Solid", 78.04, 1180, 0, 1.86, "0xFFFFF0", 1.0),
    ("Iron Sulfide", "Solid", 87.91, 1194, 0, 4.84, "0xB8860B", 1.0),
    ("Copper Sulfide", "Solid", 95.61, 488, 0, 4.76, "0x2F4F4F", 1.0),
    ("Lead Sulfide", "Solid", 239.27, 1114, 0, 7.6, "0x1C1C1C", 1.0),
    ("Zinc Sulfide", "Solid", 97.47, 1850, 0, 4.09, "0xFFFFF0", 1.0),
    ("Mercury Sulfide", "Solid", 232.66, 820, 0, 8.1, "0xDC143C", 1.0),
    ("Silver Sulfide", "Solid", 247.8, 825, 0, 7.23, "0x2F2F2F", 1.0),
    ("Antimony Sulfide", "Solid", 339.68, 550, 0, 4.64, "0xFF4500", 1.0),
    ("Arsenic Sulfide", "Solid", 246.04, 320, 0, 3.43, "0xFFD700", 1.0),
    
    # Oxides - various colors
    ("Iron Oxide", "Solid", 159.69, 1566, 0, 5.24, "0x8B0000", 1.0),
    ("Copper Oxide", "Solid", 79.55, 1326, 0, 6.31, "0x2F4F4F", 1.0),
    ("Zinc Oxide", "Solid", 81.39, 1975, 0, 5.61, "0xFFFFF0", 1.0),
    ("Magnesium Oxide", "Solid", 40.3, 2852, 3600, 3.58, "0xFFFFFF", 1.0),
    ("Calcium Oxide", "Solid", 56.08, 2572, 2850, 3.34, "0xFFFFFF", 1.0),
    ("Aluminum Oxide", "Solid", 101.96, 2072, 2977, 3.95, "0xDCDCDC", 1.0),
    ("Silicon Dioxide", "Solid", 60.08, 1710, 2230, 2.65, "0xFFFAFA", 1.0),
    ("Lead Oxide", "Solid", 223.2, 888, 1477, 9.53, "0xFFFF00", 1.0),
    ("Lead Dioxide", "Solid", 239.2, 290, 0, 9.38, "0x2F2F2F", 1.0),
    ("Tin Oxide", "Solid", 150.71, 1127, 1800, 6.95, "0xDCDCDC", 1.0),
    ("Nickel Oxide", "Solid", 74.69, 1955, 2600, 6.72, "0x2F2F2F", 1.0),
    ("Cobalt Oxide", "Solid", 74.93, 1935, 0, 6.11, "0x2F2F2F", 1.0),
    ("Manganese Dioxide", "Solid", 86.94, 535, 0, 5.03, "0x4A4A4A", 1.0),
    ("Chromium Oxide", "Solid", 151.99, 2439, 3000, 5.22, "0x006400", 1.0),
    ("Titanium Dioxide", "Solid", 79.87, 1843, 2972, 4.23, "0xFFFFFF", 1.0),
    
    # Special compounds
    ("Potassium Permanganate", "Solid", 158.03, 240, 0, 2.7, "0x800080", 1.0),
    ("Potassium Dichromate", "Solid", 294.19, 398, 0, 2.68, "0xFF4500", 1.0),
    ("Copper Cyanide", "Solid", 89.56, 473, 0, 2.9, "0xE6E6FA", 1.0),
    ("Silver Cyanide", "Solid", 133.89, 350, 0, 3.95, "0xFFFFE0", 1.0),
    ("Sodium Thiosulfate", "Solid", 158.11, 48.5, 100, 1.67, "0xFFFFFF", 1.0),
    ("Lead Iodide", "Solid", 461.01, 402, 0, 6.16, "0xFFFF00", 1.0),
    
    # Elements
    ("Sulfur", "Solid", 32.06, 115.2, 444.7, 2.07, "0xFFFF00", 1.0),
    ("Phosphorus", "Solid", 30.97, 44.2, 280, 1.82, "0xFF6600", 1.0),
    ("Iodine", "Solid", 253.81, 113.7, 184.3, 4.93, "0x4B0082", 1.0),
    ("Silicon", "Solid", 28.09, 1414, 3265, 2.33, "0x808080", 1.0),
    ("Boron", "Solid", 10.81, 2076, 3927, 2.34, "0x808080", 1.0),
    
    # Organic solids
    ("Benzoic Acid", "Solid", 122.12, 122.4, 249.2, 1.27, "0xFFFFFF", 1.0),
    ("Salicylic Acid", "Solid", 138.12, 159, 211, 1.44, "0xFFFFFF", 1.0),
    ("Oxalic Acid", "Solid", 90.03, 189.5, 157, 1.9, "0xFFFFFF", 1.0),
    ("Citric Acid", "Solid", 192.12, 153, 0, 1.665, "0xFFFFFF", 1.0),
    ("Tartaric Acid", "Solid", 150.09, 171, 0, 1.76, "0xFFFFFF", 1.0),
    ("Urea", "Solid", 60.06, 133.3, 0, 1.32, "0xFFFFFF", 1.0),
    ("Phenol", "Solid", 94.11, 40.5, 181.9, 1.07, "0xFFFAF0", 1.0),
    ("Naphthalene", "Solid", 128.17, 80.2, 218, 1.02, "0xFFFFFF", 1.0),
    ("Anthracene", "Solid", 178.23, 216.4, 340, 1.24, "0xFFFFE0", 1.0),
    ("Anthraquinone", "Solid", 208.21, 286, 380, 1.42, "0xFFD700", 1.0),
    ("Benzophenone", "Solid", 182.22, 48.5, 305.4, 1.11, "0xFFFFFF", 1.0),
    ("Biphenyl", "Solid", 154.21, 68.9, 255, 1.04, "0xFFFFFF", 1.0),
    
    # Amino acids
    ("Glycine", "Solid", 75.07, 233, 0, 1.6, "0xFFFFFF", 1.0),
    ("Alanine", "Solid", 89.09, 314, 0, 1.42, "0xFFFFFF", 1.0),
    ("Valine", "Solid", 117.15, 315, 0, 1.23, "0xFFFFFF", 1.0),
    ("Leucine", "Solid", 131.17, 293, 0, 1.17, "0xFFFFFF", 1.0),
    ("Proline", "Solid", 115.13, 201, 0, 1.35, "0xFFFFFF", 1.0),
    
    # Ammonium compounds
    ("Ammonium Chloride", "Solid", 53.49, 520, 520, 1.53, "0xFFFFFF", 1.0),
    ("Ammonium Sulfate", "Solid", 132.14, 280, 0, 1.77, "0xFFFFFF", 1.0),
    ("Ammonium Nitrate", "Solid", 80.04, 169, 210, 1.73, "0xFFFFFF", 1.0),
    ("Ammonium Carbonate", "Solid", 96.09, 58, 0, 1.5, "0xFFFFFF", 1.0),
    ("Ammonium Chromate", "Solid", 152.07, 185, 0, 1.9, "0xFFFF00", 1.0),
    ("Ammonium Dichromate", "Solid", 252.06, 180, 0, 2.15, "0xFF4500", 1.0),
    
    # More metal compounds with colors
    ("Barium Bromide", "Solid", 297.14, 854, 0, 4.92, "0xFFFFFF", 1.0),
    ("Barium Iodide", "Solid", 391.14, 740, 0, 5.15, "0xFFFFF0", 1.0),
    ("Cadmium Sulfide", "Solid", 144.48, 1750, 0, 4.82, "0xFFFF00", 1.0),
    ("Cadmium Chloride", "Solid", 183.32, 568, 964, 4.05, "0xFFFFFF", 1.0),
    ("Cadmium Iodide", "Solid", 366.22, 388, 742, 5.67, "0xFFFFE0", 1.0),
    ("Cadmium Oxide", "Solid", 128.41, 1500, 0, 6.95, "0x2F2F2F", 1.0),
    
    # Cobalt more
    ("Cobalt Acetate", "Solid", 177.02, 0, 0, 1.71, "0xFFB6C1", 1.0),
    ("Cobalt Sulfate", "Solid", 155, 96.8, 0, 3.71, "0xFFB6C1", 1.0),
    ("Cobalt Nitrate", "Solid", 182.94, 55, 0, 2.49, "0xFFB6C1", 1.0),
    
    # Chromium
    ("Chromium Trioxide", "Solid", 99.99, 196, 250, 2.7, "0xFF4500", 1.0),
    ("Chromium Acetate", "Solid", 229.13, 0, 0, 1.27, "0x006400", 1.0),
    ("Chromium Sulfate", "Solid", 148.06, 0, 0, 3.1, "0x006400", 1.0),
    
    # Copper more
    ("Copper Acetate", "Solid", 181.63, 0, 0, 1.93, "0x40E0D0", 1.0),
    ("Copper Sulfate", "Solid", 159.61, 150, 0, 3.6, "0x4169E1", 1.0),
    ("Copper Nitrate", "Solid", 187.56, 115, 170, 2.32, "0x4169E1", 1.0),
    ("Copper Bromide", "Solid", 223.37, 498, 900, 4.77, "0x4169E1", 1.0),
    
    # Nickel more
    ("Nickel Sulfate", "Solid", 154.76, 100, 0, 4.11, "0x98FB98", 1.0),
    ("Nickel Nitrate", "Solid", 182.7, 57, 137, 2.05, "0x98FB98", 1.0),
    
    # Lead more
    ("Lead Chromate", "Solid", 323.19, 844, 0, 6.12, "0xFFFF00", 1.0),
    ("Lead Iodide", "Solid", 461.01, 402, 0, 6.16, "0xFFFF00", 1.0),
    
    # Silver more
    ("Silver Bromide", "Solid", 187.77, 432, 1502, 6.47, "0xFFFFE0", 1.0),
    ("Silver Iodide", "Solid", 234.77, 558, 1506, 5.68, "0xFFFFCC", 1.0),
]

rows = []
for comp in COMPOUNDS:
    name, state, mm, mp, bp, density, color, alpha = comp
    row = [
        name, state, "0", "1", name, name, name,
        str(density), "1", "0.001", str(mm), "0", str(mp), str(bp), "0.1",
        color, str(alpha), color, str(alpha), color, str(alpha), color, str(alpha),
        "0.4", "0.3", "", "", "", "", "0", "0", "0", "0", "0"
    ]
    rows.append(row)

with open('/home/codespace/projects/chemist-lab-enhanced/transparent_colors.csv', 'w', encoding='utf-8', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(header)
    writer.writerows(rows)

print(f"Generated {len(rows)} compounds with transparent colors")

states = {}
for comp in COMPOUNDS:
    state = comp[1]
    states[state] = states.get(state, 0) + 1
print("State distribution:")
for k, v in sorted(states.items()):
    print(f"  {k}: {v}")
