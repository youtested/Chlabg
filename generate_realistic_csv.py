#!/usr/bin/env python3
import json
import csv
import math

# Comprehensive realistic compound data
REALISTIC_DATA = {
    # Alkanes
    "Methane": {"color": "0xFFFFFF", "mp": -182.5, "bp": -161.5, "density": 0.668, "mm": 16.04, "state": "Gas"},
    "Ethane": {"color": "0xFFFFFF", "mp": -183.3, "bp": -88.6, "density": 1.265, "mm": 30.07, "state": "Gas"},
    "Propane": {"color": "0xFFFFFF", "mp": -187.7, "bp": -42.1, "density": 1.867, "mm": 44.09, "state": "Gas"},
    "Butane": {"color": "0xFFFFFF", "mp": -138.3, "bp": -0.5, "density": 2.493, "mm": 58.12, "state": "Gas"},
    "Pentane": {"color": "0xFFFFFF", "mp": -129.7, "bp": 36.1, "density": 0.626, "mm": 72.15, "state": "Liquid"},
    "Hexane": {"color": "0xFFFFFF", "mp": -95.3, "bp": 68.7, "density": 0.659, "mm": 86.18, "state": "Liquid"},
    "Heptane": {"color": "0xFFFFFF", "mp": -90.6, "bp": 98.4, "density": 0.684, "mm": 100.2, "state": "Liquid"},
    "Octane": {"color": "0xFFFFFF", "mp": -56.8, "bp": 125.7, "density": 0.703, "mm": 114.23, "state": "Liquid"},
    "Nonane": {"color": "0xFFFFFF", "mp": -64, "bp": 150.8, "density": 0.718, "mm": 128.25, "state": "Liquid"},
    "Decane": {"color": "0xFFFFFF", "mp": -29.7, "bp": 174.1, "density": 0.73, "mm": 142.29, "state": "Liquid"},
    "Undecane": {"color": "0xFFFFFF", "mp": -25.5, "bp": 195.9, "density": 0.74, "mm": 156.31, "state": "Liquid"},
    "Dodecane": {"color": "0xFFFFFF", "mp": -9.6, "bp": 216.3, "density": 0.75, "mm": 170.33, "state": "Liquid"},
    "Tridecane": {"color": "0xFFFFFF", "mp": -5.4, "bp": 235.5, "density": 0.76, "mm": 184.36, "state": "Liquid"},
    "Tetradecane": {"color": "0xFFFFFF", "mp": 5.9, "bp": 253.5, "density": 0.76, "mm": 198.39, "state": "Liquid"},
    "Pentadecane": {"color": "0xFFFFFF", "mp": 10, "bp": 270.5, "density": 0.77, "mm": 212.41, "state": "Liquid"},
    "Hexadecane": {"color": "0xFFFFFF", "mp": 18.2, "bp": 287, "density": 0.77, "mm": 226.44, "state": "Solid"},
    "Heptadecane": {"color": "0xFFFFFF", "mp": 22, "bp": 303, "density": 0.77, "mm": 240.46, "state": "Solid"},
    "Octadecane": {"color": "0xFFFFFF", "mp": 28.2, "bp": 316.7, "density": 0.78, "mm": 254.49, "state": "Solid"},
    "Nonadecane": {"color": "0xFFFFFF", "mp": 32, "bp": 330, "density": 0.78, "mm": 268.52, "state": "Solid"},
    "Eicosane": {"color": "0xFFFFFF", "mp": 36.8, "bp": 343, "density": 0.79, "mm": 282.55, "state": "Solid"},
    # Alkenes
    "Ethylene": {"color": "0xFFFFFF", "mp": -169.4, "bp": -103.7, "density": 0.001, "mm": 28.05, "state": "Gas"},
    "Propylene": {"color": "0xFFFFFF", "mp": -185.2, "bp": -47.6, "density": 0.001, "mm": 42.08, "state": "Gas"},
    "Butene": {"color": "0xFFFFFF", "mp": -185.3, "bp": -6.4, "density": 0.001, "mm": 56.11, "state": "Gas"},
    "Pentene": {"color": "0xFFFFFF", "mp": -165.2, "bp": 30, "density": 0.64, "mm": 70.13, "state": "Liquid"},
    "Hexene": {"color": "0xFFFFFF", "mp": -139.8, "bp": 63.5, "density": 0.67, "mm": 84.16, "state": "Liquid"},
    "Heptene": {"color": "0xFFFFFF", "mp": -119, "bp": 93.6, "density": 0.7, "mm": 98.19, "state": "Liquid"},
    "Octene": {"color": "0xFFFFFF", "mp": -101.7, "bp": 122.5, "density": 0.71, "mm": 112.21, "state": "Liquid"},
    # Alkynes
    "Acetylene": {"color": "0xFFFFFF", "mp": -80.8, "bp": -84, "density": 0.001, "mm": 26.04, "state": "Gas"},
    "Propyne": {"color": "0xFFFFFF", "mp": -102.7, "bp": -23.2, "density": 0.001, "mm": 40.06, "state": "Gas"},
    "Butyne": {"color": "0xFFFFFF", "mp": -125.7, "bp": 8.1, "density": 0.001, "mm": 54.09, "state": "Gas"},
    # Alcohols
    "Methanol": {"color": "0xFFFFFF", "mp": -97.6, "bp": 64.7, "density": 0.792, "mm": 32.04, "state": "Liquid"},
    "Ethanol": {"color": "0xFFFFFF", "mp": -114.1, "bp": 78.37, "density": 0.789, "mm": 46.07, "state": "Liquid"},
    "Propanol": {"color": "0xFFFFFF", "mp": -126.2, "bp": 97.2, "density": 0.804, "mm": 60.1, "state": "Liquid"},
    "Isopropyl Alcohol": {"color": "0xFFFFFF", "mp": -89.5, "bp": 82.6, "density": 0.786, "mm": 60.1, "state": "Liquid"},
    "Butanol": {"color": "0xFFFFFF", "mp": -89.5, "bp": 117.7, "density": 0.81, "mm": 74.12, "state": "Liquid"},
    "Isobutyl Alcohol": {"color": "0xFFFFFF", "mp": -108, "bp": 107.9, "density": 0.802, "mm": 74.12, "state": "Liquid"},
    "Tert-Butyl Alcohol": {"color": "0xFFFFFF", "mp": 25.7, "bp": 82.4, "density": 0.786, "mm": 74.12, "state": "Solid"},
    "Pentanol": {"color": "0xFFFFFF", "mp": -79, "bp": 138, "density": 0.81, "mm": 88.15, "state": "Liquid"},
    "Glycol": {"color": "0xFFFFFF", "mp": -13, "bp": 197.3, "density": 1.11, "mm": 62.07, "state": "Liquid"},
    "Glycerol": {"color": "0xFFFFFF", "mp": 17.8, "bp": 290, "density": 1.261, "mm": 92.09, "state": "Liquid"},
    "Ethylene Glycol": {"color": "0xFFFFFF", "mp": -13, "bp": 197.3, "density": 1.11, "mm": 62.07, "state": "Liquid"},
    # Aldehydes
    "Formaldehyde": {"color": "0xFFFFFF", "mp": -92, "bp": -19.1, "density": 0.815, "mm": 30.03, "state": "Gas"},
    "Acetaldehyde": {"color": "0xFFFFFF", "mp": -123.4, "bp": 20.2, "density": 0.78, "mm": 44.05, "state": "Liquid"},
    "Propionaldehyde": {"color": "0xFFFFFF", "mp": -80, "bp": 48, "density": 0.81, "mm": 58.08, "state": "Liquid"},
    "Butyraldehyde": {"color": "0xFFFFFF", "mp": -96, "bp": 74.8, "density": 0.8, "mm": 72.11, "state": "Liquid"},
    "Benzaldehyde": {"color": "0xFFFFFF", "mp": -26, "bp": 178.8, "density": 1.04, "mm": 106.12, "state": "Liquid"},
    # Ketones
    "Acetone": {"color": "0xFFFFFF", "mp": -94.9, "bp": 56.08, "density": 0.784, "mm": 58.08, "state": "Liquid"},
    "Methyl Ethyl Ketone": {"color": "0xFFFFFF", "mp": -86, "bp": 79.6, "density": 0.8, "mm": 72.11, "state": "Liquid"},
    "Methyl Propyl Ketone": {"color": "0xFFFFFF", "mp": -77, "bp": 102.4, "density": 0.81, "mm": 86.13, "state": "Liquid"},
    "Diethyl Ketone": {"color": "0xFFFFFF", "mp": -42, "bp": 102.7, "density": 0.81, "mm": 86.13, "state": "Liquid"},
    "Acetophenone": {"color": "0xFFFFFF", "mp": 19.6, "bp": 202, "density": 1.03, "mm": 120.15, "state": "Liquid"},
    "Benzophenone": {"color": "0xFFFFFF", "mp": 48.5, "bp": 305, "density": 1.08, "mm": 182.22, "state": "Solid"},
    # Carboxylic Acids
    "Formic Acid": {"color": "0xFFFFFF", "mp": 8.4, "bp": 100.8, "density": 1.22, "mm": 46.03, "state": "Liquid"},
    "Acetic Acid": {"color": "0xFFFFFF", "mp": 16.6, "bp": 118.1, "density": 1.049, "mm": 60.05, "state": "Liquid"},
    "Propionic Acid": {"color": "0xFFFFFF", "mp": -20.7, "bp": 141.1, "density": 0.99, "mm": 74.08, "state": "Liquid"},
    "Butyric Acid": {"color": "0xFFFFFF", "mp": -7.9, "bp": 163.5, "density": 0.964, "mm": 88.11, "state": "Liquid"},
    "Valeric Acid": {"color": "0xFFFFFF", "mp": -34.5, "bp": 186, "density": 0.939, "mm": 102.13, "state": "Liquid"},
    "Benzoic Acid": {"color": "0xFFFFFF", "mp": 122.4, "bp": 249.2, "density": 1.27, "mm": 122.12, "state": "Solid"},
    "Salicylic Acid": {"color": "0xFFFFFF", "mp": 159, "bp": 211, "density": 1.44, "mm": 138.12, "state": "Solid"},
    "Oxalic Acid": {"color": "0xFFFFFF", "mp": 189.5, "bp": 157, "density": 1.9, "mm": 90.03, "state": "Solid"},
    "Tartaric Acid": {"color": "0xFFFFFF", "mp": 171, "bp": 0, "density": 1.76, "mm": 150.09, "state": "Solid"},
    "Citric Acid": {"color": "0xFFFFFF", "mp": 153, "bp": 0, "density": 1.665, "mm": 192.12, "state": "Solid"},
    "Lactic Acid": {"color": "0xFFFFFF", "mp": 18, "bp": 122, "density": 1.21, "mm": 90.08, "state": "Liquid"},
    # Esters
    "Methyl Acetate": {"color": "0xFFFFFF", "mp": -98.1, "bp": 56.9, "density": 0.93, "mm": 74.08, "state": "Liquid"},
    "Ethyl Acetate": {"color": "0xFFFFFF", "mp": -83.6, "bp": 77.1, "density": 0.9, "mm": 88.11, "state": "Liquid"},
    "Propyl Acetate": {"color": "0xFFFFFF", "mp": -95, "bp": 101.5, "density": 0.89, "mm": 102.13, "state": "Liquid"},
    "Butyl Acetate": {"color": "0xFFFFFF", "mp": -77.9, "bp": 126.1, "density": 0.88, "mm": 116.16, "state": "Liquid"},
    "Methyl Formate": {"color": "0xFFFFFF", "mp": -99, "bp": 32, "density": 0.97, "mm": 60.05, "state": "Liquid"},
    "Ethyl Formate": {"color": "0xFFFFFF", "mp": -80.5, "bp": 54.4, "density": 0.92, "mm": 74.08, "state": "Liquid"},
    # Ethers
    "Diethyl Ether": {"color": "0xFFFFFF", "mp": -116.3, "bp": 34.6, "density": 0.71, "mm": 74.12, "state": "Liquid"},
    "Dimethyl Ether": {"color": "0xFFFFFF", "mp": -141.5, "bp": -24.8, "density": 0.002, "mm": 46.07, "state": "Gas"},
    "Methyl Propyl Ether": {"color": "0xFFFFFF", "mp": -112, "bp": 39.1, "density": 0.74, "mm": 60.1, "state": "Liquid"},
    "Tetrahydrofuran": {"color": "0xFFFFFF", "mp": -108.5, "bp": 66, "density": 0.89, "mm": 72.11, "state": "Liquid"},
    # Aromatics
    "Benzene": {"color": "0xFFFFFF", "mp": 5.5, "bp": 80.1, "density": 0.879, "mm": 78.11, "state": "Liquid"},
    "Toluene": {"color": "0xFFFFFF", "mp": -95, "bp": 110.6, "density": 0.867, "mm": 92.14, "state": "Liquid"},
    "Xylene": {"color": "0xFFFFFF", "mp": -47, "bp": 138, "density": 0.86, "mm": 106.16, "state": "Liquid"},
    "Ethylbenzene": {"color": "0xFFFFFF", "mp": -95, "bp": 136.2, "density": 0.87, "mm": 106.16, "state": "Liquid"},
    "Cumene": {"color": "0xFFFFFF", "mp": -96, "bp": 152.4, "density": 0.86, "mm": 120.19, "state": "Liquid"},
    "Styrene": {"color": "0xFFFFFF", "mp": -30.2, "bp": 145.2, "density": 0.906, "mm": 104.15, "state": "Liquid"},
    "Naphthalene": {"color": "0xFFFFFF", "mp": 80.2, "bp": 218, "density": 1.02, "mm": 128.17, "state": "Solid"},
    "Phenol": {"color": "0xFFFFFF", "mp": 40.5, "bp": 181.9, "density": 1.07, "mm": 94.11, "state": "Solid"},
    "Aniline": {"color": "0xC4A000", "mp": -6.3, "bp": 184.4, "density": 1.022, "mm": 93.13, "state": "Liquid"},
    "Nitrobenzene": {"color": "0xFFFF00", "mp": 5.7, "bp": 210.8, "density": 1.2, "mm": 123.11, "state": "Liquid"},
    "Chlorobenzene": {"color": "0xFFFFFF", "mp": -45.2, "bp": 131.6, "density": 1.11, "mm": 112.56, "state": "Liquid"},
    "Bromobenzene": {"color": "0xFFFFFF", "mp": -30.9, "bp": 156, "density": 1.49, "mm": 157.02, "state": "Liquid"},
    "Iodobenzene": {"color": "0xFFFFFF", "mp": -29.3, "bp": 188.3, "density": 1.83, "mm": 203.02, "state": "Liquid"},
    # Halides
    "Chloroform": {"color": "0xFFFFFF", "mp": -63.5, "bp": 60.6, "density": 1.48, "mm": 119.38, "state": "Liquid"},
    "Carbon Tetrachloride": {"color": "0xFFFFFF", "mp": -22.9, "bp": 76.7, "density": 1.594, "mm": 153.82, "state": "Liquid"},
    "Dichloromethane": {"color": "0xFFFFFF", "mp": -97.4, "bp": 40, "density": 1.33, "mm": 84.93, "state": "Liquid"},
    "1,2-Dichloroethane": {"color": "0xFFFFFF", "mp": -35.7, "bp": 83.5, "density": 1.25, "mm": 98.96, "state": "Liquid"},
    "Vinyl Chloride": {"color": "0xFFFFFF", "mp": -153.8, "bp": -13.4, "density": 0.002, "mm": 62.5, "state": "Gas"},
    "1,1-Dichloroethylene": {"color": "0xFFFFFF", "mp": -122.5, "bp": 31.7, "density": 1.21, "mm": 96.94, "state": "Liquid"},
    # Amines
    "Methylamine": {"color": "0xFFFFFF", "mp": -93.5, "bp": -6.3, "density": 0.001, "mm": 31.06, "state": "Gas"},
    "Ethylamine": {"color": "0xFFFFFF", "mp": -81, "bp": 16.6, "density": 0.69, "mm": 45.08, "state": "Liquid"},
    "Dimethylamine": {"color": "0xFFFFFF", "mp": -92.2, "bp": 7, "density": 0.001, "mm": 45.08, "state": "Gas"},
    "Trimethylamine": {"color": "0xFFFFFF", "mp": -117.2, "bp": 3, "density": 0.001, "mm": 59.11, "state": "Gas"},
    "Triethylamine": {"color": "0xFFFFFF", "mp": -114.7, "bp": 89, "density": 0.73, "mm": 101.19, "state": "Liquid"},
    "Aniline": {"color": "0xC4A000", "mp": -6.3, "bp": 184.4, "density": 1.022, "mm": 93.13, "state": "Liquid"},
    # Nitriles
    "Acetonitrile": {"color": "0xFFFFFF", "mp": -43.8, "bp": 81.6, "density": 0.79, "mm": 41.05, "state": "Liquid"},
    "Acrylonitrile": {"color": "0xFFFFFF", "mp": -83.5, "bp": 77.3, "density": 0.8, "mm": 53.06, "state": "Liquid"},
    # Inorganic Acids
    "Hydrochloric Acid": {"color": "0xFFFFFF", "mp": -27.3, "bp": 110, "density": 1.18, "mm": 36.46, "state": "Liquid"},
    "Sulfuric Acid": {"color": "0xFFFFFF", "mp": 10, "bp": 337, "density": 1.84, "mm": 98.08, "state": "Liquid"},
    "Nitric Acid": {"color": "0xFFFFFF", "mp": -42, "bp": 83, "density": 1.51, "mm": 63.01, "state": "Liquid"},
    "Phosphoric Acid": {"color": "0xFFFFFF", "mp": 42.4, "bp": 158, "density": 1.88, "mm": 98, "state": "Liquid"},
    "Hydrogen Peroxide": {"color": "0xFFFFFF", "mp": -0.4, "bp": 150.2, "density": 1.45, "mm": 34.01, "state": "Liquid"},
    "Carbonic Acid": {"color": "0xFFFFFF", "mp": 0, "bp": 0, "density": 1.0, "mm": 62.03, "state": "Liquid"},
    "Ammonia": {"color": "0xFFFFFF", "mp": -77.7, "bp": -33.3, "density": 0.73, "mm": 17.03, "state": "Liquid"},
    # Inorganic Salts
    "Sodium Chloride": {"color": "0xFFFFFF", "mp": 801, "bp": 1413, "density": 2.165, "mm": 58.44, "state": "Solid"},
    "Potassium Chloride": {"color": "0xFFFFFF", "mp": 770, "bp": 1420, "density": 1.984, "mm": 74.55, "state": "Solid"},
    "Calcium Chloride": {"color": "0xFFFFFF", "mp": 772, "bp": 1935, "density": 2.15, "mm": 110.98, "state": "Solid"},
    "Magnesium Chloride": {"color": "0xFFFFFF", "mp": 714, "bp": 1418, "density": 2.32, "mm": 95.21, "state": "Solid"},
    "Sodium Hydroxide": {"color": "0xFFFFFF", "mp": 323, "bp": 1388, "density": 2.13, "mm": 40, "state": "Solid"},
    "Potassium Hydroxide": {"color": "0xFFFFFF", "mp": 360, "bp": 1327, "density": 2.12, "mm": 56.11, "state": "Solid"},
    "Calcium Hydroxide": {"color": "0xFFFFFF", "mp": 512, "bp": 0, "density": 2.21, "mm": 74.09, "state": "Solid"},
    "Sodium Sulfate": {"color": "0xFFFFFF", "mp": 884, "bp": 1429, "density": 2.66, "mm": 142.04, "state": "Solid"},
    "Copper Sulfate": {"color": "0x0066CC", "mp": 150, "bp": 0, "density": 3.6, "mm": 159.61, "state": "Solid"},
    "Iron Sulfate": {"color": "0x90D6C0", "mp": 64, "bp": 0, "density": 3.65, "mm": 151.91, "state": "Solid"},
    "Zinc Sulfate": {"color": "0xFFFFFF", "mp": 680, "bp": 0, "density": 3.54, "mm": 161.47, "state": "Solid"},
    "Magnesium Sulfate": {"color": "0xFFFFFF", "mp": 1124, "bp": 0, "density": 2.66, "mm": 120.37, "state": "Solid"},
    "Barium Sulfate": {"color": "0xFFFFFF", "mp": 1580, "bp": 0, "density": 4.49, "mm": 233.39, "state": "Solid"},
    "Calcium Carbonate": {"color": "0xFFFFFF", "mp": 825, "bp": 0, "density": 2.71, "mm": 100.09, "state": "Solid"},
    "Sodium Carbonate": {"color": "0xFFFFFF", "mp": 851, "bp": 1600, "density": 2.54, "mm": 105.99, "state": "Solid"},
    "Potassium Carbonate": {"color": "0xFFFFFF", "mp": 891, "bp": 0, "density": 2.43, "mm": 138.21, "state": "Solid"},
    "Sodium Bicarbonate": {"color": "0xFFFFFF", "mp": 50, "bp": 0, "density": 2.2, "mm": 84.01, "state": "Solid"},
    "Calcium Nitrate": {"color": "0xFFFFFF", "mp": 561, "bp": 0, "density": 2.5, "mm": 164.09, "state": "Solid"},
    "Sodium Nitrate": {"color": "0xFFFFFF", "mp": 308, "bp": 380, "density": 2.26, "mm": 84.99, "state": "Solid"},
    "Potassium Nitrate": {"color": "0xFFFFFF", "mp": 334, "bp": 400, "density": 2.11, "mm": 101.1, "state": "Solid"},
    "Silver Nitrate": {"color": "0xFFFFFF", "mp": 212, "bp": 440, "density": 4.35, "mm": 169.87, "state": "Solid"},
    "Ammonium Chloride": {"color": "0xFFFFFF", "mp": 338, "bp": 520, "density": 1.53, "mm": 53.49, "state": "Solid"},
    "Ammonium Sulfate": {"color": "0xFFFFFF", "mp": 235, "bp": 0, "density": 1.77, "mm": 132.14, "state": "Solid"},
    "Lead Iodide": {"color": "0xFFFF00", "mp": 402, "bp": 0, "density": 6.16, "mm": 461.01, "state": "Solid"},
    "Lead Chloride": {"color": "0xFFFFFF", "mp": 501, "bp": 950, "density": 5.85, "mm": 278.1, "state": "Solid"},
    "Copper Chloride": {"color": "0x009900", "mp": 430, "bp": 1490, "density": 3.39, "mm": 134.45, "state": "Solid"},
    "Iron Chloride": {"color": "0x8B4513", "mp": 306, "bp": 316, "density": 2.9, "mm": 162.2, "state": "Solid"},
    "Iron Oxide": {"color": "0x8B0000", "mp": 1566, "bp": 0, "density": 5.24, "mm": 159.69, "state": "Solid"},
    "Copper Oxide": {"color": "0x000000", "mp": 1326, "bp": 0, "density": 6.31, "mm": 79.55, "state": "Solid"},
    "Zinc Oxide": {"color": "0xFFFFFF", "mp": 1975, "bp": 0, "density": 5.61, "mm": 81.39, "state": "Solid"},
    "Magnesium Oxide": {"color": "0xFFFFFF", "mp": 2852, "bp": 3600, "density": 3.58, "mm": 40.3, "state": "Solid"},
    "Calcium Oxide": {"color": "0xFFFFFF", "mp": 2572, "bp": 2850, "density": 3.34, "mm": 56.08, "state": "Solid"},
    "Aluminum Oxide": {"color": "0xFFFFFF", "mp": 2072, "bp": 2977, "density": 3.95, "mm": 101.96, "state": "Solid"},
    "Silicon Dioxide": {"color": "0xFFFFFF", "mp": 1710, "bp": 2230, "density": 2.65, "mm": 60.08, "state": "Solid"},
    # Transition Metal Compounds
    "Potassium Permanganate": {"color": "0x800080", "mp": 240, "bp": 0, "density": 2.7, "mm": 158.03, "state": "Solid"},
    "Potassium Dichromate": {"color": "0xFF4500", "mp": 398, "bp": 0, "density": 2.68, "mm": 294.19, "state": "Solid"},
    "Copper Cyanide": {"color": "0xFFFFFF", "mp": 473, "bp": 0, "density": 2.9, "mm": 89.56, "state": "Solid"},
    "Mercury Sulfide": {"color": "0xFF0000", "mp": 820, "bp": 0, "density": 8.1, "mm": 232.66, "state": "Solid"},
    "Cobalt Chloride": {"color": "0x0066CC", "mp": 726, "bp": 0, "density": 3.356, "mm": 129.84, "state": "Solid"},
    "Nickel Chloride": {"color": "0xFFFF00", "mp": 1001, "bp": 0, "density": 3.51, "mm": 129.6, "state": "Solid"},
    # Gases
    "Oxygen": {"color": "0xCCEEFF", "mp": -218.8, "bp": -182.9, "density": 0.001, "mm": 32, "state": "Gas"},
    "Nitrogen": {"color": "0xFFFFFF", "mp": -210, "bp": -195.8, "density": 0.001, "mm": 28.02, "state": "Gas"},
    "Hydrogen": {"color": "0xFFFFFF", "mp": -259.14, "bp": -252.87, "density": 0.001, "mm": 2.02, "state": "Gas"},
    "Chlorine": {"color": "0x00FF00", "mp": -101.5, "bp": -34.6, "density": 0.003, "mm": 70.9, "state": "Gas"},
    "Fluorine": {"color": "0xFFFF99", "mp": -219.6, "bp": -188.1, "density": 0.002, "mm": 38, "state": "Gas"},
    "Carbon Dioxide": {"color": "0xFFFFFF", "mp": -78.5, "bp": -56.6, "density": 0.001, "mm": 44.01, "state": "Gas"},
    "Carbon Monoxide": {"color": "0xFFFFFF", "mp": -205, "bp": -191.5, "density": 0.001, "mm": 28.01, "state": "Gas"},
    "Sulfur Dioxide": {"color": "0xFFFFFF", "mp": -72.7, "bp": -10, "density": 0.003, "mm": 64.07, "state": "Gas"},
    "Ozone": {"color": "0xCCEEFF", "mp": -192.5, "bp": -111.4, "density": 0.002, "mm": 48, "state": "Gas"},
    "Nitrogen Dioxide": {"color": "0xFF6600", "mp": -11.2, "bp": 21, "density": 0.002, "mm": 46.01, "state": "Gas"},
    # Elements
    "Sulfur": {"color": "0xFFFF00", "mp": 115.2, "bp": 444.7, "density": 2.07, "mm": 32.06, "state": "Solid"},
    "Phosphorus": {"color": "0xFF6600", "mp": 44.2, "bp": 280, "density": 1.82, "mm": 30.97, "state": "Solid"},
    "Iodine": {"color": "0x4B0082", "mp": 113.7, "bp": 184.3, "density": 4.93, "mm": 253.81, "state": "Solid"},
    "Bromine": {"color": "0x8B0000", "mp": -7.2, "bp": 58.8, "density": 3.12, "mm": 159.81, "state": "Liquid"},
    "Silicon": {"color": "0x808080", "mp": 1414, "bp": 3265, "density": 2.33, "mm": 28.09, "state": "Solid"},
    "Boron": {"color": "0x808080", "mp": 2076, "bp": 3927, "density": 2.34, "mm": 10.81, "state": "Solid"},
    # Organic compounds
    "Acetamide": {"color": "0xFFFFFF", "mp": 82.3, "bp": 221.2, "density": 1.16, "mm": 59.07, "state": "Solid"},
    "Urea": {"color": "0xFFFFFF", "mp": 133.3, "bp": 0, "density": 1.32, "mm": 60.06, "state": "Solid"},
    "Caffeine": {"color": "0xFFFFFF", "mp": 235.6, "bp": 178, "density": 1.23, "mm": 194.19, "state": "Solid"},
    "Guanine": {"color": "0xFFFFFF", "mp": 365, "bp": 0, "density": 1.58, "mm": 151.13, "state": "Solid"},
    "Adenine": {"color": "0xFFFFFF", "mp": 365, "bp": 0, "density": 1.6, "mm": 135.13, "state": "Solid"},
    "Cytosine": {"color": "0xFFFFFF", "mp": 320, "bp": 0, "density": 1.55, "mm": 111.1, "state": "Solid"},
    "Thymine": {"color": "0xFFFFFF", "mp": 320, "bp": 0, "density": 1.4, "mm": 126.11, "state": "Solid"},
    "Sucrose": {"color": "0xFFFFFF", "mp": 186, "bp": 0, "density": 1.588, "mm": 342.3, "state": "Solid"},
    "Glucose": {"color": "0xFFFFFF", "mp": 146, "bp": 0, "density": 1.54, "mm": 180.16, "state": "Solid"},
    "Fructose": {"color": "0xFFFFFF", "mp": 103, "bp": 0, "density": 1.69, "mm": 180.16, "state": "Solid"},
    "Maltose": {"color": "0xFFFFFF", "mp": 160, "bp": 0, "density": 1.54, "mm": 342.3, "state": "Solid"},
    "Lactose": {"color": "0xFFFFFF", "mp": 222, "bp": 0, "density": 1.53, "mm": 342.3, "state": "Solid"},
    "Starch": {"color": "0xFFFFFF", "mp": 0, "bp": 0, "density": 1.5, "mm": 162.14, "state": "Solid"},
    "Cellulose": {"color": "0xFFFFFF", "mp": 260, "bp": 0, "density": 1.5, "mm": 162.14, "state": "Solid"},
    "Glycerin": {"color": "0xFFFFFF", "mp": 17.8, "bp": 290, "density": 1.261, "mm": 92.09, "state": "Liquid"},
    "Acrolein": {"color": "0xFFFFFF", "mp": -87, "bp": 52.7, "density": 0.84, "mm": 56.06, "state": "Liquid"},
    "Crotonaldehyde": {"color": "0xFFFFFF", "mp": -76.5, "bp": 104, "density": 0.85, "mm": 70.09, "state": "Liquid"},
    "Furfural": {"color": "0xFFFF00", "mp": -38.7, "bp": 161.7, "density": 1.16, "mm": 96.08, "state": "Liquid"},
    "Tetralin": {"color": "0xFFFFFF", "mp": -36, "bp": 207.6, "density": 0.97, "mm": 132.2, "state": "Liquid"},
    "Decalin": {"color": "0xFFFFFF", "mp": -43, "bp": 185, "density": 0.87, "mm": 138.25, "state": "Liquid"},
    "Cyclohexanol": {"color": "0xFFFFFF", "mp": 25.9, "bp": 161.1, "density": 0.96, "mm": 100.16, "state": "Liquid"},
    "Cyclohexanone": {"color": "0xFFFFFF", "mp": -16.4, "bp": 155, "density": 0.95, "mm": 98.14, "state": "Liquid"},
    "Adipic Acid": {"color": "0xFFFFFF", "mp": 153, "bp": 265, "density": 1.36, "mm": 146.14, "state": "Solid"},
    "Caprolactam": {"color": "0xFFFFFF", "mp": 70, "bp": 268, "density": 1.13, "mm": 113.16, "state": "Solid"},
}

