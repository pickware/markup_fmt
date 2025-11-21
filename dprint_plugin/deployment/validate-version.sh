#!/bin/bash
set -euo pipefail

TAG="${GITHUB_REF#refs/tags/}"
VERSION="${TAG#v}"
PLUGIN_CARGO_VERSION=$(grep -E '^version\s*=' dprint_plugin/Cargo.toml | sed -E 's/^version\s*=\s*"([^"]+)".*/\1/')
CORE_CARGO_VERSION=$(grep -E '^version\s*=' markup_fmt/Cargo.toml | sed -E 's/^version\s*=\s*"([^"]+)".*/\1/')

if [ "${VERSION}" != "${PLUGIN_CARGO_VERSION}" ]; then
    echo "Error: Tag version (${VERSION}) does not match dprint_plugin Cargo.toml version (${PLUGIN_CARGO_VERSION})"
    exit 1
fi
if [ "${VERSION}" != "${CORE_CARGO_VERSION}" ]; then
    echo "Error: Tag version (${VERSION}) does not match markup_fmt Cargo.toml version (${CORE_CARGO_VERSION})"
    exit 1
fi
echo "Version validation passed: ${VERSION}"