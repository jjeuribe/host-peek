#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="${SCRIPT_DIR}/lib"

source "${LIB_DIR}/colors.sh"
source "${LIB_DIR}/system_metrics.sh"
HOSTNAME=$(hostname)

function label() {
    message=$1
    label_width=$2

    printf "%-${label_width}s" "$(color_green "${message}")"
}

function print_header() {
    echo -e $(color_blue "[+] HostPeek - System Overview")
    echo -e $(color_blue "Host: ${HOSTNAME}")
    echo "---------------------------------------------"
}

function memory_check() {
    echo -e $(color_green "[+] Memory Usage")
    IFS="|" read used_memory free_memory <<< $(get_memory)
    echo "Used: ${used_memory}" 
    echo "Free: ${free_memory}"
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
    echo "Used:  ${used_disk}" 
    echo "Free:  ${free_disk}" 
    echo "Usage: ${used_disk_percent}"
    echo ""
}

function memory_summary() {
    IFS="|" read used_memory free_memory <<< $(get_memory)
    label "Memory:" 20
    echo "Used: ${used_memory} | Free: ${free_memory}"
}

function cpu_summary() {
    label "CPU:" 20
    echo "Load Avg: $(get_cpu)"
}

function disk_summary() {
    IFS="|" read used_disk free_disk used_disk_percent <<< $(get_disk)
    label "Disk:" 20
    echo "Used: ${used_disk} | Free: ${free_disk} | Usage: ${used_disk_percent}"
}

function tcp_summary() {
    label "TCP:" 20
    echo "Active TCP Connections: $(get_tcp)"
}

function kernel_summary() {
    label "Kernel:" 20
    echo "Version $(get_kernel)"
}

function summary() {
    memory_summary
    cpu_summary
    disk_summary
    tcp_summary
    echo ""
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
    --all)      print_header; summary ;;
    *)          usage ;;
esac