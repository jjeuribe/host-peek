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
    kernel_summary
    echo ""
}