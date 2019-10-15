#!/bin/bash

set -e

bosh create-release --force && bosh upload-release
