#! /bin/bash

folder=$(eval pwd)
now=$(eval date +%s)
for dir in /*/;do
	last_mod=$(eval date -r \"dir\" +%s)
	diff=$($last_mod - $now)
	if [[ $($diff < 86400) ]]; then 
		cd $dir
		pwd
		lftp << OEF 
		open 10.0.0.27 
		login nmt 0000
		cd SATA_DISK/Video 
		put $dir/* 
		quit 
OEF
fi
done
