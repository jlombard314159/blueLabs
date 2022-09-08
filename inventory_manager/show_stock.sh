#!/bin/bash 

STYLE_ID=${1:?}
COLOR=${2:?}

if ! grep -q "^${1}" "inventory.csv"; then
    echo "Style ID ${1} not found. Please enter a valid Style ID."
    exit 0
fi

STYLE_ROWS=($(grep "^${1},null" 'inventory.csv'))

if [ ${#STYLE_ROWS[@]} == 0 ]; then
    echo "There are no units of Style #${1} currently in stock."
    exit 0
fi
echo $STYLE_ROWS
COLOR_ROWS=($(echo $STYLE_ROWS | grep ",${2},"))
echo $COLOR_ROWS

if [ ${#COLOR_ROWS[@]} == 0 ]; then
    echo "There are no ${2} units of Style #${1} currently in stock."
    exit 0
fi

XS_STOCK = ($(echo $COLOR_ROWS | grep ",XS,"))
S_STOCK = ($(echo $COLOR_ROWS | grep ",S,"))
M_STOCK = ($(echo $COLOR_ROWS | grep ",M,"))
L_STOCK = ($(echo $COLOR_ROWS | grep ",L,"))
XL_STOCK = ($(echo $COLOR_ROWS | grep ",XL,"))

echo "Current Stock: "
echo "XS: ${#XS_STOCK[@]}"
echo "S: ${#S_STOCK[@]}"
echo "M: ${#M_STOCK[@]}"
echo "L: ${#L_STOCK[@]}"
echo "XL: ${#XL_STOCK[@]}"





