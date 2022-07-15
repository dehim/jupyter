FROM dehim/jupyter:3.8.10.9
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

    
     && wget https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip \
     && unzip ninja-linux.zip -d /usr/bin/ \

    && git clone -b cling-patches http://root.cern.ch/git/llvm.git \
    && cd llvm/tools \
    && git clone http://root.cern.ch/git/cling.git \
    && git clone -b cling-patches http://root.cern.ch/git/clang.git \

    && mkdir build \
    && cd build \
    && cmake \
      -DCMAKE_BUILD_TYPE=MinSizeRel \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
      -DBUILD_SHARED_LIBS=ON \
      -DLLVM_CCACHE_BUILD=OFF \
      -DLLVM_APPEND_VC_REV=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu \
      -DLLVM_BUILD_LLVM_DYLIB=true \
      -DLLVM_LINK_LLVM_DYLIB=true \
      -DLLVM_BUILD_TOOLS=false \
      -DLLVM_BUILD_EXAMPLES=false \
      -DLLVM_BUILD_TESTS=false \
      -DLLVM_BUILD_DOCS=false \
      -G "Ninja" ../llvm \
    && cmake --build . \
    && cmake --build . --target install \



    # # 安装 llvm
    # && cd /usr/src \
    # && git clone http://root.cern.ch/git/llvm.git \
    # && cd llvm \
    # && mkdir _build \
    # && cd _build \
    # && cmake \
    #   -DCMAKE_BUILD_TYPE=MinSizeRel \
    #   -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
    #   -DBUILD_SHARED_LIBS=ON \
    #   -DLLVM_CCACHE_BUILD=OFF \
    #   -DLLVM_APPEND_VC_REV=OFF \
    #   -DLLVM_TARGETS_TO_BUILD=X86 \
    #   -DCMAKE_INSTALL_PREFIX=/usr \
    #   -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu \
    #   -DLLVM_BUILD_LLVM_DYLIB=true \
    #   -DLLVM_LINK_LLVM_DYLIB=true \
    #   -DLLVM_BUILD_TOOLS=false \
    #   -DLLVM_BUILD_EXAMPLES=false \
    #   -DLLVM_BUILD_TESTS=false \
    #   -DLLVM_BUILD_DOCS=false \
    #   -G "Ninja" ../llvm \
    # && cmake --build . \
    # && cmake --build . --target install \

    # # 先试试手动安装 llvm
    # && cd /usr/src \
    # && git clone http://root.cern.ch/git/llvm.git \
    # # && git clone -b llvmorg-14.0.6 https://github.com/llvm/llvm-project.git \
    # && cd llvm-project \
    # && mkdir _build \
    # && cd _build \
    # && cmake \
    #   -DCMAKE_BUILD_TYPE=MinSizeRel \
    #   -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
    #   -DLLVM_TARGETS_TO_BUILD=X86 \
    #   -DBUILD_SHARED_LIBS=ON \
    #   -DLLVM_CCACHE_BUILD=OFF \
    #   -DLLVM_APPEND_VC_REV=OFF \
    #   -DLLVM_ENABLE_PROJECTS=clang \
    #   -DCMAKE_INSTALL_PREFIX=/usr \
    #   -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu \
    #   -G "Ninja" ../llvm \
    # # && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu ../llvm \
    # && cmake --build . \
    # && cmake --build . --target install \
    # # && make \
    # # && make install \
    



    # # 参考：https://www.bbsmax.com/A/KE5Q8WVyJL/
    # && cd /usr/src \
    # && git clone https://github.com/root-project/cling.git \
    # && cd cling/tools/packaging \

    # # output clipped, log limit 1MiB reached,只能输出到空管道
    # # && (echo 'yes' |./cpt.py --check-requirements) > /dev/null \
    # # && (echo 'yes' |./cpt.py --check-requirements) > /dev/null \
    # # && yes yes | ./cpt.py --check-requirements > /dev/null \
    # # 发现还有个-y参数
    # # 标准输出进了黑洞，错误输出打印到屏幕
    # && ./cpt.py --check-requirements 2>&1 >/dev/null \
    # # && ./cpt.py --create-dev-env Debug --with-workdir=./cling-build/ 2>&1 >/dev/null \
    # && ./cpt.py --last-stable=pkg --create-dev-env Debug --with-workdir=/ec/build 2>&1 >/dev/null \

    && cd / \
    && rm -rf /tmp/* \
    # && rm -rf /usr/src/* \

    && apt-get clean 

