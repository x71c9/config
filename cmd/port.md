### Check if port is busy

```
lsof -nP -i4TCP:7775 | grep LISTEN
```