def generate_csv():
    header = ['Chemical', 'Type', 'State', 'Available', 'RName', 'CName', 'DName',
              'Density1', 'Density2', 'Density3', 'Mm', 'Sol', 'Mp', 'Bp', 'KH',
              'color1', 'alpha1', 'color2', 'alpha2', 'color3', 'alpha3', 'color4', 'alpha4',
              'friction', 'restitution', 'JPN', 'CHN', 'TW', 'KR', 'Solk', 'MOH', 'KOH', 'MH', 'PTN']
    
    rows = []
    
    # Add all compounds from realistic data
    for name, data in REALISTIC_DATA.items():
        state = data.get("state", "Liquid")
        color = data.get("color", "0xFFFFFF")
        mm = data.get("mm", 100)
        mp = data.get("mp", 0)
        bp = data.get("bp", 0)
        density = data.get("density", 1.0)
        
        # Determine type
        inorganic = ["Sodium", "Potassium", "Calcium", "Magnesium", "Barium", "Zinc", "Copper", "Iron", 
                    "Aluminum", "Silver", "Lead", "Mercury", "Cobalt", "Nickel", "Chromium", "Manganese",
                    "Silicon", "Boron", "Oxygen", "Nitrogen", "Hydrogen", "Chlorine", "Fluorine", 
                    "Carbon", "Sulfur", "Phosphorus", "Iodine", "Bromine", "Ammonia", "Hydrochloric",
                    "Sulfuric", "Nitric", "Phosphoric", "Hydrogen Peroxide", "Carbonic"]
        
        compound_type = "Organic"
        for inorg in inorganic:
            if inorg in name:
                compound_type = "Inorganic"
                break
        
        row = [
            name,                      # Chemical
            compound_type,              # Type
            state,                     # State
            "1",                       # Available
            name,                      # RName
            name,                      # CName
            name,                      # DName
            str(density),              # Density1
            "1",                       # Density2
            "0.001",                   # Density3
            str(mm),                   # Mm
            "0",                       # Sol
            str(mp),                   # Mp
            str(bp),                   # Bp
            "0.1",                     # KH
            color,                     # color1
            "1",                       # alpha1
            "0xFFFFFF",                # color2
            "1",                       # alpha2
            "0xFFFFFF",                # color3
            "1",                       # alpha3
            "0xFFFFFF",                # color4
            "1",                       # alpha4
            "0.4",                     # friction
            "0.3",                     # restitution
            "",                        # JPN
            "",                        # CHN
            "",                        # TW
            "",                        # KR
            "0",                       # Solk
            "0",                       # MOH
            "0",                       # KOH
            "0",                       # MH
            "0"                        # PTN
        ]
        rows.append(row)
    
    # Write CSV
    with open('/home/codespace/projects/chemist-lab-enhanced/all_realistic_compounds.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(header)
        writer.writerows(rows)
    
    print(f"Generated {len(rows)} compounds with realistic data")

if __name__ == '__main__':
    generate_csv()

# Additional compounds for full coverage
def add_more():
    more_compounds = {
        # More alkanes
        "Hexacosane": {"color": "0xFFFFFF", "mp": 56.6, "bp": 412, "density": 0.78, "mm": 366.73, "state": "Solid"},
        "Octacosane": {"color": "0xFFFFFF", "mp": 64.5, "bp": 442, "density": 0.78, "mm": 394.76, "state": "Solid"},
        "Triacontane": {"color": "0xFFFFFF", "mp": 65.8, "bp": 449.7, "density": 0.79, "mm": 422.81, "state": "Solid"},
        # More alkenes
        "Decene": {"color": "0xFFFFFF", "mp": -74, "bp": 170.6, "density": 0.74, "mm": 140.23, "state": "Liquid"},
        "Undecene": {"color": "0xFFFFFF", "mp": -49, "bp": 190.5, "density": 0.75, "mm": 154.25, "state": "Liquid"},
        "Dodecene": {"color": "0xFFFFFF", "mp": -35, "bp": 213.4, "density": 0.76, "mm": 168.28, "state": "Liquid"},
        # More alcohols
        "Hexanol": {"color": "0xFFFFFF", "mp": -52, "bp": 157, "density": 0.82, "mm": 102.17, "state": "Liquid"},
        "Heptanol": {"color": "0xFFFFFF", "mp": -34, "bp": 176, "density": 0.82, "mm": 116.2, "state": "Liquid"},
        "Octanol": {"color": "0xFFFFFF", "mp": -15, "bp": 195, "density": 0.83, "mm": 130.23, "state": "Liquid"},
        "Nonanol": {"color": "0xFFFFFF", "mp": -5, "bp": 214, "density": 0.83, "mm": 144.25, "state": "Liquid"},
        # More aldehydes
        "Valeraldehyde": {"color": "0xFFFFFF", "mp": -91, "bp": 103.6, "density": 0.81, "mm": 86.13, "state": "Liquid"},
        "Caproaldehyde": {"color": "0xFFFFFF", "mp": -56, "bp": 131, "density": 0.83, "mm": 100.16, "state": "Liquid"},
        "Heptaldehyde": {"color": "0xFFFFFF", "mp": -43, "bp": 155, "density": 0.85, "mm": 114.18, "state": "Liquid"},
        # More ketones
        "Methyl Isobutyl Ketone": {"color": "0xFFFFFF", "mp": -84, "bp": 116.5, "density": 0.8, "mm": 100.16, "state": "Liquid"},
        "Cyclohexanone": {"color": "0xFFFFFF", "mp": -16.4, "bp": 155, "density": 0.95, "mm": 98.14, "state": "Liquid"},
        "Cyclopentanone": {"color": "0xFFFFFF", "mp": -51, "bp": 130.6, "density": 0.95, "mm": 84.12, "state": "Liquid"},
        # More acids
        "Caproic Acid": {"color": "0xFFFFFF", "mp": -3, "bp": 205, "density": 0.93, "mm": 116.16, "state": "Liquid"},
        "Enanthic Acid": {"color": "0xFFFFFF", "mp": 7.5, "bp": 223, "density": 0.92, "mm": 130.18, "state": "Liquid"},
        "Caprylic Acid": {"color": "0xFFFFFF", "mp": 16.7, "bp": 239, "density": 0.91, "mm": 144.21, "state": "Liquid"},
        "Pelargonic Acid": {"color": "0xFFFFFF", "mp": 12.5, "bp": 254, "density": 0.9, "mm": 158.24, "state": "Liquid"},
        "Capric Acid": {"color": "0xFFFFFF", "mp": 31.6, "bp": 270, "density": 0.89, "mm": 172.26, "state": "Solid"},
        "Lauric Acid": {"color": "0xFFFFFF", "mp": 44.2, "bp": 299, "density": 0.87, "mm": 200.32, "state": "Solid"},
        "Myristic Acid": {"color": "0xFFFFFF", "mp": 54.4, "bp": 326, "density": 0.86, "mm": 228.37, "state": "Solid"},
        "Palmitic Acid": {"color": "0xFFFFFF", "mp": 62.9, "bp": 351, "density": 0.85, "mm": 256.42, "state": "Solid"},
        "Stearic Acid": {"color": "0xFFFFFF", "mp": 69.3, "bp": 376, "density": 0.84, "mm": 284.48, "state": "Solid"},
        # More amines
        "Propylamine": {"color": "0xFFFFFF", "mp": -83, "bp": 48, "density": 0.72, "mm": 59.11, "state": "Liquid"},
        "Isopropylamine": {"color": "0xFFFFFF", "mp": -95.2, "bp": 31.7, "density": 0.69, "mm": 59.11, "state": "Liquid"},
        "Butylamine": {"color": "0xFFFFFF", "mp": -78, "bp": 77.8, "density": 0.74, "mm": 73.14, "state": "Liquid"},
        "Sec-Butylamine": {"color": "0xFFFFFF", "mp": -104, "bp": 63, "density": 0.73, "mm": 73.14, "state": "Liquid"},
        "Tert-Butylamine": {"color": "0xFFFFFF", "mp": -67, "bp": 44.4, "density": 0.7, "mm": 73.14, "state": "Liquid"},
        # More halides
        "Tetrachloroethylene": {"color": "0xFFFFFF", "mp": -22.3, "bp": 121.1, "density": 1.62, "mm": 165.83, "state": "Liquid"},
        "Trichloroethylene": {"color": "0xFFFFFF", "mp": -84.8, "bp": 87.2, "density": 1.46, "mm": 131.4, "state": "Liquid"},
        "Bromoform": {"color": "0xFFFFDD", "mp": 8.1, "bp": 149.5, "density": 2.89, "mm": 252.73, "state": "Liquid"},
        "Iodoform": {"color": "0xFFFF00", "mp": 119, "bp": 218, "density": 4.0, "mm": 393.73, "state": "Solid"},
        "Methylene Chloride": {"color": "0xFFFFFF", "mp": -97.4, "bp": 40, "density": 1.33, "mm": 84.93, "state": "Liquid"},
        # More inorganic
        "Sodium Phosphate": {"color": "0xFFFFFF", "mp": 1340, "bp": 0, "density": 2.54, "mm": 163.94, "state": "Solid"},
        "Trisodium Phosphate": {"color": "0xFFFFFF", "mp": 1583, "bp": 0, "density": 2.57, "mm": 163.94, "state": "Solid"},
        "Sodium Tripolyphosphate": {"color": "0xFFFFFF", "mp": 622, "bp": 0, "density": 2.52, "mm": 367.86, "state": "Solid"},
        "Sodium Pyrophosphate": {"color": "0xFFFFFF", "mp": 988, "bp": 0, "density": 2.84, "mm": 221.94, "state": "Solid"},
        "Barium Carbonate": {"color": "0xFFFFFF", "mp": 1740, "bp": 0, "density": 4.29, "mm": 197.34, "state": "Solid"},
        "Strontium Carbonate": {"color": "0xFFFFFF", "mp": 1494, "bp": 0, "density": 3.5, "mm": 147.63, "state": "Solid"},
        "Lithium Carbonate": {"color": "0xFFFFFF", "mp": 723, "bp": 1310, "density": 2.11, "mm": 73.89, "state": "Solid"},
        "Lithium Chloride": {"color": "0xFFFFFF", "mp": 605, "bp": 1382, "density": 2.07, "mm": 42.39, "state": "Solid"},
        "Lithium Hydroxide": {"color": "0xFFFFFF", "mp": 462, "bp": 924, "density": 1.45, "mm": 23.95, "state": "Solid"},
        "Sodium Hypochlorite": {"color": "0xFFFFFF", "mp": -6, "bp": 96, "density": 1.11, "mm": 74.44, "state": "Liquid"},
        "Calcium Hypochlorite": {"color": "0xFFFFFF", "mp": 100, "bp": 0, "density": 2.35, "mm": 142.98, "state": "Solid"},
        "Sodium Chlorate": {"color": "0xFFFFFF", "mp": 248, "bp": 0, "density": 2.49, "mm": 106.44, "state": "Solid"},
        "Potassium Chlorate": {"color": "0xFFFFFF", "mp": 356, "bp": 400, "density": 2.32, "mm": 122.55, "state": "Solid"},
        "Sodium Perborate": {"color": "0xFFFFFF", "mp": 60, "bp": 0, "density": 1.73, "mm": 99.81, "state": "Solid"},
        # More oxides
        "Lead Dioxide": {"color": "0x000000", "mp": 290, "bp": 0, "density": 9.38, "mm": 239.2, "state": "Solid"},
        "Tin Dioxide": {"color": "0xFFFFFF", "mp": 1127, "bp": 1800, "density": 6.95, "mm": 150.71, "state": "Solid"},
        "Nickel Oxide": {"color": "0x000000", "mp": 1955, "bp": 2600, "density": 6.72, "mm": 74.69, "state": "Solid"},
        "Cobalt Oxide": {"color": "0x000000", "mp": 1935, "bp": 0, "density": 6.11, "mm": 74.93, "state": "Solid"},
        "Manganese Oxide": {"color": "0x000000", "mp": 1945, "bp": 0, "density": 5.37, "mm": 70.94, "state": "Solid"},
        "Chromium Trioxide": {"color": "0x8B0000", "mp": 196, "bp": 251, "density": 2.7, "mm": 99.99, "state": "Solid"},
        "Arsenic Trioxide": {"color": "0xFFFFFF", "mp": 315, "bp": 465, "density": 3.74, "mm": 197.84, "state": "Solid"},
        "Antimony Trioxide": {"color": "0xFFFFFF", "mp": 656, "bp": 1550, "density": 5.58, "mm": 291.52, "state": "Solid"},
        "Bismuth Trioxide": {"color": "0xFFFF00", "mp": 825, "bp": 1890, "density": 8.9, "mm": 291.96, "state": "Solid"},
        # More sulfides
        "Antimony Sulfide": {"color": "0xFF6600", "mp": 550, "bp": 0, "density": 4.64, "mm": 339.68, "state": "Solid"},
        "Arsenic Sulfide": {"color": "0xFFFF00", "mp": 320, "bp": 0, "density": 3.43, "mm": 246.04, "state": "Solid"},
        "Bismuth Sulfide": {"color": "0x000000", "mp": 775, "bp": 0, "density": 6.78, "mm": 514.16, "state": "Solid"},
        # More nitrates
        "Lead Nitrate": {"color": "0xFFFFFF", "mp": 470, "bp": 0, "density": 4.53, "mm": 331.2, "state": "Solid"},
        "Zinc Nitrate": {"color": "0xFFFFFF", "mp": 36, "bp": 0, "density": 2.07, "mm": 189.4, "state": "Solid"},
        "Magnesium Nitrate": {"color": "0xFFFFFF", "mp": 129, "bp": 330, "density": 1.46, "mm": 148.31, "state": "Solid"},
        "Ferric Nitrate": {"color": "0xFFFFFF", "mp": 47, "bp": 100, "density": 1.68, "mm": 241.86, "state": "Solid"},
        "Aluminum Nitrate": {"color": "0xFFFFFF", "mp": 72.8, "bp": 150, "density": 1.72, "mm": 212.99, "state": "Solid"},
        # More phosphates
        "Calcium Phosphate": {"color": "0xFFFFFF", "mp": 1670, "bp": 0, "density": 3.14, "mm": 310.18, "state": "Solid"},
        "Tricalcium Phosphate": {"color": "0xFFFFFF", "mp": 1670, "bp": 0, "density": 3.14, "mm": 310.18, "state": "Solid"},
        "Sodium Phosphate Monobasic": {"color": "0xFFFFFF", "mp": 100, "bp": 0, "density": 2.04, "mm": 119.98, "state": "Solid"},
        "Sodium Phosphate Dibasic": {"color": "0xFFFFFF", "mp": 35, "bp": 0, "density": 1.98, "mm": 141.96, "state": "Solid"},
        # More carbonates
        "Magnesium Carbonate": {"color": "0xFFFFFF", "mp": 990, "bp": 0, "density": 2.96, "mm": 84.31, "state": "Solid"},
        "Iron Carbonate": {"color": "0xFFFFFF", "mp": 0, "bp": 0, "density": 3.9, "mm": 115.86, "state": "Solid"},
        "Copper Carbonate": {"color": "0xFFFFFF", "mp": 200, "bp": 0, "density": 4.0, "mm": 123.55, "state": "Solid"},
        "Zinc Carbonate": {"color": "0xFFFFFF", "mp": 140, "bp": 0, "density": 4.4, "mm": 125.39, "state": "Solid"},
        # More sulfites
        "Calcium Sulfite": {"color": "0xFFFFFF", "mp": 600, "bp": 0, "density": 2.6, "mm": 120.17, "state": "Solid"},
        "Magnesium Sulfite": {"color": "0xFFFFFF", "mp": 200, "bp": 0, "density": 2.61, "mm": 104.37, "state": "Solid"},
        # More perchlorates
        "Sodium Perchlorate": {"color": "0xFFFFFF", "mp": 482, "bp": 0, "density": 2.52, "mm": 122.44, "state": "Solid"},
        "Potassium Perchlorate": {"color": "0xFFFFFF", "mp": 610, "bp": 0, "density": 2.52, "mm": 138.55, "state": "Solid"},
        "Ammonium Perchlorate": {"color": "0xFFFFFF", "mp": 240, "bp": 0, "density": 1.95, "mm": 117.49, "state": "Solid"},
        # More chromates
        "Potassium Chromate": {"color": "0xFFFF00", "mp": 792, "bp": 0, "density": 2.72, "mm": 194.19, "state": "Solid"},
        "Ammonium Dichromate": {"color": "0xFF4500", "mp": 180, "bp": 0, "density": 2.15, "mm": 252.07, "state": "Solid"},
        # More permanganates
        "Sodium Permanganate": {"color": "0x800080", "mp": 170, "bp": 0, "density": 2.47, "mm": 141.93, "state": "Solid"},
        "Barium Permanganate": {"color": "0x800080", "mp": 200, "bp": 0, "density": 3.1, "mm": 375.29, "state": "Solid"},
        # More complex inorganic
        "Sodium Tungstate": {"color": "0xFFFFFF", "mp": 698, "bp": 0, "density": 4.18, "mm": 293.82, "state": "Solid"},
        "Ammonium Molybdate": {"color": "0xFFFFFF", "mp": 0, "bp": 0, "density": 2.31, "mm": 196.01, "state": "Solid"},
        "Sodium Vanadate": {"color": "0xFFFFFF", "mp": 630, "bp": 0, "density": 2.87, "mm": 121.93, "state": "Solid"},
        # More organics
        "Tartaric Acid": {"color": "0xFFFFFF", "mp": 171, "bp": 0, "density": 1.76, "mm": 150.09, "state": "Solid"},
        "Malic Acid": {"color": "0xFFFFFF", "mp": 130, "bp": 0, "density": 1.61, "mm": 134.09, "state": "Solid"},
        "Fumaric Acid": {"color": "0xFFFFFF", "mp": 287, "bp": 290, "density": 1.63, "mm": 116.07, "state": "Solid"},
        "Maleic Acid": {"color": "0xFFFFFF", "mp": 138.5, "bp": 0, "density": 1.59, "mm": 116.07, "state": "Solid"},
        "Malonic Acid": {"color": "0xFFFFFF", "mp": 135.6, "bp": 0, "density": 1.62, "mm": 104.06, "state": "Solid"},
        "Succinic Acid": {"color": "0xFFFFFF", "mp": 188, "bp": 235, "density": 1.56, "mm": 118.09, "state": "Solid"},
        "Glutaric Acid": {"color": "0xFFFFFF", "mp": 99, "bp": 303, "density": 1.42, "mm": 132.12, "state": "Solid"},
        "Adipic Acid": {"color": "0xFFFFFF", "mp": 153, "bp": 265, "density": 1.36, "mm": 146.14, "state": "Solid"},
        "Pimelic Acid": {"color": "0xFFFFFF", "mp": 106, "bp": 212, "density": 1.33, "mm": 160.17, "state": "Solid"},
        "Suberic Acid": {"color": "0xFFFFFF", "mp": 142, "bp": 230, "density": 1.27, "mm": 174.2, "state": "Solid"},
        "Azelaic Acid": {"color": "0xFFFFFF", "mp": 106.5, "bp": 286, "density": 1.23, "mm": 188.22, "state": "Solid"},
        "Sebacic Acid": {"color": "0xFFFFFF", "mp": 134.5, "bp": 294.5, "density": 1.21, "mm": 202.25, "state": "Solid"},
        "Phthalic Acid": {"color": "0xFFFFFF", "mp": 210, "bp": 0, "density": 1.59, "mm": 166.13, "state": "Solid"},
        "Isophthalic Acid": {"color": "0xFFFFFF", "mp": 345, "bp": 0, "density": 1.52, "mm": 166.13, "state": "Solid"},
        "Terephthalic Acid": {"color": "0xFFFFFF", "mp": 300, "bp": 0, "density": 1.51, "mm": 166.13, "state": "Solid"},
        # More sugars
        "Arabinose": {"color": "0xFFFFFF", "mp": 160, "bp": 0, "density": 1.59, "mm": 150.13, "state": "Solid"},
        "Ribose": {"color": "0xFFFFFF", "mp": 87, "bp": 0, "density": 1.53, "mm": 150.13, "state": "Solid"},
        "Xylose": {"color": "0xFFFFFF", "mp": 153, "bp": 0, "density": 1.53, "mm": 150.13, "state": "Solid"},
        "Mannose": {"color": "0xFFFFFF", "mp": 133, "bp": 0, "density": 1.54, "mm": 180.16, "state": "Solid"},
        "Galactose": {"color": "0xFFFFFF", "mp": 168, "bp": 0, "density": 1.54, "mm": 180.16, "state": "Solid"},
        "Sorbitol": {"color": "0xFFFFFF", "mp": 97, "bp": 296, "density": 1.49, "mm": 182.17, "state": "Solid"},
        "Mannitol": {"color": "0xFFFFFF", "mp": 166, "bp": 0, "density": 1.52, "mm": 182.17, "state": "Solid"},
        "Xylitol": {"color": "0xFFFFFF", "mp": 93, "bp": 216, "density": 1.52, "mm": 152.15, "state": "Solid"},
    }
    return more_compounds
