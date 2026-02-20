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