#### Installing browserpass

Install extension from Extension Store
https://chrome.google.com/webstore/detail/browserpass/naepdomgkenhinolocfifgehidddafch?hl=en

> Trying installing browserpass without GPGSuite for Mac, becuase it is probably not needed.

Install GPG Suite for Mac
https://gpgtools.org/

> This will install also GPG Mail that encrypt the email for the Mac client Mail.
> For now I am not using it.

In order the extension to work need a native app `browserpass-native`
https://github.com/browserpass/browserpass-native

Installation for Mac
```
// Add Third-party repo for Homebrew
// https://github.com/amar1729/homebrew-formulae

brew tap amar1729/formulae
brew install browserpass
```

Install the native app
```
// Chrome
PREFIX='/usr/local/opt/browserpass' make hosts-chrome-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'

// Brave
PREFIX='/usr/local/opt/browserpass' make hosts-brave-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'

// Chromium
PREFIX='/usr/local/opt/browserpass' make hosts-chromium-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'
```


#### Pass

Generate
```
pass generate host/username 21
```
> 21 is the length of the passqword it will be generated.


#### GPG

##### Change cache time passphrase
Change file `~/.gnupg/gpg-agent.conf`
```
default-cache-ttl 600
max-cache-ttl 7200
```
Values are in seconds.

Then RESTART the agent

##### Restart the agent
End the session by restarting gpg-agent.
```
gpgconf --kill gpg-agent
gpg-agent --daemon --use-standard-socket
```
or
```
gpgconf --kill all
```

##### Export keys in ASCII

```
gpg --export -a D4763C61 > key.pub
gpg --export-secret-keys -a D4763C61 > key
```
