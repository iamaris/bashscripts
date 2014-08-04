#!/bin/bash


cd /uscms_data/d2/aris/CMSSW_6_1_2/src/limits

for mglu in $(seq 400 50 1300); do
#for mglu in $(seq 400 50 800); do
    #[ $mglu -ge 800 -a $mglu -lt 1000 ] && continue
    for mchi in $(seq 25 50 $mglu); do
        echo $mglu $mchi
        #python computeLimits1.py ./cards/T5wg_${mglu}_${mchi}.dat ./log/T5wg_${mglu}_${mchi}.log ./out || exit 1
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
        sed -i '$ d' cards/T5wg_${mglu}_${mchi}.dat 
    done
done
       
