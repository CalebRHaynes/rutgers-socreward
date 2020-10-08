# example code for MRIQC
# runs MRIQC on input subject
# usage: bash run_mriqc.sh sub
# example: bash run_mriqc.sh 102

#echo "sleeping for 30 minutes at `date`"
singularity run --cleanenv \
    -B /data/projects/rutgers-socreward/data/bids:/data \
    -B /data/projects/rutgers-socreward/data/mriqc:/out \
    -B /data/scratch/caleb:/scratch \
    /data/tools/mriqc-0.15.1.simg \
    /data /out \
    participant -w /scratch
sleep 15m 
