### launchctl

The command `launchctl` (I believe it stands for launch-control)
controls the `launchd` deamon on MacOS.

Launchd handle Deamons and Agents.
- *Deamons* are services running by root or any other user regardless of the
logged user.
- *Agents* are services runnig by the current logged user.

Deamons and Agents can be loaded with `launchctl`

#### Control services
```
launchctl load /path/to/net.nbl7.servicename.plist
launchctl unload /path/to/net.nbl7.servicename.plist

launchctl start net.nbl7.servicename
launchctl stop net.nbl7.servicename
```
The command `start` accepts the `Label` tag value defined in
`/path/to/net.nbl7.servicename.plist`

In order to see if the process is loaded run:
```
launchctl list | grep net.nbl7
```


#### Checkl .plist syntax
```
plutil [filname]
```


#### Locations Plist file
https://ss64.com/osx/launchctl.html

`~/Library/LaunchAgents`  Per-user agents provided by the user.
`/Library/LaunchAgents`    Per-user agents provided by the administrator.
`/Library/LaunchDaemons`  System wide daemons provided by the administrator.
`/System/Library/LaunchAgents`    macOS Per-user agents.
`/System/Library/LaunchDaemons`  macOS System wide daemons.


#### Schema launchd.plist
https://real-world-systems.com/docs/launchd.plist.5.html
https://www.launchd.info/
https://www.manpagez.com/man/5/launchd.plist/


#### Interface for deamon launchd
https://real-world-systems.com/docs/launchctl.1.html
https://www.manpagez.com/man/1/launchctl/
