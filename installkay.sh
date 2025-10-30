#!/bin/bash
# =========================================================
#  Tema Kay Installer — Ganti Background Panel Pterodactyl
# =========================================================

PANEL_PATH="/var/www/pterodactyl"
BG_URL="https://files.catbox.moe/nqabow.jpg"
TOKEN_BENAR="kay123"

echo "=== Installer Tema Kay ==="
read -p "Masukkan token: " TOKEN

if [ "$TOKEN" != "$TOKEN_BENAR" ]; then
    echo "❌ Token salah! Hubungi admin untuk token yang valid."
    exit 1
fi

echo "✅ Token valid! Memulai penggantian background panel..."

# Cek apakah folder panel ada
if [ ! -d "$PANEL_PATH" ]; then
  echo "❌ Folder panel tidak ditemukan di $PANEL_PATH"
  exit 1
fi

# Masuk ke folder panel
cd $PANEL_PATH

# Download gambar background baru
echo "⬇️ Mengunduh background baru..."
mkdir -p public/assets/images
curl -L -o public/assets/images/bg.jpg "$BG_URL"

# Ubah CSS background
echo "🧩 Menambahkan background ke CSS..."
CSS_FILE="resources/scripts/index.css"

if [ ! -f "$CSS_FILE" ]; then
  echo "❌ File CSS tidak ditemukan di $CSS_FILE"
  exit 1
fi

# Tambahkan CSS custom background
cat <<EOF >> $CSS_FILE

/* === Tema Kay Custom Background === */
body {
  background: url('/assets/images/bg.jpg') no-repeat center center fixed !important;
  background-size: cover !important;
}
EOF

# Build ulang panel agar CSS diterapkan
echo "⚙️ Membangun ulang panel..."
npm run build:production

echo "✅ Tema Kay berhasil dipasang!"
echo "🎨 Background panel sudah diganti ke gambar: $BG_URL"
