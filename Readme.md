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
**unfortunately Kitematic still doesn't have GUI option to manage Dockerfiles, so you will have to operate it through "DOCKER CLI"**
<img src="http://i.imgur.com/HOGq31E.png">
Powershell will be opened. Move to directory where you downloaded the repository or just Dockerfile
<img src="http://i.imgur.com/Fd4U6jw.png">
Now let's create our image by executing one of these commands:
<br>
`docker build -f Dockerfile_front -t img_thisbounty_front .`
<br>
To build Frontend image or:
<br>
`docker build -f Dockerfile_back -t img_thisbounty_back .`
<br>
To build Backend image
<br>
<br>
Now close and launch once again Kitematic.
4. Creating container
<br>
Go to "My Images" and click "CREATE" on our "img_thisbounty_front" or "img_thisbounty_back image.
If "My Images" tab is empty, PC restart could be necessary.
<br>
<img src="http://i.imgur.com/URl7Vk4.png">
5. Setting up volumes
<br>
Select our "img_thisbounty" container, go to Settings -> Volumes and click CHANGE on our /mnt volume.
Selected directory <b>has to be located under your Users directory</b> (X:\Users\<your_username>), I prefer to use your Documents directory (for example X:\Users\<your_username>\Documents\ThisBounty_repositiories). This directory should be main place where you will work on ThisBounty projects.
<img src="http://i.imgur.com/foCktgX.png">

## Configuring container to work with ThisBounty projects ##

1. Installing necessary software
<br>
Open our container's console
<br>
<img src="http://i.imgur.com/kpcMOWK.png">
<br>
To operate with our projects, you have to install <b>git</b>, <b>python</b>, <b>g++ compiller</b> and depends which project you are going to collaborate: <br>
<b>gulp</b> - if you are going to work on frontend
<br>
<b>grunt</b> - if you are going to work on backend
<br>
Please run this all-in-one command.
<br>
`apk update && apk upgrade && apk add make && apk add python && apk add g++ && apk add git && npm install -g gulp && npm install -g grunt`
<br>
After this, you can easily access ThisBounty projects. For example:
<br>
<b>Frontend repository</b>
<br>
`cd /mnt && git clone https://github.com/thisbounty/WebRTC-Frontend.git && cd WebRTC-Frontend && npm install --no-bin-links && npm install gulp --no-bin-links`
<br>
<b>Backend repository</b>
<br>
`cd /mnt && git clone https://github.com/thisbounty/WebRTC-API.git && cd WebRTC-API && npm install --no-bin-links && npm install grunt --no-bin-links`

2. Connecting between container and Windows
<br>
Docker has created virtual network to communicate between container and Windows. All services are hosted on special IP address range, you can access them by opening Ports tab.
<br>
<img src="http://i.imgur.com/phFx2RE.png">


Dockerfile copied from:
https://github.com/nodejs/docker-node
