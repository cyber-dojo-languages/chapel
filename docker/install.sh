#!/bin/sh
set -e

apk update
apk add ca-certificates
apk add bash wget make python gcc g++ perl

mkdir -p /opt/chapel \
    && wget -q -O - https://github.com/chapel-lang/chapel/releases/download/${CHPL_VERSION}/chapel-${CHPL_VERSION}.tar.gz | tar -xzC /opt/chapel

/bin/bash -c "source ${CHPL_HOME}/util/quickstart/setchplenv.bash \
    && cd /opt/chapel \
    && make -C ${CHPL_HOME} \
    && printchplenv --simple > ${CHPL_HOME}/.chplconfig"

