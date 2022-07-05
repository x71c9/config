
#### After cloning repo gnupg

Permission must be changed for security reason:
https://gist.github.com/oseme-techguy/bae2e309c084d93b75a9b25f49718f85

```bash
find ~/.gnupg -type f -exec chmod 600 {} \; # Set 600 for files
find ~/.gnupg -type d -exec chmod 700 {} \; # Set 700 for directories
```


