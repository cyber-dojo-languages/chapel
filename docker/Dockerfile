FROM cyberdojofoundation/alpine_language_base:3.4
MAINTAINER Brad Chamberlain <bradcray@gmail.com>

USER root

ENV CHPL_VERSION 1.15.0
ENV CHPL_HOME    /opt/chapel/chapel-$CHPL_VERSION

RUN apk update
RUN apk add ca-certificates
RUN apk add bash wget make python gcc g++ perl

RUN mkdir -p /opt/chapel \
    && wget -q -O - https://github.com/chapel-lang/chapel/releases/download/${CHPL_VERSION}/chapel-${CHPL_VERSION}.tar.gz | tar -xzC /opt/chapel

RUN /bin/bash -c "source ${CHPL_HOME}/util/quickstart/setchplenv.bash \
    && cd /opt/chapel \
    && make -C ${CHPL_HOME} \
    && printchplenv --simple > ${CHPL_HOME}/.chplconfig"

ENV PATH ${PATH}:${CHPL_HOME}/bin/linux64:${CHPL_HOME}/util
