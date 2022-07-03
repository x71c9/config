
### Show hidden files

```
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
```

### Turn off updates

```
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -boolean FALSE
```

### Change font antialias

```
defaults -currentHost write -globalDomain AppleFontSmoothing -int 0
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
defaults -currentHost write -globalDomain AppleFontSmoothing -int 3
```
Logout
