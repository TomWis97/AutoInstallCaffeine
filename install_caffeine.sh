#!/usr/bin/env bash
# Automatically install and permanently activate the Caffeine Gnome extension.
# Author:  Tom Wishaupt
# Date:    6-10-2016
# Version: 0.1
# Notes:   This script uses a hardcoded download URL. If the current version is not
#          is not compatible the the shell version you're running, update the URL.
#          Currently uses gsettings. Although it should still work, updating to dconf
#          is adviseable.
#
#TODO Check if Caffeine is already installed.
#TODO Use dconf instead of gsettings.
# Source: http://bernaerts.dyndns.org/linux/76-gnome/345-gnome-shell-install-remove-extension-command-line-script

# Set variables so we can easily change them if necessary.
extension_uuid="caffeine@patapon.info"
extension_downloadurl="/download-extension/caffeine@patapon.info.shell-extension.zip?version_tag=5712"
install_path="$HOME/.local/share/gnome-shell/extensions"
extensions_site="https://extensions.gnome.org"
# Done setting variables.
echo "Gnome version $gnome_version found."
# Download zip to /tmp.
wget -O /tmp/caffeine-extension.zip "$extensions_site$extension_downloadurl"
# Create directory.
mkdir -p "$install_path/$extension_uuid"
# Extract zip to install location.
unzip -o /tmp/caffeine-extension.zip -d "$install_path/$extension_uuid"
# Delete temporary zip.
rm /tmp/caffeine-extension.zip

# Enable extension
# list enabled extensions
ext_list=$(gsettings get org.gnome.shell enabled-extensions | sed 's/^.\(.*\).$/\1/')

# If extension not already enabled, declare it
ext_enabled=$(echo ${ext_list} | grep ${extension_uuid})
[ "$ext_enabled" = "" ] && gsettings set org.gnome.shell enabled-extensions "[${ext_list},'${extension_uuid}']"

#After we're done, restart Gnome.
gnome-shell --replace &
