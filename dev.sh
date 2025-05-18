#!/bin/bash

set -e

local MOD_NAME="even-more-text-plates-2_0";

if [ ! "${FACTORIO_PATH}" ]; then
    echo "No Factorio path found";
    exit 1;
fi

if [ ! -d "${FACTORIO_PATH}/mods" ]; then
    mkdir -v "${FACTORIO_PATH}/mods";
fi

local MOD_VERSION=$(grep '"version"' "${MOD_NAME}/info.json"| cut -d ":" -f2 | sed 's/[",]//g');

echo "Symbolic linking \"${MOD_NAME}\" v${MOD_VERSION} to \"${FACTORIO_PATH}/mods/${MOD_NAME}\"";

if [[ -e "${FACTORIO_PATH}/mods/${MOD_NAME})" ]]; then
    echo "[WARNING] \"${FACTORIO_PATH}/mods/${MOD_NAME}\" already exists, attempting to delete..."
    unlink ${FACTORIO_PATH}/mods/${MOD_NAME}
fi

ln -sfv "${PWD}/${MOD_NAME}" "${FACTORIO_PATH}/mods/${MOD_NAME}";

unset MOD_NAME
unset MOD_VERSION
