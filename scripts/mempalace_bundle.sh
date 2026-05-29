#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Create or install the MemPalace backend bundle.

Usage:
  scripts/mempalace_bundle.sh create [output_zip]
  scripts/mempalace_bundle.sh install <bundle_zip> <target_repo_root>

Examples:
  scripts/mempalace_bundle.sh create dist/mempalace-backend-bundle.zip
  scripts/mempalace_bundle.sh install dist/mempalace-backend-bundle.zip /opt/macae
USAGE
}

FILES=(
  "src/backend/app_config.py"
  "src/backend/utils_kernel.py"
  "src/backend/kernel_agents/agent_factory.py"
  "src/backend/context/memory_provider.py"
  "src/backend/context/mempalace_memory_kernel.py"
)

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

command="$1"
shift

case "$command" in
  create)
    output_zip="${1:-dist/mempalace-backend-bundle.zip}"
    mkdir -p "$(dirname "$output_zip")"

    for file in "${FILES[@]}"; do
      if [[ ! -f "$file" ]]; then
        echo "Missing expected file: $file" >&2
        exit 1
      fi
    done

    zip -q "$output_zip" "${FILES[@]}"
    echo "Bundle created at: $output_zip"
    ;;

  install)
    if [[ $# -ne 2 ]]; then
      usage
      exit 1
    fi

    bundle_zip="$1"
    target_root="$2"

    if [[ ! -f "$bundle_zip" ]]; then
      echo "Bundle not found: $bundle_zip" >&2
      exit 1
    fi

    mkdir -p "$target_root"
    unzip -o "$bundle_zip" -d "$target_root" >/dev/null
    echo "Installed MemPalace files into: $target_root"
    ;;

  *)
    usage
    exit 1
    ;;
esac
