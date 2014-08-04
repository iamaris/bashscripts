#!/bin/bash


cd /uscms_data/d2/aris/CMSSW_6_1_2/src/limits

mglu=$1
mchi=$2
xs=$3
s0=$4
s1=$5
s2=$6
s3=$7
s4=$8
s5=$9

xss=0.999
#xs=6.34
#s0=6
#s1=9
#s2=6
#s3=6
#s4=2
#s5=3

r0=$(echo "scale=3;$s0*$xs*$xss" | bc)
r1=$(echo "scale=3;$s1*$xs*$xss" | bc)
r2=$(echo "scale=3;$s2*$xs*$xss" | bc)
r3=$(echo "scale=3;$s3*$xs*$xss" | bc)
r4=$(echo "scale=3;$s4*$xs*$xss" | bc)
r5=$(echo "scale=3;$s5*$xs*$xss" | bc)
echo $r0 $r1 $r2 $r3 $r4 $r5
echo $mglu $mchi
#python computeLimits1.py ./cards/T5wg_${mglu}_${mchi}.dat ./log/T5wg_${mglu}_${mchi}.log ./out || exit 1
cp aris2.txt aris3.txt
#runme=$(echo root.exe -q count.C+\(\"${mglu}\",\"${mchi}\"\))
#$runme >> Tw5g.cnt

sed -i "s/6.85e-01/${xs}/g" aris3.txt
sed -i "s/6.83e-01/${xs}/g" aris3.txt
sed -i "s/7.20e-01/${xs}/g" aris3.txt
sed -i "s/6.89e-01/${xs}/g" aris3.txt
sed -i "s/6.36e-01/${xs}/g" aris3.txt
sed -i "s/9.55e-01/${xs}/g" aris3.txt

sed -i "s/107.491/${r0}/g" aris3.txt
sed -i "s/66.285/${r1}/g" aris3.txt
sed -i "s/49.667/${r2}/g" aris3.txt
sed -i "s/39.977/${r3}/g" aris3.txt
sed -i "s/12.088/${r4}/g" aris3.txt
sed -i "s/8.598/${r5}/g" aris3.txt

sed -i "s/157/${s0}/g" aris3.txt
sed -i "s/97/${s1}/g" aris3.txt
sed -i "s/69/${s2}/g" aris3.txt
sed -i "s/58/${s3}/g" aris3.txt
sed -i "s/19/${s4}/g" aris3.txt
sed -i "s/99/${s5}/g" aris3.txt

cp ./aris3.txt ./aris/T5wg_${mglu}_${mchi}.dat 
