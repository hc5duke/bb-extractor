if [[ -z "${MIN_SCORE}" ]]; then
  MIN_SCORE=0.02
fi

if [[ -z "${OUTPUT}" ]]; then
  OUTPUT=./out
fi

RESIZ="-vf scale=${RESIZE}"
if [[ -z "${RESIZE}" ]]; then
  RESIZ=""
fi

if [[ -z "${QUALITY}" ]]; then
  QUALITY=23 # 0=lossless 23=default 51=worst
fi

for file in $INPUT
do
  BASE=`basename $file`
  echo "Processing ${BASE}"
  mkdir -p "${OUTPUT}/${BASE}"

  # extract frames
  ffmpeg -i $file -y -r 5 -qscale:v $QUALITY $RESIZ "${OUTPUT}/${BASE}/f%08d.jpg" 2> /dev/null

  # extract scene metadata
  ffmpeg -i $file -y \
    -vf "select=gt(scene\,${MIN_SCORE}),metadata=print:file=${OUTPUT}/${BASE}/time.txt" \
    -vsync vfr -f null /dev/null 2> /dev/null
done

