#!/bin/bash

host_name=$(hostname)

function memory_check() {
    echo ""
    echo "The current memory usage on ${host_name} is: "
    free -h
    echo ""
}

function cpu_check() {
    echo ""
    echo "CPU load on ${host_name} is: "
    echo ""
    uptime
    echo ""
}

function tcp_check() {
    echo ""
    echo "TCP connections on ${host_name}: "
    echo ""
    cat /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
    echo "Kernel version on ${host_name} is: "
    echo ""
    uname -r
    echo ""
}

memory_check
cpu_check
tcp_check
kernel_check