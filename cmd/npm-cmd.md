## NPM

### Link executable module to global

```
cd my-project
npm link
```
my-project must contain package.json with `bin` key set to the binary file.

### Unlink / Uninstall global linked module

```
npm uninstall -g my-project
```

### Import dependency from BitBucket

```
"urn-dev":"git+ssh://git@bitbucket.org/nbl7/urn-dev.git"
```

### List global packages

```
npm list -g --depth 0
```
