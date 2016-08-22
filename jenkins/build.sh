#!/bin/bash

source `dirname $0`/build-opm-upscaling.sh

declare -a upstreams
upstreams=(ert
           opm-parser
           opm-output
           opm-material
           opm-core
           opm-grid)

declare -A upstreamRev
upstreamRev[ert]=master
upstreamRev[opm-parser]=master
upstreamRev[opm-material]=master
upstreamRev[opm-core]=master
upstreamRev[opm-grid]=master
upstreamRev[opm-output]=master

OPM_COMMON_REVISION=master

build_opm_upscaling
test $? -eq 0 || exit 1

cp serial/build-opm-upscaling/testoutput.xml .
