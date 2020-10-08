#!/bin/bash

for subrun in "1001 4" "1002 4" "1003 4" "1004 4" "1005 4" "1006 4" "1007 4" "1008 4" "1009 4" "1010 4" "1011 4" "1012 4" "1013 4" "1014 4" "1015 4" "1016 4" "1017 4" "1018 4" "1019 4" "1020 4" "1021 4" "1022 4" "1023 4" "1024 4" "1025 4" "1026 4" "1027 4" "1028 4"; do
        set -- $subrun
        sub=$1
        nruns=$2
        NCORES=5
        while [ $(ps -ef | grep -v grep | grep fmriprep.sh | wc -l) -ge $NCORES ]; do
                sleep 1s
        done
        bash runfMRIprep.sh $sub &
        sleep 5s
done
 
sleep 5m

python3 /data/tools/general/MakeConfounds.py --fmriprepDir="/data/projects/rutgers-socreward/derivatives/fmriprep/"
#python3 /data/tools/general/OutlierID.py --mriqcDir="/data/projects/rutgers-socreward/data/mriqc"
