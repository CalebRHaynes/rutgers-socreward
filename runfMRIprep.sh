#!/bin/bash

sub=$1 

singularity run \
    --cleanenv \
    -B /data/projects/rutgers-socreward/:/base \
    -B /data/tools/licenses:/opts \
    -B /data/scratch/caleb:/scratch \
    -B /data/projects/rutgers-socreward/data/bids:/sourcedata \
    /data/tools/fmriprep-20.0.7.simg \
    /sourcedata /base/data/ \
    participant --participant_label $sub \
    --use-aroma --fs-no-reconall \
    --fs-license-file /opts/fs_license.txt \
    -w /scratch/caleb

