#!/bin/bash

# Maria Stalteri
# 01/12/2014
# run_extract_Pos_Raw_Countsg.sh

# shell script to automate  extracting Positive
# control lines from Nanostring .RCC files,
# same procedure for each of 12 files in 1 cartridge,
# run the perl script 12 times;

base_dir=/home/maria/Maria_nanostring_analysis
cd $base_dir

# this is an arithmetic for loop in bash
# doesn't quite work because 1 to 9 have a zero in front
# for (( i=1; i <= 12; i++ ))

for i in 01 02 03 04 05 06 07 08 09 10 11 12
do

    ./extractPosRawCounts.pl    \
    Cartridge3_CNG_I_U_12h_9h/20140723_cng-9h-12h_${i}.RCC  >  \
    Cartridge3_Pos_raw_data/20140723_cng-9h-12h_${i}_raw_ct_pos.txt


done

