#### SEARCH for a file with similar filename
```
find . -name "*.swp"
```

#### LIST ALL NPM GLOBAL PACKAGES
```
npm list -g --depth 0
```

#### ADD directory to PATH

```
export PATH="$PATH:/new/dir/path"
```

### BASH files

The `~/.bashrc` file is loaded every time a new copy of bash start.

The `/etc/profile` file is a systemwide file for system administrators.
This file defines tasks that the shell executes for every user who logs in.
The instructions in the file usually set the shell variables,
such as PATH, USER, and HOSTNAME.

The `~/.bash_profile` file is a config file for configuring user environments.
The users can modify the default settings and add any extra configurations in it.

The `~/.bash_login` file contains specific settings that are executed when
a user logs in to the system. The file is yet another configuration file that
is read in the absence of the `~/.bash_profile`.

The `~/.bash_logout` file contains instructions for the logout procedure.


### CHECK SPACE

General 
```
df -h
```

Order file by size
```
du -hs * | sort -hr
```

### GO BACK PREVIOUS DIR

```
cd -
```

### COPY MULTIPLE FILES

cp -t /path/to/dest file1 file2 file3
