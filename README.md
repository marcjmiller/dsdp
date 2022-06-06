## Getting started
Just run
```./start.sh```

## How to update from the remotes easily
```
git submodule update --remote
git add . # add changes
git commit -m ""
git push
```

## Nice to check
Checks all sha1s for each submodule you have to ensure what commit each is referring to.
```git submodule status --recursive```
