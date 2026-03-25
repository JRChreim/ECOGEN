#!/bin/bash
#
## Required PBS Directives --------------------------------------
#PBS -A ONRDC48542612
#PBS -q debug
#PBS -l select=1:ncpus=192:mpiprocs=192
#PBS -l walltime=00:20:00
#
## Optional PBS Directives --------------------------------------
#PBS -N "ST1DECGN"
#PBS -o "ST1DECGN.out"
#PBS -e "ST1DECGN.err"
#PBS -V
#
## Execution Block ----------------------------------------------
# Environment Setup
# Get sequence number of unique job identifier
JOBID=`echo $PBS_JOBID | cut -d '.' -f 1`
#
# Launching
# copy executable from $HOME and execute it with a .out output file
ecogen
module load gcc/14.2.0 openmpi
mpirun -np 2 ECOGEN
#
# Don't forget to archive and clean up your results (see the ERDC DSRC Archive Guide for details)