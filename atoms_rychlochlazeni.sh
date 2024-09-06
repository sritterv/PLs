#!/bin/bash

input_file="dump_zif8_nme4_cl_1000.lammpstrj"

for n in {1..5}; do
    start_line=$(( (n+4)*4452100 + 10 ))	#pocet atomu +9 krát 100
    end_line=$(( (n+4)*4452100 + 44521 ))	#pocet atomu +9 krát 100, poèet atomù +9

    output_file="atoms_zif8_nme4_cl_1000_r$n.lmp"

    # extrahuje pouze 1., 2., 3., 5., 6., 7. a 8. sloupec
    awk -v start="$start_line" -v end="$end_line" 'NR>=start && NR<=end {print $1, $2, $3, $5, $6, $7, $8, $9, $10, $11}' "$input_file" > "$output_file"

    echo "Vytvoren soubor: $output_file"
done
