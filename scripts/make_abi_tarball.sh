#!/bin/bash

ARTIFACTS_DIR="$PWD/artifacts"
CONTRACTS_ARTIFACTS_DIR="$ARTIFACTS_DIR/contracts"
ABI_OUT_DIR="$ARTIFACTS_DIR/abis"

GIT_TAG="$1"

mkdir -p "$ABI_OUT_DIR"

remove_pwd () {
  pathname="$1"
  res=$(echo "$pathname" | sed s+"$PWD/artifacts/contracts/"++)

  echo "$res"
}

walk_dir () {
  shopt -s nullglob dotglob

  for pathname in "$1"/*; do
    if [ -d "$pathname" ]; then
      case "$pathname" in
        *.sol)
          ;;
        *)
          dir_name=$(remove_pwd "$pathname")
           mkdir -p "$ABI_OUT_DIR/$dir_name"
      esac
      walk_dir "$pathname"
    else
      case "$pathname" in
        *.dbg.json)
          ;;
        *.json)
          sol_name=$(echo "$pathname" | ggrep -Eoe "([A-Za-z0-9]+\.sol)")
          path_name=$(remove_pwd "$pathname")
          path_name=$(echo "$path_name" | sed s+"/$sol_name"++)
          path_name="$ABI_OUT_DIR/$path_name"
          cat "$pathname" | jq '.abi' > "$path_name"
      esac
    fi
  done
}

walk_dir "$CONTRACTS_ARTIFACTS_DIR"

tar -cPzvf "abis_$GIT_TAG.tar.gz" --numeric-owner -C artifacts abis