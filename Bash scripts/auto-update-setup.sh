#!/bin/bash

# Install unattended-upgrades package
sudo apt update
sudo apt install -y unattended-upgrades

# Create or modify the configuration for unattended-upgrades
cat <<EOL | sudo tee /etc/apt/apt.conf.d/50unattended-upgrades
// Automatically upgrade packages from these origins
Unattended-Upgrade::Allowed-Origins {
    "\${distro_id}:\${distro_codename}-security";
    "\${distro_id}:\${distro_codename}-updates";
    # Enable if you want to include all package repositories
    # "*:*";
};

// Remove unused dependencies after upgrades
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// Automatically reboot if required after upgrades
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
EOL

# Enable periodic updates in APT configuration
echo "Enabling periodic updates in APT..."
cat <<EOL | sudo tee /etc/apt/apt.conf.d/10periodic
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
EOL

# Restarting unattended-upgrades service to apply the changes
sudo systemctl restart unattended-upgrades

# Edit timer when apt update is running
echo "Edit timer when apt update is running"
sudo mkdir /etc/systemd/system/apt-daily.timer.d

cat <<EOL | sudo tee /etc/systemd/system/apt-daily.timer.d/override.conf
[Timer]
OnCalendar=
OnCalendar=*-*-* 01:00
RandomizedDelaySec=5m
EOL

# Edit timer when apt upgrade is running
echo "Edit timer when apt upgrade is running"
sudo mkdir /etc/systemd/system/apt-daily-upgrade.timer.d

cat <<EOL | sudo tee /etc/systemd/system/apt-daily-upgrade.timer.d/override.conf
[Timer]
OnCalendar=
OnCalendar=*-*-* 01:30
RandomizedDelaySec=5m
EOL

# Restarting apt-daily.timer and apt-daily-upgrade.timer service to apply the changes
sudo systemctl restart apt-daily.timer
sudo systemctl restart apt-daily-upgrade.timer
sudo systemctl daemon-reload
