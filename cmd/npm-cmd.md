## NPM

### Show dependency tree

```
npm list --depth=1
```

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

### Link a package for local development

On the repo you want to link
```
yarn link
```

On the repo you want to use the linked package
```
yarn link [name of linked package]
```

List all links
```
ll ~/.config/yarn/link
```

### Alias a package

```
npm install local-pack@npm:pack
```
```
import local form 'local-pack';
```
--

```
yarn add uranio@ssh+git://git@github.com/nbl7/uranio-core.git
```
```
import uranio from 'uranio';
```
