function export_to_json() {
    # Memory details
    IFS="|" read used_memory free_memory <<< $(get_memory)
    # CPU details
    cpu_load=$(get_cpu)
    # Disk details
    IFS="|" read used_disk free_disk used_disk_percent <<< $(get_disk)
    # TCP details
    tcp_connections=$(get_tcp)
    # Kernel details
    kernel_version=$(get_kernel)

cat <<JSON
{
    "memory": {
        "used": "$used_memory",
        "free": "$free_memory"
    },
    "cpu": {
        "load_avg": "$cpu_load"
    },
    "disk": {
        "used": "$used_disk",
        "free": "$free_disk",
        "usage_percent: "$used_disk_percent"
    }, 
    "tcp": {
        "active_connections": "$tcp_connections"
    },
    "kernel": {
        "version": "$kernel_version"
    }
}
JSON
}