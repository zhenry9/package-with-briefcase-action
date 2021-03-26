#!/bin/bash

# Fail on errors.
set -e

# Make sure .bashrc is sourced
. /root/.bashrc

SRCDIR = $1
PLATFORM =$2
OUTPUT_FORMAT = $3
WORKDIR=${SRCDIR:-/src}

python -m pip install --upgrade pip setuptools wheel
python -m pip install briefcase

cd $WORKDIR

python -m briefcase create $PLATFORM $OUTPUT_FORMAT
python -m briefcase build $PLATFORM $OUTPUT_FORMAT
python -m briefcase package $PLATFORM $OUTPUT_FORMAT

chown -R --reference=. ./$PLATFORM/*.$OUTPUT_FORMAT