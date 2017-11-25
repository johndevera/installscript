###################### INSTALL ROS
chmod +x  rosscript
bash rosscript

###################### INSTALL GRID_MAP PACKAGES
sudo apt-get install ros-kinetic-octomap*

#create the catkin workspace and src folder
#mkdir -p ~/catkin_ws/src 


#move to the workspace folder
#cd ~/catkin_ws/

#install catkin tools. This allows you to use "catkin build" instead of "catkin_make"
#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
#wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install python-catkin-tools

#catkin should already be installed in ~/catkin_ws with catkin_tools after running the ROS script
cd ~/catkin_ws/src

#download each package to the src folder
git clone https://github.com/ethz-asl/elevation_mapping.git
git clone https://github.com/ethz-asl/kindr.git
git clone https://github.com/ethz-asl/kindr_ros.git
git clone https://github.com/ethz-asl/grid_map.git

#go to src folder
cd ..

#build dependencies
catkin build

#run unit tests - not all may have unit tests
catkin build elevation_mapping --no-deps --verbose --catkin-make-args run_tests
catkin build grid_map --no-deps --verbose --catkin-make-args run_tests
catkin build kindr --no-deps --verbose --catkin-make-args run_tests
catkin build kindr_ros --no-deps --verbose --catkin-make-args run_tests

###################### INSTALL HTOP
sudo apt-get install htop

###################### INSTALL VIM
sudo apt-get install vim

###################### INSTALL Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable

##################### INSTALL SUBLIME

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

##################### INSTALL SPOTIFY
##From website
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
# 3. Update list of available packages
sudo apt-get update
# 4. Install Spotify
sudo apt-get install spotify-client


##################### INSTALL VLC
sudo apt-get update
sudo apt-get install vlc browser-plugin-vlc




###################### CODE TO BE ADDED TO ~/.bashrc
echo 'source ~/Dropbox/devel/setup.bash' >> ~/.bashrc
echo 'export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/home/asblab/Dropbox/src/jaguar_gazebo/worlds/models' >> ~/.bashrc



