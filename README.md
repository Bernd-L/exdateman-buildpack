# ExDateMan Buildpack

The purpose of this Heroku Buildpack is to write files in the deployed project before compilation.

It is designed to work with TypeScript/node.js projects. Others should work as well, but I didn't test that.

## Usage

For every file to be written into the deployed project directory, the following steps must be followed:

1. Create a Heroku config variable which name starts with `WF_`; the remaining part of the name doesn't matter
2. Paste the full path of the file to be created relative to your project root into the first line (don't prepend `/`)
3. Paste the content of your file into the variable (can be multi-line) into the second line (can be empty)

Note: Only use normal characters for the name of your variables:

- A-Z
- a-z
- underline
- 0-9

### Example

When using Angular, one may want to set their environment configuration files without exposing the API endpoint to the public via GitHub.
This use case is present in the [ExDateMan repository](https://github.com/Bernd-L/exDateMan), and is the reason for the existence of this buildpack.

The `environment.prod.ts` file in `PROJECT_ROOT/src/environments/` would be created by this build pack using the following Heroku config variable: `WF_Angular_prod_env` with the following content:

```TS
src/environments/environment.prod.ts
// This is a test file to which should get copied to Build/src/environments/environment.prod.ts

export const environment = {
  production: true,
  baseUrl: "/",
  greeting: "Hello there!"
};
```

The first line will be omitted form the output file.
It's just used to tell the buildpack where to create (or replace) the file.

## Installation

1. Add the GitHub repository URL as a buildpack to your Heroku app
2. Move up the newly added buildpack (It should be above any buildpack that relies on the files being created)

## Copyright notice

Copyright 2019 Bernd-L.

Licensed under the MIT licence (see the LICENSE file).
