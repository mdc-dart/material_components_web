#!/bin/bash

# Fail on anything that fails going forward.
set -e

# Run any simple tests that just require the use of the VM
pub run test -p vm -x aot

# Run e2e-like tests that use Angular AoT compilation
if [ "$TRAVIS" = "true" ]
then
  # TODO(kevmoo) Enable these once we figure out what's wrong with travis
  echo "Skipping 'pub run angular_test' - see https://github.com/dart-lang/angular_test/issues/23"
else
  pub run angular_test
fi