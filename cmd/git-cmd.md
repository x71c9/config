#### REMOVE SUBMODULE
```
git submodule deinit [path/to/submodule]
git rm [path/to/submodule]
rm -rf [path/to/submodule]
rm -rf .git/modules/[path/to/submodule]
git add .
git commit -m "removed submodule"
```

#### ADD NEW SUBMODULE
```
git submodule add -b <branch> git+ssh://[link/to/remote/repo/origin] <destination/folder>
git config -f .gitmodules submodule.[path/to/submodule].update rebase
git submodule update --remote --init --recursive
```

Checkout only submodule that starts with ".uranio"
```
git submodule foreach --recursive 'case $displaypath in ".uranio"*) git checkout master ;; *) : ;; esac'
```

If there are not other submodules
```
git submodule foreach --recursive git checkout <branch>
```

Check if submodule of submodule are checked out.
```
git add .
git commit -m "added submodule"
```

#### REMOVE SUBMODULE (OLD)

Remove submodule from .gitmodule
Remove submodule from .git/config
```
rm -rf .git/modules/[path/to/submodule]
rm -rf [path/to/submodule]
git add .
git commit -m "removed submodule ..."
git rm -rf --cached [path/to/submodule]
```

#### FIX DETACH SUBMODULE

```
cd <submodule-path>
git checkout <branch>
cd <parent-repo-path>
# <submodule-path> is here path releative to parent repo root
# without starting path separator
git config -f .gitmodules submodule.<submodule-path>.branch <branch>
git config -f .gitmodules submodule.<submodule-path>.update <rebase|merge>
```

#### INIT SUBMODULES
```
git submodule init
git submodule update
```

Or if you are cloning use --recursive option
```
git clone <link> --recursive
```

#### NOT IN A BRANCH


If you have not committed:
```
git stash
git checkout some-branch
git stash pop
```

If you have committed and have not changed anything since:
```
git log --oneline -n1 # this will give you the SHA
git checkout some-branch
git merge ${commit-sha}
```

If you have committed and then done extra work:
```
git stash
git log --oneline -n1 # this will give you the SHA
git checkout some-branch
git merge ${commit-sha}
git stash pop
```
