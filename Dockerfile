FROM dehim/jupyter:11.0.28


# LABEL maintainer="dehim"

# #避免安装过程弹出框
# ENV DEBIAN_FRONTEND='noninteractive' 

RUN cd / \
    && cd /tmp/ \
#     # && echo "deb http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-14 main" \
# 	  #       "\ndeb-src http://apt.llvm.org/bullseye/ llvm-toolchain-bullseye-14 main" \
# 	  #       "\n" \
# 	  #       > /etc/apt/sources.list.d/llvm-toolchain-bullseye.list \
#     # && wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|apt-key add - \

    
#     && wget https://github.com/ninja-build/ninja/releases/download/v1.11.0/ninja-linux.zip \
#     && unzip ninja-linux.zip -d /usr/bin/ \




#     # && apt update \
#     # && apt-get install -y z3 libz3-dev libllvm-14-ocaml-dev libllvm14 libpfm4-dev valgrind libedit-dev \
   
#     # #7 55.94 -- Looking for malloc/malloc.h - not found (/usr/include/malloc.h已存在，造一个软连接)
#     && cd /usr/include \
#     && mkdir -p /usr/include/malloc \
#     && ln -s /usr/include/malloc.h malloc/malloc.h \

#     && apt update \
#     && apt install -y apt-utils cmake \
#     && apt install -y valgrind python-is-python3 python3-dev python3-distro libedit-dev z3 libz3-dev libpfm4-dev python3-jupyterlab-pygments python3-pygments \
#     # && apt install -y *llvm-11* \
#     && apt install -y libllvm-11-ocaml-dev \
#     # libfindlib-ocaml libfindlib-ocaml-dev ocaml-findlib libllvm-14-ocaml-dev libctypes-ocaml \
#     #     libctypes-ocaml-dev libintegers-ocaml libintegers-ocaml-dev ocaml-compiler-libs ocaml-interp ocaml-man ocaml-nox ocaml-base-nox \
#     #     python3-jupyterlab-pygments python3-pygments \

#     # && mkdir -p /usr/src \
#     # && chmod -R 777 /usr/src/ \
#     # && cd /usr/src \
#     # && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \


#        # install ta-lib begin 
#     # 源文件没有添加参数，会报错mv: cannot stat '.deps/gen_code-gen_code.Tpo': No such file or directory
#     # talib/_ta_lib.c:526:28: fatal error: ta-lib/ta_defs.h: 没有那个文件或目录
#     # 在升级pip前安装ta-lib begin
#     # 28017File "/usr/lib/python3.7/site-packages/pip/__main__.py", line 8, in <module>
#     # 28018if sys.path[0] in ('', os.getcwd()):
#     # 28019FileNotFoundError: [Errno 2] No such file or directory
#     # && wget https://pip.vnpy.com/colletion/ta-lib-0.4.0-src.tar.gz \
#     && cd /tmp/ \
#     && wget https://nchc.dl.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz \
#     && tar -xf ta-lib-0.4.0-src.tar.gz \
#     && cd ta-lib \
#     && ./configure --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu \
#     # If you build TA-Lib using make -jX it will fail but that's OK! Simply rerun make -jX followed by [sudo] make install.
#     # && make -j$(getconf _NPROCESSORS_ONLN) \
#     && make \
#     && make install \
#     # install ta-lib end


# # install PIP begin
#     && cd /tmp/ \
#     && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
#     && python get-pip.py \

#  && python -m pip install --upgrade \
#          z3 \
#          joblib \
#          Cython \
#          ipyparallel \
#         #  six \
#         #  wheel \
#          pytz \
#          retrying \
#          ta-lib \
#          statsmodels \
#          dataclasses \
#          qdarkstyle \
#          peewee \
#          pymysql \
#          wmi \
#          quickfix \
#          jupyter \
#          jupyterlab \
#          jupyterthemes \
#          jupyter_contrib_nbextensions \
#          jupyter_nbextensions_configurator \
#          pandas \

# # # 看来这个不用安装
# # # 安装 ocaml.(必须在上面pip之后安装，否则报错。另外如果通过pip安装，会导致llvm找不到)
# #     && cd /tmp/ \
# #     && git clone https://github.com/ocaml/ocaml.git \
# #     && cd ocaml \
# #     && ./configure --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu \
# #     && make \
# #     && make install \




#       # -DLLVM_TARGETS_TO_BUILD=X86 \
#       # -DCMAKE_INSTALL_PREFIX=/usr/lib/llvm-14/ \



     
#       # -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
      
#       # -DLLVM_ENABLE_BINDINGS=OFF \


#     # # # 先试试手动安装 llvm
#     # && cd /usr/src \
#     # && git clone -b llvmorg-14.0.6 https://github.com/llvm/llvm-project.git \
#     # # # && cd llvm-project/ \

#     # && mkdir -p /usr/src/llvm-project/_build \
#     # && cd /usr/src/llvm-project/_build \
#     # && cmake \
#     #   -DCMAKE_BUILD_TYPE=Release \
#     #   -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
#     #   -DBUILD_SHARED_LIBS=ON \
#     #   -DLLVM_CCACHE_BUILD=OFF \
#     #   -DLLVM_APPEND_VC_REV=OFF \
#     #   -DLLVM_BUILD_DOCS=false \
#     #   -DLLVM_ENABLE_PROJECTS=clang \
#     #   -DCMAKE_INSTALL_PREFIX=/usr \
#     #   -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
#     #   -G "Ninja" ../llvm \


#     # && cmake --build . \
#     # && cmake --build . --target install \
    


#     # && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu ../llvm \


#     # && cd /usr/src \
#     # && mkdir build \
#     # && cd build \
#     # && cmake \
#     #   -DCMAKE_BUILD_TYPE=Release \
#     #   # -DCMAKE_INSTALL_PREFIX=/usr \
#     #   -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
#     #   # -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
#     #   -DLLVM_LIBDIR_SUFFIX=64 \
#     #   -DLLVM_APPEND_VC_REV=OFF \
#     #   # -DLLVM_BUILD_LLVM_DYLIB=true \
#     #   # -DLLVM_LINK_LLVM_DYLIB=true \
#     #   -DLLVM_BUILD_DOCS=false \
#     #   # -G Ninja \
#     #   ../llvm_source \
#     # # && cmake --build . 2>&1 >/dev/null \
#     # # && cmake --build . --target install \
    
#       # -DLLVM_TARGETS_TO_BUILD=X86 \

#     && cd /usr/src \
#     && git clone -b cling-patches http://root.cern.ch/git/llvm.git \
#     && cd llvm/tools \
#     && git clone http://root.cern.ch/git/cling.git \
#     && git clone -b cling-patches http://root.cern.ch/git/clang.git \





    && mkdir -p /usr/src/build_llvm \
    && cd /usr/src/build_llvm \
    && cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
      -DBUILD_SHARED_LIBS=ON \
      -DLLVM_CCACHE_BUILD=OFF \
      -DLLVM_APPEND_VC_REV=OFF \
      -DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib/x86_64-linux-gnu \
      -DLLVM_INSTALL_TOOLCHAIN_ONLY=ON \
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