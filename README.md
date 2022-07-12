jupyter on python 3.8.10
-------------------------------
```
docker run -d -p 80:80 -p 8888:8888 \
    -v /var/shareVolumes/jupyter:/shareVolume \
    --name jupyter \
    --restart=always \
    dehim/jupyter:tagname
```

### `mv /shareVolume_demo/* /shareVolume/`, then restart container, enjoy it!
### desktop: http://127.0.0.1, default password: 1234, `x11vnc -storepasswd 1234 ~/.vnc/passwd` to reset noVNC password.
### Jupyter: http://127.0.0.1:8888, `jupyter notebook list` to get token, and set`jupyter notebook password` to reset password.


- 3.8.10.7
  - add ocaml pygments pyyaml z3
