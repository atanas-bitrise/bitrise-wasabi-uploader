#!/bin/bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e

swift "${THIS_SCRIPT_DIR}/step.swift"
exit $?
