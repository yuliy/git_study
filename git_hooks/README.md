This is a directory for custom git hooks. It should be specified in git config to be used by git.

For example, you may put it into ```.git/config``` file into ```[core]``` section:
```
[core]
    hooksPath = ./git_hooks
```

After that don't forget to run:
```
git init
```
