#!/bin/bash

# Fail on anything that fails going forward.
set -e

# Run any simple tests that just require the use of the VM
pub run test -p vm -x aot
pub run angular_test --verbose