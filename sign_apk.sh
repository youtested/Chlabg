#!/bin/bash
# APK Signing Script - Uses SHA384withRSA with chemist.keystore
# Usage: ./sign_apk.sh <input.apk> <output.apk>

set -e

INPUT_APK="$1"
OUTPUT_APK="$2"
KEYSTORE="/home/codespace/projects/chemist-lab-enhanced/chemist.keystore"
KEYSTORE_PASS="android"
KEY_ALIAS="chemist"
TMP_DIR="/tmp/apk_sign_$$"

if [ -z "$INPUT_APK" ] || [ -z "$OUTPUT_APK" ]; then
    echo "Usage: $0 <input.apk> <output.apk>"
    exit 1
fi

if [ ! -f "$INPUT_APK" ]; then
    echo "Error: Input APK not found: $INPUT_APK"
    exit 1
fi

echo "=== APK Signing Workflow ==="
echo "Input:  $INPUT_APK"
echo "Output: $OUTPUT_APK"
echo "Key:    $KEY_ALIAS (SHA384withRSA)"
echo ""

# Step 1: Clean old META-INF (remove existing signatures)
echo "[1/4] Removing old signatures..."
mkdir -p "$TMP_DIR"
cd "$TMP_DIR"
unzip -q "$INPUT_APK" -d extracted
rm -rf extracted/META-INF

# Step 2: Re-zip without compression for alignment
echo "[2/4] Repackaging APK..."
cd "$TMP_DIR/extracted"
zip -q -r ../unsigned.apk .
cd ..

# Step 3: Align APK (4-byte alignment)
echo "[3/4] Aligning APK..."
zipalign -f -p 4 unsigned.apk aligned.apk 2>/dev/null || {
    echo "  zipalign not available, skipping alignment..."
    cp unsigned.apk aligned.apk
}

# Step 4: Sign with apksigner
echo "[4/4] Signing APK (SHA384withRSA)..."
apksigner sign \
    --ks "$KEYSTORE" \
    --ks-pass "pass:$KEYSTORE_PASS" \
    --key-pass "pass:$KEYSTORE_PASS" \
    --ks-key-alias "$KEY_ALIAS" \
    --v1-signing-enabled \
    --v2-signing-enabled \
    --v3-signing-enabled \
    --out "$OUTPUT_APK" \
    aligned.apk

# Cleanup
rm -rf "$TMP_DIR"

# Verify
echo ""
echo "=== Signing Complete ==="
echo "Output: $OUTPUT_APK"
apksigner verify -v "$OUTPUT_APK" 2>&1 | grep -E "Verified|scheme|Signer #"

echo ""
ls -lh "$OUTPUT_APK"
