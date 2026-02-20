#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="${SCRIPT_DIR}/lib"

source "${LIB_DIR}/colors.sh"
source "${LIB_DIR}/system_metrics.sh"
source "${LIB_DIR}/views.sh"
source "${LIB_DIR}/summary.sh"
HOSTNAME=$(hostname)

function usage() {
    echo "Usage: hostpeek [--memory|--cpu|--disk|--tcp|--kernel|--all]"
}

case "$1" in 
    --memory)   print_header; memory_check ;;
    --cpu)      print_header; cpu_check ;;
    --disk)     print_header; disk_check ;;
    --tcp)      print_header; tcp_check ;;
    --kernel)   print_header; kernel_check ;;
    --all)      print_header; summary ;;
    *)          usage ;;
esac