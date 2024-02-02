#!/bin/bash

NODE_VERSION=18
PNPM_VERSION=8

. ~/nvm/nvm.sh
. ~/.profile
. ~/.bashrc

echo "Set Node.js version..."

nvm use $NODE_VERSION



echo "Install PNPM..."

npm install -g pnpm@$PNPM_VERSION

echo "... Done!"

echo Using Node.js in version `node -v`
echo Using PNPM in version `pnpm -v`
