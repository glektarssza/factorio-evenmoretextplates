#!/bin/bash

local MOD_NAME="even-more-text-plates-2.0"

if [ ! "${FACTORIO_PATH}" ]; then
    echo "No Factorio path found"
    exit 1
fi

if [ ! -d "${FACTORIO_PATH}/mods" ]; then
    mkdir -v "${FACTORIO_PATH}/mods"
fi

local MOD_VERSION=$(grep '"version"' "${MOD_NAME}/info.json"| cut -d ":" -f2 | sed 's/[",]//g')

echo "${MOD_VERSION}"

ln -sfv "${PWD}/${MOD_NAME}" "${FACTORIO_PATH}/mods/${MOD_NAME}_${MOD_VERSION}"
