#!/bin/bash
set -o nounset # error if unset variables
set -o errexit # exit if error

# Default location is . but it can be overridden externally
: ${VL_DOCS_OUTPUT_DIRECTORY:=.}
export VL_DOCS_OUTPUT_DIRECTORY
export VL_VERSION_MAJOR=`grep VL_VERSION_MAJOR ../CMakeLists.txt  | head -n 1 | grep -oh '[0-9]*'`
export VL_VERSION_MINOR=`grep VL_VERSION_MINOR ../CMakeLists.txt  | head -n 1 | grep -oh '[0-9]*'`
export VL_VERSION_PATCH=`grep VL_VERSION_PATCH ../CMakeLists.txt  | head -n 1 | grep -oh '[0-9]*'`
export VL_VERSION="v$VL_VERSION_MAJOR.$VL_VERSION_MINOR.$VL_VERSION_PATCH"
rm -rf html-out/
rm -rf $VL_DOCS_OUTPUT_DIRECTORY/html-out/
doxygen
cp -a html-in/. $VL_DOCS_OUTPUT_DIRECTORY/html-out/