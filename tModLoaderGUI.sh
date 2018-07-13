#!/bin/bash
# tModLoader installer GUI - by lando
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
sudo apt-get --assume-yes install kdebase-bin

kdialog --title "tModLoader Installer" --textbox agreement.txt 512 256
dbusRef=`kdialog --progressbar "Initializing" 3`
qdbus $dbusRef Set "" value 1
qdbus $dbusRef setLabelText "Downloading tModLoader"
qdbus $dbusRef Set "" value 2
mkdir ~/Documents/tModLoader-files
cd ~/Documents/tModLoader-files
wget https://github.com/blushiemagic/tModLoader/releases/download/v0.10.1.5/tModLoader.Linux.v0.10.1.5.zip
qdbus $dbusRef Set "" value 3
qdbus $dbusRef setLabelText "Extracting tModLoader"
unzip tModLoader.Linux.v0.10.1.5.zip
qdbus $dbusRef setLabelText "Moving files..."
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
qdbus $dbusRef close
kdialog --textbox done.txt 512 256
