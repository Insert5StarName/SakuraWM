# SakuraWM: Sakura Window Manager
<p align="center">
    <img src="https://media.discordapp.net/attachments/848349994082893884/1105679752452386846/image.png?width=1098&height=618" style="width: 35%;" alt="wmlogo"></img>
</p>

**SakuraWM** is a personal fork of DWM extending a few features aiming to make it more usable and Stylish while sticking with the default bar design.


Features / Patches Included:
* Restartsig Patch so you don't have to fully restart your session.
* Dwindle + Gaps Layout
* Center Floating Windows
* Corner Resize allow resizing from all corners
* Actual Fullscreen
* System Tray
* Custom Patch for setting Barheight
* Custom Patch for splitting the Status (WM_NAME) into two parts replacing the Window Title

## Install
Edit config.mk to match your local setup (SakuraWM is installed into the /usr/local namespace by default).

Afterwards enter the following command to build and install SakuraWM (if
necessary as root):

    `make clean install`

