FROM dehim/jupyter:3.8.10.7
# FROM dehim/ubuntu-novnc:3.8.10.1
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
    && apt-get update \

    # 参考：https://www.bbsmax.com/A/KE5Q8WVyJL/
    && cd /usr/src \
    && git clone https://github.com/root-project/cling.git \
    && cd cling/tools/packaging \

    # output clipped, log limit 1MiB reached,只能输出到空管道
    # && (echo 'yes' |./cpt.py --check-requirements) > /dev/null \
    # && (echo 'yes' |./cpt.py --check-requirements) > /dev/null \
    # && yes yes | ./cpt.py --check-requirements > /dev/null \
    # 发现还有个-y参数
    && ./cpt.py -y --check-requirements \
    && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/ \

    && rm -rf /tmp/* \
    # && rm -rf /usr/src/* \

    && apt-get clean 

