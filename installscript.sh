
#create the catkin workspace and src folder
#mkdir -p ~/catkin_ws/src 


#move to the workspace folder
#cd ~/catkin_ws/

#install catkin tools. This allows you to use "catkin build" instead of "catkin_make"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install python-catkin-tools

cd ~/catkin_ws/

#inside catkin_ws build the workspace
catkin build

#move to the src folder
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

#Install VIM
sudo apt-get install vim

#Install Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

sudo apt-get update 
sudo apt-get install google-chrome-stable
	
