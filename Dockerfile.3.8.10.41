FROM dehim/jupyter:3.8.10.28
# FROM dehim/ubuntu-lede:1.1.10
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


RUN cd / \
    && apt-get update \
    && apt-get install -y \
    #7 51.26 -- Looking for mach/mach.h - not found(无用)
                          # python3-macholib \
    #7 172.1 -- Could NOT find Python module yaml(无用)
                          # python3-yaml \
    #7 3.448 -- Could NOT find Z3: Found unsuitable version "0.0.0", but required is at least "4.7.1" (found Z3_LIBRARIES-NOTFOUND)（有用）
                          libz3-dev \
    #7 9.967 -- Could NOT find OCaml (missing: OCAMLFIND OCAML_VERSION OCAML_STDLIB_PATH)（有用）
                          libllvm-11-ocaml-dev \
    #7 64.33 -- Could NOT find Python module pygments（无用:python3-pygments）
                          # python3-pygments \
    #7 55.94 -- Looking for malloc/malloc.h - not found (无用:libdmalloc-dev)
                          # libdmalloc-dev \
    #7 57.63 -- Looking for CrashReporterClient.h - not found （无用:libkf5crash-dev,libkf5crash5）
                          # libkf5crash5 \
    #7 58.87 -- Looking for pthread_create in pthreads - not found（无用：libevent-pthreads-2.1-7,libblis64-3-pthread）
                          # libblis64-3-pthread \
    #7 58.60 -- Looking for pfm_initialize in pfm - not found （有用）
                          libpfm4-dev \
    #7 79.31 -- Looking for setupterm in terminfo - not found(无用：libghc-wl-pprint-terminfo-dev)
                          # libghc-wl-pprint-terminfo-dev \
    #7 79.53 -- Looking for xar_open in xar - not found（无用：python3-xarray）
                          # python3-xarray \
    #7 79.57 -- Looking for arc4random - not found（无用：libbsd-arc4random-perl ）
                          # libbsd-arc4random-perl \
    #7 80.67 -- Looking for malloc_zone_statistics - not found
    #7 80.56 -- Looking for mallctl - not found（无用：libvmmalloc-dev）
                          # libvmmalloc-dev \
                          # libllvm-11-ocaml-dev libllvm-12-ocaml-dev \
                          # #7 484.8 -- Looking for valgrind/valgrind.h - not found(有用)
                          # valgrind \
    #                       #7 485.0 -- Looking for mach/mach.h - not found(没用)
    #                       # mach \
                          # #7 485.0 -- Looking for histedit.h - not found(有用)
                          # libedit-dev \

    # && cd /usr/src \
    # && git clone -b cling-patches http://root.cern/git/llvm.git llvm_source \
    # && cd llvm_source/tools \
    # && git clone http://root.cern/git/cling.git \
    # && git clone -b cling-patches http://root.cern/git/clang.git \

      # -DLLVM_TARGETS_TO_BUILD=X86 \
      # -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu \
      
      # -DLLVM_TARGETS_TO_BUILD=X86 \

      
      # -DLLVM_BUILD_EXAMPLES=false \(默认就是false)
      
      # -DBUILD_SHARED_LIBS=ON \(BUILD_SHARED_LIBS is only recommended for use by LLVM developers)
      
      # -DLLVM_BUILD_TOOLS=false \(默认就是false)
      
      # -DLLVM_BUILD_TESTS=false \(默认就是false)
      
      # -DLLVM_CCACHE_BUILD=OFF \(默认就是false)

    # && python -m pip install --upgrade \
    #      pygments \
        #  six \


    #7 55.94 -- Looking for malloc/malloc.h - not found (/usr/include/malloc.h已存在，造一个软连接)
    && cd /usr/include \
    && mkdir -p /usr/include/malloc \
    && ln -s /usr/include/malloc.h malloc/malloc.h \


    && cd /usr/src \
    && mkdir build \
    && cd build \
    && cmake \
      -DCMAKE_BUILD_TYPE=Release \
      # -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
      # -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
      -DLLVM_LIBDIR_SUFFIX=64 \
      -DLLVM_APPEND_VC_REV=OFF \
      # -DLLVM_BUILD_LLVM_DYLIB=true \
      # -DLLVM_LINK_LLVM_DYLIB=true \
      -DLLVM_BUILD_DOCS=false \
      # -G Ninja \
      ../llvm_source \
    # && cmake --build . 2>&1 >/dev/null \
    # && cmake --build . --target install \

    # && git clone -b cling-patches http://root.cern.ch/git/llvm.git \
    # && cd llvm/tools \
    # && git clone http://root.cern.ch/git/cling.git \
    # && git clone -b cling-patches http://root.cern.ch/git/clang.git \
    # && cd .. \
    # && mkdir _build \
    # && cd _build \
    # && cmake \
    #   -DCMAKE_BUILD_TYPE=Release \
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

