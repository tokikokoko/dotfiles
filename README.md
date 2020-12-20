# Usage

```bash
./init.sh
```

## Test
```bash
docker build --progress=plain --build-arg PASSWORD=hoge -t dot:latest .
docker run --rm -it dot:latest bash -c './init.sh && bash'

# In bash shell
vim +PlugInstall +qa
```

