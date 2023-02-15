# Yarn workspace transitive dependency inconsistency in .bin

Demonstrates the issue described in https://github.com/yarnpkg/yarn/issues/8890

## Reproduction

`yarn install`
```shell
yarn install v1.22.19
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
[4/4] 🔨  Building fresh packages...
✨  Done in 1.55s.
```

`yarn why prettier`
```shell
yarn why v1.22.19
[1/4] 🤔  Why do we have the module "prettier"...?
[2/4] 🚚  Initialising dependency graph...
[3/4] 🔍  Finding dependency...
[4/4] 🚡  Calculating file sizes...
=> Found "prettier@2.8.4"
info Has been hoisted to "prettier"
info Reasons this module exists
   - "workspace-aggregator-a42f4464-5bf4-43b0-83e3-95dcf9900c47" depends on it
   - Specified in "devDependencies"
   - Hoisted from "_project_#prettier"
info Disk size without dependencies: "11.21MB"
info Disk size with unique dependencies: "11.21MB"
info Disk size with transitive dependencies: "11.21MB"
info Number of shared dependencies: 0
=> Found "@storybook/mdx1-csf#prettier@2.3.0"
info This module exists because "_project_#@ywsvb#package-with-transitive-prettier-dep#@storybook#addon-essentials#@storybook#addon-docs#@storybook#mdx1-csf" depends on it.
info Disk size without dependencies: "19.01MB"
info Disk size with unique dependencies: "19.01MB"
info Disk size with transitive dependencies: "19.01MB"
info Number of shared dependencies: 0
=> Found "@storybook/source-loader#prettier@2.3.0"
info This module exists because "_project_#@ywsvb#package-with-transitive-prettier-dep#@storybook#addon-essentials#@storybook#addon-docs#@storybook#source-loader" depends on it.
info Disk size without dependencies: "19.01MB"
info Disk size with unique dependencies: "19.01MB"
info Disk size with transitive dependencies: "19.01MB"
info Number of shared dependencies: 0
✨  Done in 0.26s.
```

`yarn prettier -v`
```
yarn run v1.22.19
$ /Users/jonscheiding/Code/Personal/yarn-workspace-bin-version-issue/node_modules/.bin/prettier -v
2.8.4
✨  Done in 0.32s.
```

`node prettier-version.js`
```
2.8.4
```

`yarn workspace @ywsbv/unrelated-package add uuid`
```shell
yarn workspace v1.22.19
yarn add v1.22.19
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
[4/4] 🔨  Building fresh packages...
success Saved lockfile.
success Saved 1 new dependency.
info Direct dependencies
info All dependencies
└─ uuid@9.0.0
✨  Done in 1.89s.
✨  Done in 2.05s.
```

`yarn why prettier`
```shell
yarn why v1.22.19
[1/4] 🤔  Why do we have the module "prettier"...?
[2/4] 🚚  Initialising dependency graph...
[3/4] 🔍  Finding dependency...
[4/4] 🚡  Calculating file sizes...
=> Found "prettier@2.8.4"
info Has been hoisted to "prettier"
info Reasons this module exists
   - "workspace-aggregator-3bec8ec4-773b-4509-8319-994d89d84355" depends on it
   - Specified in "devDependencies"
   - Hoisted from "_project_#prettier"
info Disk size without dependencies: "19.01MB"
info Disk size with unique dependencies: "19.01MB"
info Disk size with transitive dependencies: "19.01MB"
info Number of shared dependencies: 0
=> Found "@storybook/mdx1-csf#prettier@2.3.0"
info This module exists because "_project_#@ywsvb#package-with-transitive-prettier-dep#@storybook#addon-essentials#@storybook#addon-docs#@storybook#mdx1-csf" depends on it.
=> Found "@storybook/source-loader#prettier@2.3.0"
info This module exists because "_project_#@ywsvb#package-with-transitive-prettier-dep#@storybook#addon-essentials#@storybook#addon-docs#@storybook#source-loader" depends on it.
✨  Done in 0.26s.
```

`yarn prettier -v`
```shell
yarn run v1.22.19
$ /Users/jonscheiding/Code/Personal/yarn-workspace-bin-version-issue/node_modules/.bin/prettier -v
2.3.0
✨  Done in 0.26s.
```

`node prettier-version.js`
```
2.3.0
```

`yarn install`
```shell
yarn install v1.22.19
[1/4] 🔍  Resolving packages...
[2/4] 🚚  Fetching packages...
[3/4] 🔗  Linking dependencies...
[4/4] 🔨  Building fresh packages...
✨  Done in 1.57s.
```

`yarn prettier -v`
```shell
yarn run v1.22.19
$ /Users/jonscheiding/Code/Personal/yarn-workspace-bin-version-issue/node_modules/.bin/prettier -v
2.8.4
✨  Done in 0.26s.
```

`node prettier-version.js`
```
2.3.0
```
