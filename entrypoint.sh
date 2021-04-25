#!/bin/bash

BINDIR=/chia/bin
TEMPDIR=/chia/temp
PLOTSDIR=/chia/plots
PLOTSIZE=32

if [[ -z $FARMERKEY ]]; then
  echo "FARMERKEY environment variable missing. Please supply both with the docker '-e' option."
  exit 1
fi
if [[ -z $POOLKEY ]]; then
  echo "POOLKEY environment variable missing. Please supply both with the docker '-e' option."
  exit 1
fi

if [[ ! -d $TEMPDIR ]]; then
  echo "Temp directory does not exist. Please bind mount a volume with the docker '-v' option to '$TEMPDIR'."
  exit 1
fi
if [[ ! -d $PLOTSDIR ]]; then
  echo "Plots directory does not exist. Please bind mount a volume with the docker '-v' option to '$PLOTSDIR'."
  exit 1
fi

cd $BINDIR
. ./activate
chia init

if [[ ! -z $COUNT ]]; then
  plotargs="$plotargs -n $COUNT"
fi
if [[ ! -z $MEMSIZE ]]; then
  plotargs="$plotargs -b $MEMSIZE"
fi
if [[ ! -z $THREADS ]]; then
  plotargs="$plotargs -r $THREADS"
fi
if [[ ! -z $BUCKETS ]]; then
  plotargs="$plotargs -u $BUCKETS"
fi
chia plots create -k $PLOTSIZE -f $FARMERKEY -p $POOLKEY -t $TEMPDIR -d $PLOTSDIR $plotargs
if [[ $? -ne 0 ]]; then
  echo "ERROR: Plotting failed"
  exit 1
fi

echo "All done. Have a nice day."
