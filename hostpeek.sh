#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="${SCRIPT_DIR}/lib"

source "${LIB_DIR}/colors.sh"
source "${LIB_DIR}/metrics.sh"
HOSTNAME=$(hostname)

function print_header() {
    echo -e $(color_blue "[+] HostPeek - System Overview")
    echo -e $(color_blue "Host: ${HOSTNAME}")
    echo "---------------------------------------------"
}

function memory_check() {
    echo -e $(color_green "[+] Memory Usage")
    IFS="|" read used_memory free_memory <<< $(get_memory)
    echo "Used: ${used_memory} | Free: ${free_memory}"
    echo ""
}

function cpu_check() {
    echo -e $(color_green "[+] CPU Load")
    echo "Load Avg: $(get_cpu)"
    echo ""
}

function tcp_check() {
    echo -e $(color_green "[+] TCP Connections")
    echo "Active TCP Connections: $(get_tcp)"
    echo ""
}

function kernel_check() {
    echo -e $(color_green "[+] Kernel Version")
    echo $(get_kernel)
    echo ""
}

function disk_check() {
    echo -e $(color_green "[+] Disk Usage")
    IFS="|" read used_disk free_disk used_disk_percent <<< $(get_disk)
    echo "Used: ${used_disk} | Free: ${free_disk} | Usage: ${used_disk_percent}"
    echo ""
}

function summary() {
    memory_check
    cpu_check
    disk_check
    tcp_check
    kernel_check
}

function usage() {
    echo "Usage: hostpeek [--memory|--cpu|--disk|--tcp|--kernel|--all]"
}

case "$1" in 
    --memory)   print_header; memory_check ;;
    --cpu)      print_header; cpu_check ;;
    --disk)     print_header; disk_check ;;
    --tcp)      print_header; tcp_check ;;
    --kernel)   print_header; kernel_check ;;
    --all)      summary ;;
    *)          usage ;;
esac