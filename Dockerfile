FROM dehim/ubuntu-novnc:3.8.10.1
# certifi             2019.11.28
# chardet             3.0.4
# dbus-python         1.2.16
# distro              1.4.0
# distro-info         0.23ubuntu1
# idna                2.8
# numpy               1.23.1
# pip                 22.1.2
# PyGObject           3.36.0
# python-apt          2.0.0+ubuntu0.20.4.7
# requests            2.22.0
# requests-unixsocket 0.2.0
# setuptools          63.1.0
# six                 1.16.0
# ssh-import-id       5.10
# supervisor          4.1.0
# unattended-upgrades 0.1
# urllib3             1.25.8
# websockify          0.10.0
# wheel               0.37.1




RUN cd /usr/src \
    apt-get update \
    #  libmkl-rt \

# ipyparallel:用于jupyter, Clusters tab is now provided by IPython parallel. See 'IPython parallel' for installation details.

    # && wget https://pip.vnpy.com/colletion/ibapi-9.76.1.tar.gz \
    # && python -m pip install --target = /usr/src/ibapi-9.76.1.tar.gz \
    && python -m pip install --upgrade \
         joblib \
         Cython \
         # 解决 numpy安装时报错：libraries mkl_rt not found
        #  scipy \
         exchange-calendars \
         ipyparallel \
        #  six \
        #  wheel \
         pytz \
         retrying \
         psycopg2  \
         ta-lib \
         psycopg2-binary \
         statsmodels \
         dataclasses \
         qdarkstyle \
         peewee \
         pymysql \
         wmi \
         quickfix \
         trading-calendars \
         jupyter \
         jupyterlab \
         jupyterthemes \
         jupyter_contrib_nbextensions \
         jupyter_nbextensions_configurator \
         pandas \


    && mkdir -p /shareVolume/config/jupyter/ \
    && ln -s /shareVolume/config/jupyter ~/.jupyter \
    && jupyter notebook --generate-config --allow-root \
    # 查看可用jupyter主题 jt -l
    # 应用主题
    # 设置密码： jupyter notebook password
    # 深色
    # && jt -t chesterish -f inconsolata -fs 10 -cellw 90% -ofs 11 -dfs 10 -T \
    # 浅色
    # && jt -t grade3 -f inconsolata -fs 10 -cellw 90% -ofs 11 -dfs 10 -T \
    && jupyter contrib nbextension install --user \
    && mv /shareVolume/config/jupyter /shareVolume_demo/config/ \
    # 设置默认IP
    && echo "\n" >> /shareVolume_demo/config/jupyter/jupyter_notebook_config.py \
    && echo "c.ServerApp.allow_root = True" >> /shareVolume_demo/config/jupyter/jupyter_notebook_config.py \
    && echo "c.ServerApp.open_browser = False" >> /shareVolume_demo/config/jupyter/jupyter_notebook_config.py \
    && echo "c.ServerApp.ip = '0.0.0.0'" >> /shareVolume_demo/config/jupyter/jupyter_notebook_config.py \
    && echo "c.ServerApp.port = 8888" >> /shareVolume_demo/config/jupyter/jupyter_notebook_config.py \



    && rm -rf /tmp/* \
    # && rm -rf /usr/src/* \

    # 对应的shareVolume_文件夹操作
    && touch /shareVolume_demo/config/vnpy/log/default.log \
    && mkdir -p /shareVolume_demo/config/jupyter \
    
    && echo "{" \
            "\n  \"NotebookApp\": {" \
            "\n    \"nbserver_extensions\": {" \
            "\n      \"jupyter_nbextensions_configurator\": true" \
            "\n    }" 	        "\n  }" \
            "\n}" \
            > /shareVolume_demo/config/jupyter/jupyter_notebook_config.json \
    && echo "[program:jupyterLab]" \
            "\ncommand=jupyter lab --ip=0.0.0.0 --port=8888" \
            "\nautostart=true" \
            "\nautorestart=true" \
            "\npriority=60" \
            > /shareVolume_demo/config/supervisor/jupyterLab.ini.bak \
    && echo "[program:jupyterNotebook]" \
            "\ncommand=jupyter notebook --allow-root --ip=0.0.0.0 --port=8888" \
            "\nautostart=true" \
            "\nautorestart=true" \
            "\npriority=60" \
            > /shareVolume_demo/config/supervisor/jupyterNotebook.ini \

    && apt-get clean 

