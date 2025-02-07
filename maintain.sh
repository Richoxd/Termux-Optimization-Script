#!/data/data/com.termux/files/usr/bin/bash

echo "📌 Starting Termux Full Maintenance Script..."
echo "--------------------------------------------"

# Ensure storage permissions
echo "🔍 Checking storage access..."
termux-setup-storage

# Update package lists
echo "🔄 Updating package lists..."
pkg update -y && pkg upgrade -y

# Clean up broken dependencies
echo "🔧 Fixing broken packages..."
apt --fix-broken install -y

# Remove unnecessary packages
echo "🗑️ Cleaning unnecessary packages..."
pkg autoclean && pkg clean

# Remove orphaned dependencies
echo "🧹 Removing unused dependencies..."
pkg autoremove -y

# Reset Termux cache
echo "🗄️ Clearing Termux cache..."
rm -rf /data/data/com.termux/cache/*

# Fix and optimize storage
echo "🛠️ Fixing storage and dependencies..."
dpkg --configure -a

# Check disk space usage
echo "📊 Checking disk space usage..."
df -h

# Verify installation integrity
echo "🔍 Verifying installed packages..."
pkg check

# Restart Termux for changes to take effect
echo "♻️ Restarting Termux..."
killall com.termux

echo "✅ Maintenance Completed! Termux is now optimized."
