#!/bin/bash
# Tema Kay - Simple Background Changer
# Made by Rachel 💙

echo "🎨 Memulai pemasangan Tema Kay..."

PANEL_PATH="/var/www/pterodactyl/resources/scripts"
CSS_FILE="$PANEL_PATH/app.css"

if [ ! -f "$CSS_FILE" ]; then
    echo "❌ File panel tidak ditemukan! Pastikan ini server panel Pterodactyl."
    exit 1
fi

echo "🧩 Mengubah background panel..."
# Hapus background lama, tambahkan yang baru
sed -i '/body {/!b;n;c\  background: url("https://files.catbox.moe/nqabow.jpg") no-repeat center center fixed;\n  background-size: cover;' "$CSS_FILE"

echo "⚙️ Menyusun ulang aset..."
cd /var/www/pterodactyl
npm run build:production >/dev/null 2>&1

echo "✅ Tema Kay berhasil diterapkan!"
echo "Silakan refresh panel browser kamu."
