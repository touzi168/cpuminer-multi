FROM docker.registry:5000/osbase

ENV LANG POSIX
ENV LANGUAGE POSIX
ENV LC_ALL POSIX

RUN yum install -y gcc-c++ libcurl-devel ccache
RUN yum install -y automake autoconf libtool make

ENV PATH /usr/lib64/ccache:$PATH
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
