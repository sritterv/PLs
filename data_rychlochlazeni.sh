#!/bin/bash

input_file="data_zif8_nme4_cl_1000.10000000.lmp"

# duplikuje puvodni soubor a pojmenuje duplikaty
for n in {1..5}; do
    output_file="data_zif8_nme4_cl_1000_r$n.lmp"
    cp "$input_file" "$output_file"

    # nahradi radky 92 az 44603 odpovidajicimi radky z atoms souboru
    atoms_file="atoms_zif8_nme4_cl_1000_r$n.lmp"
    sed -i "92,44603d" "$output_file"			#na jakych radcich zacina a konci atom list (92 a 91+pocet atomu)
    sed -i -e "91r $atoms_file" "$output_file"		#sem dat o jeden radek mene, nez kde to realne zacina

    echo "Vytvoren data soubor: $output_file"
done
