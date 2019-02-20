# ExDateMn Buildpack

(Work in progress)

The purpose of this Heroku Buildpack is to write files in the deployed project before compilation.

It is designed to work with TypeScript/node.js projects. Others should work as well, but I didn't test that.

## Usage

For every file to be written into the deployed project directory, the following steps must be followed:

1. Create a Heroku config variable named `WF_-path_-to_-file.config.ts` where
   1. `WF_-` must always be pretended (this marks the config variable as a file to be written)
   2. `_-` is used to mark the end of a folder name (like `/` in a conventional filesystem)
   3. `file.config.ts` is the name of the file to be written including its extension
2. Paste the content of your file into the variable (can be multi-line)

## Installation

1. Maybe fork this repository (only if you want to change the folder delimiter `_-` to something else)
2. Add the GitHub repository URL as a buildpack to your Heroku app
3. Move up the newly added buildpack

## Copyright notice

Copyright 2019 Bernd-L.

Licensed under the MIT licence (see the LICENSE file).