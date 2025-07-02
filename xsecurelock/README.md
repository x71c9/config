# Authentication on resume from suspend/hibernate

[https://github.com/google/xsecurelock]

To have the authentication process start up without a keypress when the system exits suspend/hibernate, arrange for the system to send the SIGUSR2 signal to the XSecureLock process.

For example, you can copy the following script to the file /usr/lib/systemd/system-sleep/xsecurelock:

```bash
#!/bin/bash
if [[ "$1" = "post" ]] ; then
  pkill -x -USR2 xsecurelock
fi
exit 0
```

Don't forget to mark the script executable.
