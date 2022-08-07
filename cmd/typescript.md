
### Show all files that are being compiled
```
yarn tsc --noEmit --listFiles
```

### Show all files compiled with their size
```
# macOS / BSD
yarn tsc --noEmit --listFiles | xargs stat -f "%z %N"

# Linux:
yarn tsc --noEmit --listFiles | xargs stat -c "%s %n"
```

### Show all files compiled with their size and print a treemap
```
yarn global add webtreemap-cli
```
```
# macOS / BSD
yarn tsc --noEmit --listFiles | xargs stat -f "%z %N" | npx webtreemap-cli

# Linux:
yarn tsc --noEmit --listFiles | xargs stat -c "%s %n" | npx webtreemap-cl
```
