#!/bin/bash 

STYLE_ID=${1:?}
COLOR=${2:?}

if ! grep -q "^${1}" "inventory.csv"; then
    echo "Style ID ${1} not found. Please enter a valid Style ID."
    exit 0
fi

STYLE_ROWS=$(grep "${1},null" 'inventory.csv')
STYLE_COUNT=$(grep "${1},null" -o 'inventory.csv' | wc -l)

if [ $STYLE_COUNT == 0 ]; then
    echo "There are no units of Style #${1} currently in stock."
    exit 0
fi

COLOR_ROWS=$(echo $STYLE_ROWS | grep ",${2},")
COLOR_COUNT=$(echo $STYLE_ROWS | grep -o ",${2}," | wc -l)

if [ $COLOR_COUNT == 0 ]; then
    echo "There are no ${2} units of Style #${1} currently in stock."
    exit 0
fi

XS_STOCK=$(echo $COLOR_ROWS | grep -o ",XS," | wc -l)
S_STOCK=$(echo $COLOR_ROWS | grep -o ",S," | wc -l)
M_STOCK=$(echo $COLOR_ROWS | grep -o ",M," | wc -l)
L_STOCK=$(echo $COLOR_ROWS | grep -o ",L," | wc -l)
XL_STOCK=$(echo $COLOR_ROWS | grep -o ",XL," | wc -l)

echo "Style: ${1} - Color: ${2}"
echo "Current Stock: "
echo "XS: $XS_STOCK"
echo "S: $S_STOCK"
echo "M: $M_STOCK"
echo "L: $L_STOCK"
echo "XL: $XL_STOCK"