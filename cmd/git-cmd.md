#### REMOVE SUBMODULE

Remove submodule from .gitmodule
Remove submodule from .git/config
```
rm -rf .git/modules/[path/to/submodule]
rm -rf [path/to/submodule]
git add .
git commit -m "removed submodule ..."
git rm -rf --cached [path/to/submodule]
```

```
git submodule deinit [path/to/submodule]
git rm [path/to/submodule]
rm -rf [path/to/submodule]
rm -rf .git/modules/[path/to/submodule]
git add .
git commit -m "removed submodule"
```

#### ADD SUBMODULE

```
git submodule add -b <branch> <link> <folder>
git config -f .gitmodules submodule.<submodule-path>.update rebase
git submodule update --remote
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
