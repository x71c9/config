#### GIT PUSH TO ALL ORIGINS
```
git remote | xargs -L1 git push --all
```

#### GIT SHOW FILE HISTORY
```
git log -p -- filename
```

#### GIT LIST ALL CONFIG
```
git config --list
```

#### GIT SET EDITOR
```
git config --global core.editor vim
```

#### GIT REVERT
```
git revert 2ee5b59..HEAD
```

#### GIT ADD ALIAS TO PUSH TO ALL ORIGINS

```
git config --global alias.push-all '!git remote | xargs -L1 git push --all'
```

And then use:
```
git push-all
```

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

#### MOVE FROM BITBUCKET TO GITHUB

```
git clone --mirror git@bitbucket.org:nbl7/repository-to-mirror.git

cd repository-to-mirror.git

git remote add github git@github.com:nbl7/new-repo.git

git push github --mirror

```

If only master is needed
```
git clone git@bitbucket.org:nbl7/repository-to-mirror.git

cd repository-to-mirror

git remote rename origin bitbucket

git remote add origin git@github.com:nbl7/new-repo.git

git push origin --mirror

git push origin --tags

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

#### RESET ONE FILE

```
git checkout HEAD -- file.txt
```

#### DELETE SENSITIVE FILES FROM GIT HISTORY
https://stackoverflow.com/questions/872565/remove-sensitive-files-and-their-commits-from-git-history

If pushed to remote:
``` 
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA" --prune-empty --tag-name-filter cat -- --all
git push --force --verbose --dry-run
git push --force
```

