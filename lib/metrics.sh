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