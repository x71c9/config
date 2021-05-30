##### INSTALL EGPU ON ELEMENTARY OS

https://elementaryos.stackexchange.com/questions/26197/can-i-use-an-egpu-with-elementary-os-and-if-so-how-do-i-set-it-up

```
sudo apt install bolt

sudo apt install software-properties-common

sudo add-apt-repository ppa:hertg/egpu-switcher
sudo apt update
sudo apt install egpu-switcher

sudo egpu-switcher setup

sudo egpu-switcher config
```
When prompted with `Would you like to define a specific INTERNAL GPU? (not recommended)`, confirm with `Y`. I didn't do this initially and things didn't work. Only after explicitly configuring the internal and external GPU, it started working. This may be different for you though.


Now you should be good to go. Connect the monitor to the eGPU and make the switch:
```
sudo egpu-switcher switch egpu
```
Reboot your machine.

If you don't see anything on the external monitor, hit `super + p` a few times until your monitor lights up.
