#!/bin/bash

echo "❯ yarn install"
yarn 2>/dev/null
echo ""

echo "❯ yarn why prettier"
yarn why prettier 2>/dev/null
echo ""

echo "❯ yarn prettier -v"
yarn prettier -v
echo ""

echo "❯ node prettier-version.js"
node prettier-version.js
echo ""

echo "❯ yarn workspace @ywsbv/unrelated-package add uuid"
yarn workspace @ywsbv/unrelated-package add uuid 2>/dev/null
echo ""

echo "❯ yarn why prettier"
yarn why prettier 2>/dev/null
echo ""

echo "❯ yarn prettier -v"
yarn prettier -v
echo ""

echo "❯ node prettier-version.js"
node prettier-version.js
echo ""

echo "❯ yarn install"
yarn 2>/dev/null
echo ""

echo "❯ yarn prettier -v"
yarn prettier -v
echo ""

echo "❯ node prettier-version.js"
node prettier-version.js
echo ""
