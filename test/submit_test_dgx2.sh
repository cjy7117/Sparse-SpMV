#! /bin/bash

job_script_template=matrix_test_dgx2.sh

for matrix_file in $1
do
  for NGPU in 1 2 4 8 16
  do
    PART_OPT=0
    MERG_OPT=0
    NUMA=0

    job_script=matrix_test_dgx2_${matrix_file}_${NGPU}_${PART_OPT}_${MERG_OPT}_${NUMA}.sh
    cp ${job_script_template} ${job_script}
    sed -i 's/MMM/'"${matrix_file}"'/g' ${job_script}
    sed -i 's/GGG/'"${NGPU}"'/g' ${job_script}
    sed -i 's/PPP/'"${PART_OPT}"'/g' ${job_script}
    sed -i 's/EEE/'"${MERG_OPT}"'/g' ${job_script}
    sed -i 's/AAA/'"${NUMA}"'/g' ${job_script}
    ./${job_script}
    rm ./${job_script}

    PART_OPT=1
    MERG_OPT=1
    NUMA=0

    job_script=matrix_test_dgx2_${matrix_file}_${NGPU}_${PART_OPT}_${MERG_OPT}_${NUMA}.sh
    cp ${job_script_template} ${job_script}
    sed -i 's/MMM/'"${matrix_file}"'/g' ${job_script}
    sed -i 's/GGG/'"${NGPU}"'/g' ${job_script}
    sed -i 's/PPP/'"${PART_OPT}"'/g' ${job_script}
    sed -i 's/EEE/'"${MERG_OPT}"'/g' ${job_script} 
    sed -i 's/AAA/'"${NUMA}"'/g' ${job_script}
    ./${job_script}
    rm ./${job_script}

    PART_OPT=1
    MERG_OPT=1
    NUMA=1

    job_script=matrix_test_dgx2_${matrix_file}_${NGPU}_${PART_OPT}_${MERG_OPT}_${NUMA}.sh
    cp ${job_script_template} ${job_script}
    sed -i 's/MMM/'"${matrix_file}"'/g' ${job_script}
    sed -i 's/GGG/'"${NGPU}"'/g' ${job_script}
    sed -i 's/PPP/'"${PART_OPT}"'/g' ${job_script}
    sed -i 's/EEE/'"${MERG_OPT}"'/g' ${job_script} 
    sed -i 's/AAA/'"${NUMA}"'/g' ${job_script}
    ./${job_script}
    rm ./${job_script}


  done
done
    
