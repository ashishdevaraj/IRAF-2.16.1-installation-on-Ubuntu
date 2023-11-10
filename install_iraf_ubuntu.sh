#!/bin/bash
#Copyright 2023 Ashish Devaraj
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

echo "Starting to Install IRAF version 2.16.1"

echo "******************** Installing Useful Packages ********************"
sudo apt-get install tcsh libxss1 lib32z1 lib32ncurses5
sudo apt-get install lib32stdc++6
sudo apt-get install libbz2-1.0:i386
sudo apt-get install tcsh
sudo apt-get install libxmu6:i386
sudo apt-get install libncurses5:i386
sudo apt-get install libncurses5


echo " Done with installing dependencies!!"

echo "********************** Setting up Directories **********************"
sudo mkdir /iraf
sudo mkdir /iraf/iraf
sudo cp ~/install_IRAF_ubuntu/iraf.lnux.x86_64.tar.gz /iraf/iraf/.
cd /iraf/iraf
sudo tar -zxvf iraf.lnux.x86_64.tar.gz
sudo rm iraf.lnux.x86_64.tar.gz

echo " Done !!"

echo "*********************** Installing Softwares ************************"
echo "Installing IRAF"
echo "Keep hitting Enter for all prompts."
sudo ./install

echo "*********************** Installing x11iraf-v2 ************************"
sudo mkdir /iraf/x11iraf
cd /iraf/x11iraf
sudo cp ~/install_IRAF_ubuntu/x11iraf-v2.0BETA-bin.linux.tar.gz /iraf/x11iraf/.
#sudo wget http://iraf.noao.edu/iraf/ftp/iraf/x11iraf/x11iraf-v2.0BETA-bin.linux.tar.gz
sudo tar -zxvf x11iraf-v2.0BETA-bin.linux.tar.gz
sudo rm x11iraf-v2.0BETA-bin.linux.tar.gz

echo "Keep hitting Enter for all prompts."
sudo ./install
 
cd ~
#wget http://www.astronomy.ohio-state.edu/~khan/iraf/iraf
sudo cp ~/install_IRAF_ubuntu/iraf ~
echo "Select 'xgterm' as your IRAF shell when prompted."
sudo chmod u=rwx iraf
#mkdir IRAF
#cd IRAF
mkiraf

echo "********************** Completed Installation ************************"

read -p " Do you want me to set up an IRAF Environment variable for you? (yes/no): " choice

if [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]; then
    echo "**************** Setting up Environment variable *********************"
    #sudo cp ~/install_IRAF_ubuntu/iraf /usr/bin/iraf

    clear
    echo "**************** Woohoo! its Done! *********************"
    echo " The IRAF version 2.16.1 is sucessfully installed on your system."
    echo " Please open a fresh terminal and type 'iraf' to start your data reduction."
    echo -e "\n Thank you!"
    echo " ***"
else
    clear
    echo "**************** Woohoo! its Done! *********************"
    echo " The IRAF version 2.16.1 is sucessfully installed on your system."
    echo -e "\n Thank you!"
    echo " ***"
fi

