red='\e[31m'
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

function color_red() {
    echo -ne $red$1$clear
}

function color_green() {
    echo -ne $green$1$clear
}

function color_blue() {
    echo -ne $blue$1$clear
}