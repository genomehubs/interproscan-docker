#!/bin/bash

INPUT=$@;
CMD=
LAST=''
OUTDIR=

for string in $INPUT; do
  if [[ $string =~ \.gz$ ]]; then
    filename=${string/\/*\//};
    cp $string /tmp/$filename
    gunzip /tmp/$filename
    filename=${filename%.gz}
    string=/tmp/$filename
    sed -i 's/\*/X/g' $string
  fi
  if [[ "$LAST" == "-d" ]]; then
    OUTDIR=$string
  fi
  LAST=$string
echo $LAST
  CMD=$CMD" "$string
done

/interproscan-5.22-61.0/interproscan.sh $CMD &&
mv $OUTDIR/$filename.tsv $OUTDIR/$filename.interproscan.tsv &&
gzip $OUTDIR/$filename.interproscan.tsv

