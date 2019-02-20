#!/bin/sh

# MIT License

# Copyright (c) 2019 Bernd L.

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

############################################
# This file is used to test the buildpack. #
############################################

# Heroku dev center: "Usage: bin/compile BUILD_DIR CACHE_DIR ENV_DIR"

# Change directory
echo [TEST] Changing directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $DIR

# Reset the Build dir
echo [TEST] Resetting the Build folder
rm -r Build/* >/dev/null
touch Build/logo.png
mkdir Build/src
touch Build/src/app.ts
mkdir Build/src/environments
touch Build/src/environments/environment.ts

# Execute detect
echo [TEST] running bin/detect
../bin/detect

# Execute compile
echo [TEST] running bin/compile
../bin/compile Build Cache Environment
