#!/bin/bash

# CIS Hardening Script - Partial Remediation for RHEL 10
# WARNING: This script makes system changes. Test thoroughly before use in production.

echo "Starting CIS Hardening Remediation..."

# 1. Ensure permissions on /etc/crontab are configured (CIS 5.1.2)
echo "Setting permissions for /etc/crontab..."
sudo chmod 600 /etc/crontab
sudo chown root:root /etc/crontab

# 2. Ensure permissions on /etc/ssh/sshd_config are configured (CIS 5.3.1)
echo "Setting permissions for /etc/ssh/sshd_config..."
sudo chmod 600 /etc/ssh/sshd_config
sudo chown root:root /etc/ssh/sshd_config

# 3. Ensure cron daemon is enabled and running (CIS 5.1.1)
echo "Ensuring cron daemon is enabled and running..."
sudo systemctl enable crond
sudo systemctl start crond

# 4. Disable unnecessary services (example: cups - Common Unix Printing System)
#    Identify and disable services not required for your system's function.
echo "Disabling CUPS service if not needed..."
sudo systemctl disable cups --now

# 5. Restrict access to 'at' command (CIS 5.1.9)
#    Create /etc/at.allow and add authorized users.
echo "Restricting 'at' command access..."
sudo touch /etc/at.allow
sudo chmod 600 /etc/at.allow
sudo chown root:root /etc/at.allow
# Add authorized users to /etc/at.allow as needed:
# echo "username" >> /etc/at.allow

echo "CIS Hardening Remediation Complete (Partial)."
