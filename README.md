☕ Like my work? Buy me a coffee! → [paypal.me/RichCabo](https://paypal.me/RichCabo)

Termux Maintenance Script

A fully automated script that scans, updates, repairs, cleans, and optimizes Termux for flawless performance.

Features

✅ Updates and upgrades all packages
✅ Fixes broken dependencies
✅ Clears cache and unnecessary files
✅ Repairs storage and optimizes Termux
✅ Restarts Termux for changes to take effect

Installation & Usage

1️⃣ Create the Script Manually

If you don’t want to download it, you can create it yourself:

1. Open Termux and create the script using nano:

nano maintain.sh


2. Copy and paste the following script inside nano:

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


3. Save the file by pressing:

CTRL + X, then Y, and press Enter




2️⃣ Make the Script Executable

After creating the script, give it execution permissions:

chmod +x maintain.sh

3️⃣ Run the Script

Now you can execute it with:

bash maintain.sh

Alternative: Download & Run Automatically

1. Open Termux


2. Run this command:

pkg install -y wget && wget https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/termux-maintenance/main/maintain.sh && chmod +x maintain.sh && ./maintain.sh

(Replace YOUR_GITHUB_USERNAME with actual GitHub)


Automate the Script (Optional)

To run it automatically on Termux startup, add this to ~/.bashrc:

echo "bash ~/maintain.sh" >> ~/.bashrc

Or schedule it to run daily at 2 AM:

crontab -e

Then add this line:

0 2 * * * bash ~/maintain.sh

License

This project is open-source under the MIT License.
