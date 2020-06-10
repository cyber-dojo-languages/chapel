#!/bin/sh -e

apk add ca-certificates
apk add gcc g++ make perl python2 wget

TGZ_FILE=https://github.com/chapel-lang/chapel/releases/download/${CHPL_VERSION}/chapel-${CHPL_VERSION}.tar.gz
mkdir -p /opt/chapel
wget -q -O - ${TGZ_FILE} | tar -xzC /opt/chapel

/bin/bash -c "\
source ${CHPL_HOME}/util/quickstart/setchplenv.bash \
&& cd /opt/chapel \
&& make -C ${CHPL_HOME} \
&& printchplenv --simple > ${CHPL_HOME}/.chplconfig"

apk del wget
