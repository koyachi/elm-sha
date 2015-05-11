#!/bin/bash
# via https://github.com/evancz/virtual-dom/blob/1.2.3/make.sh

browserify src/wrapper.js -o src/Native/Sha.js
echo ";" >> src/Native/Sha.js
