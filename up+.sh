#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
# Website   : https://www.erikdubois.be
# Website   : https://www.alci.online
# Website   : https://www.ariser.eu
# Website   : https://www.arcolinux.info
# Website   : https://www.arcolinux.com
# Website   : https://www.arcolinuxd.com
# Website   : https://www.arcolinuxb.com
# Website   : https://www.arcolinuxiso.com
# Website   : https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

workdir=$(pwd)

#remove content
rm $workdir/root/usr/share/on-the-road/packages/*

echo "getting latest /etc/pacman.conf"
wget https://raw.githubusercontent.com/arcolinux/arcolinuxl-iso/master/archiso/airootfs/etc/pacman.conf -O $workdir/root/usr/share/on-the-road/pacman.conf

#get latest archlinux-keyring
wget https://archlinux.org/packages/core/any/archlinux-keyring/download --content-disposition -P $workdir/root/usr/share/on-the-road/packages/

#get latest archlinux-keyring
wget https://archlinux.org/packages/community/x86_64/alacritty/download/ --content-disposition -P $workdir/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from ArcoLinux"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/arcolinux-keyring*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from ArcoLinux"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo/x86_64/arcolinux-mirror*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Mirror from XeroLinux"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/xerolinux-mirror*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from Garuda and EOS"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/chaotic-keyring*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from Garuda and EOS"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/endeavouros-keyring*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from Garuda and EOS"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/chaotic-mirror*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/

echo "Keyring and mirror from Garuda and EOS"
cp /home/erik/ARCO/ARCOLINUX-REPO/arcolinux_repo_3party/x86_64/endeavouros-mirror*pkg.tar.zst /home/erik/ARCO/ARCOLINUX/arcolinux-on-the-road/root/usr/share/on-the-road/packages/


# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

read input

# Committing to the local repository with a message containing the time details and commit text

git commit -m "$input"

# Push the local files to github

if grep -q main .git/config; then
	echo "Using main"
		git push -u origin main
fi

if grep -q master .git/config; then
	echo "Using master"
		git push -u origin master
fi

echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
