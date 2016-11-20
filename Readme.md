# thisbounty.com Dev Env #

This repo contains tools for building a standard development environment used by programmers at thisbounty.com.

Right now it contains only a Dockerfile which provides node.js and npm on alpine linux. This helps in speeding up
setups.

## Installation (Windows 10 without Hyper-V enabled) ##

1. Install Docker. For windows, use docker toolbox (make sure you checked everything during selecting components)
   https://www.docker.com/products/docker-toolbox
2. Launch Kitematic (Alpha)
<br>
<img src="http://i.imgur.com/orDc2Tb.jpg">
<br>
   _I noticed some errors on newest builds of Windows 10. You can get this error when initializing for example_
   <img src="http://i.imgur.com/SvRtTLX.jpg">
   _In this case simple go with "USE VIRTUALBOX"_
3. Download this repository <br>
`git clone https://github.com/thisbounty/dev_env` <br>or just the Dockerfile file <br> https://raw.githubusercontent.com/thisbounty/dev_env/master/Dockerfile
3. Building image
<br>
According to this: https://github.com/docker/kitematic/issues/574
**unfortunately Kitematic still doesn't have GUI option to manage Dockerfiles, so we will have to operate it through "DOCKER CLI"**
<img src="http://i.imgur.com/HOGq31E.png">
Powershell will be opened. Move to directory where you downloaded the repository or just Dockerfile
<img src="http://i.imgur.com/Fd4U6jw.png">
Now let's create our image by executing this command:
<br>
`docker build -t img_thisbounty .`
<br>
Now close and launch once again Kitematic.
4. Creating container
<br>
Go to "My Images" and click "CREATE" on our "img_thisbounty" image.
If "My Images" tab is empty, PC restart could be necessary.
<br>
<img src="http://i.imgur.com/URl7Vk4.png">
5. Setting up volumes
<br>
Select our "img_thisbounty" container, go to Settings -> Volumes and click CHANGE on our /mnt volume.
Selected directory has to be located under your Users directory (X:\Users\<your_username>), I prefer to use your Documents directory (for example X:\Users\<your_username>\Documents\ThisBounty_repositiories). This directory should be main place where you will wokr on ThisBounty projects.
<img src="http://i.imgur.com/foCktgX.png">

Dockerfile copied from:
https://github.com/nodejs/docker-node
