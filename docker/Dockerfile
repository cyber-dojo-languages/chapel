FROM  cyberdojofoundation/alpine_glibc
LABEL maintainer=bradcray@gmail.com

ENV CHPL_VERSION 1.16.0
ENV CHPL_HOME /opt/chapel/chapel-${CHPL_VERSION}
ENV PATH ${PATH}:${CHPL_HOME}/bin/linux64:${CHPL_HOME}/util

ADD install.sh /

RUN /install.sh && \
    rm -f /install.sh
