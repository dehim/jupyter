FROM dehim/debian-novnc:1.0.0.1

RUN apt update 
	# && apt install --no-install-recommends -y bash git clang make cmake python-is-python3 libz-dev \
	# && apt install --no-install-recommends -y neovim pipenv fonts-firacode nodejs npm libjs-mathjax

# Build cling
RUN git clone -b cling-patches http://root.cern/git/llvm.git /opt/llvm \
	&& cd /opt/llvm/tools \
	&& git clone -b cling-patches http://root.cern/git/clang.git \
	&& git clone http://root.cern/git/cling.git \
	&& mkdir /opt/llvm-build 


# RUN cd /opt/llvm-build \
# 	&& cmake \
# 		-DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
# 		-DLLVM_TARGETS_TO_BUILD="host;NVPTX" \
# 		-DCMAKE_INSTALL_PREFIX=/usr/local \
# 		-DCMAKE_BUILD_TYPE=Release \
# 		/opt/llvm \
# 	&& cmake --build . 2>&1 >/dev/null \
# 	&& cmake --build . --target install

# # Required packages for python
# ADD rootfs/Pipfile /root/Pipfile
# # Install packages
# RUN cd /root \
#  && pipenv lock -r > requirements.txt \
#  && pip install -r requirements.txt

# # Add C++ kernel to jupyter
# RUN cd /opt/llvm/tools/cling/tools/Jupyter/kernel \
#  && pip install -e . \
#  && jupyter-kernelspec install cling-cpp17 \
#  && jupyter-kernelspec install cling-cpp1z \
#  && jupyter-kernelspec install cling-cpp14 \
#  && jupyter-kernelspec install cling-cpp11

# # Create user
# RUN useradd -m -d ${USER_HOME}/ -s /bin/bash ${USER}

# USER ${USER}
# WORKDIR ${USER_HOME}
# SHELL ["/bin/bash", "-c"]

# # Jupyter notebook settings
# # ADD --chown=${USER}:${USER} rootfs/jupyter_notebook_config.py ${USER_HOME}/.jupyter/jupyter_notebook_config.py
# # Server key
# # ADD --chown=${USER}:${USER} rootfs/${SSL_KEY_NAME}.pem ${USER_HOME}/.jupyter/${SSL_KEY_NAME}.pem
# # ADD --chown=${USER}:${USER} rootfs/${SSL_KEY_NAME}.key ${USER_HOME}/.jupyter/${SSL_KEY_NAME}.key
# # Update configuration
# # RUN sed -i "s/##NB_PASSWORD##/$(python -c 'import sys; from IPython.lib import passwd; print(passwd(sys.argv[1]))' ${NB_PASSWORD})/g" ${USER_HOME}/.jupyter/jupyter_notebook_config.py
# # RUN sed -i -r "s|##USER_HOME##|${USER_HOME}|g" ${USER_HOME}/.jupyter/jupyter_notebook_config.py
# # RUN sed -i "s/##SSL_KEY_NAME##/${SSL_KEY_NAME}/g" ${USER_HOME}/.jupyter/jupyter_notebook_config.py

# USER ${USER}
# WORKDIR ${USER_HOME}
# SHELL ["/bin/bash", "-c"]
# EXPOSE 8080
# ENTRYPOINT ["bash", "-c"]
# CMD ["jupyter lab"]