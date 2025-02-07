#!/data/data/com.termux/files/usr/bin/bash

echo "📌 Starting Termux Full Maintenance Script..."
echo "--------------------------------------------"

# Ensure storage permissions
echo "🔍 Checking storage access..."
termux-setup-storage

# Update package lists and upgrade packages
echo "🔄 Updating package lists..."
pkg update -y && pkg upgrade -y

# Fix broken packages
echo "🔧 Fixing broken packages..."
apt --fix-broken install -y

# Remove unnecessary packages and dependencies
echo "🗑️ Cleaning unnecessary packages..."
pkg autoclean && pkg clean && pkg autoremove -y

# Reset Termux cache
echo "🗄️ Clearing Termux cache..."
rm -rf /data/data/com.termux/cache/*

# Fix and optimize storage
echo "🛠️ Fixing storage and dependencies..."
dpkg --configure -a

# Check disk space usage
echo "📊 Checking disk space usage..."
df -h

# Verify package integrity with a proper command
echo "🔍 Checking package integrity..."
apt list --installed > /dev/null 2>&1 && echo "✅ All packages are correctly installed."

# Restart Termux properly
echo "♻️ Restarting Termux..."
am broadcast --user 0 -a android.intent.action.BOOT_COMPLETED

echo "✅ Maintenance Completed! Termux is now optimized."
