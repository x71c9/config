#### Installing browserpass

Install extension from Extension Store
https://chrome.google.com/webstore/detail/browserpass/naepdomgkenhinolocfifgehidddafch?hl=en

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

