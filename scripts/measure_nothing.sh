#!/bin/sh
OUT_DIR=""
NUM_EXPS=1
SETUP_FILE=""
SETUP_COMMAND=cp
PYTHON_COMMAND=""


while getopts "o:n:p:" opt; do
  case "$opt" in
	o)
		OUT_DIR="$OPTARG/exp_baseline"
		;;
    
	n)
		NUM_EXPS=$OPTARG
		;;
    
    p)
        PYTHON_COMMAND="$OPTARG"
        ;;
  esac
done

mkdir -p $OUT_DIR
sudo chmod a+w,a+r $OUT_DIR
OUT_FILE=$OUT_DIR/raw.txt

pinpoint -c --timestamp -r $NUM_EXPS -e rapl:pkg,GPU -o $OUT_FILE -- $PYTHON_COMMAND nothing.py -o$OUT_DIR -t$1
chmod a+w,a+r $OUT_FILE
