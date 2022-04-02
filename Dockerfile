ARG DEBIAN_VERSION="11"
FROM debian:${DEBIAN_VERSION}
ARG NM_VERSION=3.3.51
ENV NM_VERSION=${NM_VERSION}
RUN apt update && apt upgrade -y
RUN apt install -y build-essential lldb gdb man
RUN apt install -y python3 python3-pip
RUN apt install -y sudo vim valgrind most
RUN python3 -m pip install --upgrade pip setuptools && python3 -m pip install norminette==$NM_VERSION
RUN echo "42	ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/42
RUN mkdir /42-user && useradd -u 1000 --home /42-user 42
ADD .bashrc /42-user/.bashrc
VOLUME /project
WORKDIR /project
USER 1000
CMD /bin/bash
