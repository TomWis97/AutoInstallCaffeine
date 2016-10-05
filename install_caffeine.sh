#!/usr/bin/env bash
#TODO Check if Caffeine is already installed.
# Source: http://bernaerts.dyndns.org/linux/76-gnome/345-gnome-shell-install-remove-extension-command-line-script

# Set variables so we can easily change them if necessary.
install_path="$HOME/.local/share/gnome-shell/extensions"
#gnome_version="$(DISPLAY=":0" gnome-shell --version | tr -cd "0-9.")"
extensions_site="https://extensions.gnome.org"
# Setting variables 
extension_id="517"
extension_uuid="caffeine@patapon.info"
extension_downloadurl="/download-extension/caffeine@patapon.info.shell-extension.zip?version_tag=5712"
# Done setting variables.
echo "Gnome version $gnome_version found."
# Download zip.
wget -O /tmp/caffeine-extension.zip "$extensions_site$extension_downloadurl"
# Create directory.
mkdir -p "$install_path/$extension_uuid"
# Extract zip to install location.
unzip -op /tmp/caffeine-extension.zip "$install_path/$extension_uuid"
# Delete temporary zip.
rm /tmp/caffeine-extension.zip
#After we're done, we'll need to restart Gnome.
gnome-shell --replace &
