#!/bin/bash
# tModLoader installer by lando
# www.steamcommunity.com/id/Strikezes

if [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Please install wget and try again."
    echo "You can do this by opening another terminal and typing in:"
    echo "sudo apt-get install wget"
    exit
fi

if [ $(dpkg-query -W -f='${Status}' unzip 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo "Please install unzip and try again."
    echo "You can do this by opening another terminal and typing in:"
    echo "sudo apt-get install unzip"
    exit
fi

RED='\033[0;31m' # Red
NC='\033[0m' # No Color
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
export PATH=$PATH:~/
echo -e "${PURPLE}tModLoader installer - by lando${NC}"
echo -e "${PURPLE}www.steamcommunity.com/id/Strikezes${NC}"
echo -e "\033[33mIf you are using this software in conjuction with a pirated/cracked copy of Terraria, don't expect this to work. Don't waste my time and ask for help.\033[0m"
echo -e "${RED}If you already have a tModLoader at the home directory, I will move it to your documents folder.${NC}"
echo -e "${RED}By using this software, you agree to the TModLoader disclaimer and agreements${NC}"
echo -e "TModLoader disclaimer and agreement is as follows:${NC}"
echo -e " - By downloading tModLoader, you agree to everything in this disclaimer and agreements."
echo -e " - I am not responsible for anything that happens to your computer if you download tModLoader. Common sense stuff."
echo -e " - Do not use tModLoader to do anything that breaks the Terraria Forums rules. In other words, the rules for making and sharing mods are the same as the rules for sharing mods on these forums; no removed items, no console content, etc."
echo -e " - Mods uploaded through the Mod Browser are tagged with your Steam username, so we will know if you do something bad."
echo -e " - You are allowed to mod tModLoader (similar to how tModLoader is a mod of Terraria), given that you provide a link to this thread."
echo -n "Do you agree and wish to install? (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo Yes
elif echo "$answer" | grep -iq "^n" ;then
    echo No;
exit
else
  echo "Please choose a valid option"
exit
fi
mv ~/tModLoader ~/Documents
mkdir ~/tModLoader
cd ~/tModLoader
echo "Getting tModLoader files..."
wget https://github.com/blushiemagic/tModLoader/releases/download/v0.10.1.4/tModLoader.Linux.v0.10.1.4.zip > /dev/null
echo "Done!"
unzip tModLoader.Linux.v0.10.1.4.zip
echo "Moving original Terraria.exe to Documents/TerrariaBackup"
mkdir ~/Documents/TerrariaBackup
mv ~/.steam/steam/steamapps/common/Terraria/Terraria.exe ~/Documents/TerrariaBackup
mv Terraria.exe ~/.steam/steam/steamapps/common/Terraria/
mv Ionic.Zip.Reduced.dll ~/.steam/steam/steamapps/common/Terraria
mv Terraria.exe.config ~/.steam/steam/steamapps/common/Terraria
mv Mono.Cecil.dll ~/.steam/steam/steamapps/common/Terraria
mv tModLoaderServer ~/.steam/steam/steamapps/common/Terraria
mv MP3Sharp.dll ~/.steam/steam/steamapps/common/Terraria
mv tModLoaderServer.bin.x86 ~/.steam/steam/steamapps/common/Terraria
mv tModLoaderServer.bin.x86_64 ~/.steam/steam/steamapps/common/Terraria
mv tModLoaderServer.exe ~/.steam/steam/steamapps/common/Terraria
mv ModCompile ~/.steam/steam/steamapps/common/Terraria
echo "tModLoader successfully installed!"
exit
