#### Installing browserpass

Install extension from Extension Store
https://chrome.google.com/webstore/detail/browserpass/naepdomgkenhinolocfifgehidddafch?hl=en

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
PREFIX='/opt/homebrew/opt/browserpass' make hosts-chrome-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'

// Brave
PREFIX='/usr/local/opt/browserpass' make hosts-brave-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'
PREFIX='/opt/homebrew/opt/browserpass' make hosts-brave-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'

// Chromium
PREFIX='/usr/local/opt/browserpass' make hosts-chromium-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'
PREFIX='/opt/homebrew/opt/browserpass' make hosts-chromium-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'

// Firefox
PREFIX='/usr/local/opt/browserpass' make hosts-firefox-user -f '/usr/local/opt/browserpass/lib/browserpass/Makefile'
PREFIX='/opt/homebrew/opt/browserpass' make hosts-firefox-user -f '/opt/homebrew/opt/browserpass/lib/browserpass/Makefile'
```

### browserpass extension need gpg to be in `/usr/local/bin/gpg`
### if it is not installed there, make a link, for example:
```
sudo ln -s /opt/homebrew/bin/gpg /usr/local/bin/gpg
```

This app allow browserpass to communicate with the machine via Native Messaging API
https://developer.chrome.com/docs/apps/nativeMessaging/


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

Then RESTART the agent. See below.

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
