#!/usr/bin/env bash

set -eu

[ "${1:-}" == "bash" ] && cd /src && exec bash "${@:2}"

print_help() {
    echo "Valid commands:
    make [target]      Runs make, by default the all target is executed
    build [pattern]    Runs the build-all.sh script, if pattern given, only build targets which match
    clean              Shortcut for \"make clean\"
    bash [...args]     Execute bash shell
    help               Show this help text..."
}

case "${1:-}" in
    build) CMD=(./build-all.sh) ;;
    make) CMD=(make) ;;
    clean) CMD=(make clean) ;;
    help) print_help && exit ;;
    *) >&2 print_help && exit 1 ;;
esac

WORK_DIR=/src/ToyKeeper/spaghetti-monster/anduril

if [ -d "$WORK_DIR" ]; then
    cd "$WORK_DIR"
else
    echo "Source directory not found: $WORK_DIR"
    echo "Please verify source files"
    exit 1
fi

exec "${CMD[@]}" "${@:2}"