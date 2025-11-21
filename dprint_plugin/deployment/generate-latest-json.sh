#!/bin/bash
set -euo pipefail

TAG="${GITHUB_REF#refs/tags/}"

# Remove the 'v' prefix
VERSION="${TAG#v}"

REPO_URL="https://github.com/pickware/markup_fmt"

cat > dprint_plugin/deployment/latest.json <<EOF
{
  "schemaVersion": 1,
  "url": "${REPO_URL}/releases/download/${TAG}/plugin.wasm",
  "version": "${VERSION}"
}
EOF

echo "Generated latest.json with version: ${VERSION}"

