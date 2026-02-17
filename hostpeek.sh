#!/bin/bash
red='\e[31m'
green='\e[32m'
blue='\e[34m'
clear='\e[0m'
host_name=$(hostname)

function color_red() {
    echo -ne $red$1$clear
}

function color_green() {
    echo -ne $green$1$clear
}

function color_blue() {
    echo -ne $blue$1$clear
}

function get_memory() {
    free -h | awk 'NR==2 {print $3 "|" $4}'
}

function memory_check() {
    echo -e $(color_green "[+] Memory Usage")
    IFS="|" read used_memory free_memory <<< $(get_memory)
    echo "Used: ${used_memory} | Free: ${free_memory}"
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

function main_menu() {
    echo -e $(color_green '1)') Memory usage
    echo -e $(color_green '2)') CPU load
    echo -e $(color_green '3)') Number of TCP connections
    echo -e $(color_green '4)') Kernel version
    echo -e $(color_green '0)') Exit
    echo -ne $(color_blue 'Choose an option: ')

    read menu_option

    case $menu_option in
        1) memory_check; main_menu;;
        2) cpu_check; main_menu;;
        3) tcp_check; main_menu;;
        4) kernel_check; main_menu;;
        0) exit 0;;
        *) echo -e $(color_red "Wrong option!"); main_menu;;
    esac
}

main_menu