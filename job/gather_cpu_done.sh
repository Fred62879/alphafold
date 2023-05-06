#!/bin/bash

dir="/home/fred862/scratch/fred862/data/bioinfo/output/ds${1}_af_full/poly_g_20"
cd $dir

ret=()

for d in */
do
    fn="${d}/msas/bfd_uniclust_hits.a3m"
    if test -f ${fn}; then
	ret+=(${d:0:4})
    fi
done

echo ${ret[@]}
