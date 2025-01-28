#!/usr/bin/bash
# this just sets all the variables needed to run the host builder by default

# always source this file ('source funchere' or '. funchere')
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "This script should be sourced, not executed."
    exit 1
fi
export FUNC_ENABLE_HOST_BUILDER=1 FUNC_BUILDER=host FUNC_CONTAINER=false FUNC_REGISTRY=quay.io/dfridric
