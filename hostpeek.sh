#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="${SCRIPT_DIR}/lib"

source "${LIB_DIR}/colors.sh"

host_name=$(hostname)

function get_memory() {
    free -h | awk 'NR==2 {print $3 "|" $4}'
}

function get_cpu() {
    uptime | awk -F 'load average:' '{print $2}' | xargs
}

function get_tcp() {
    ss -ant | wc -l
}

function get_kernel() {
    uname -r
}

function get_disk() {
    df -h / | awk 'NR==2 {print $3 "|" $4 "|" $5}'
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
    --memory)   memory_check ;;
    --cpu)      cpu_check ;;
    --disk)     disk_check ;;
    --tcp)      tcp_check ;;
    --kernel)   kernel_check ;;
    --all)      summary ;;
    *)          usage ;;
esac