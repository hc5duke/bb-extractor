if [[ -z "${FPS}" ]]; then
  FPS=5
fi

if [[ -z "${MIN_SCORE}" ]]; then
  MIN_SCORE=0.1
fi

if [[ -z "${INPUT}" ]]; then
  INPUT="./res/halloween7_2.mp4"
fi

if [[ -z "${OUTPUT}" ]]; then
  OUTPUT=./out
fi

if [[ -z "${RESIZE}" ]]; then
  RESIZ=""
else
  RESIZ="-vf scale=${RESIZE}"
fi

QUALITY=23 # 0=lossless 23=default 51=worst

# extract frames
ffmpeg -i $INPUT -y -r 24/1.001 -qscale:v $QUALITY $RESIZ "${OUTPUT}/f%08d.jpg"

# extract scene metadata
ffmpeg -i $INPUT -y \
  -vf "select=gt(scene\,${MIN_SCORE}),metadata=print:file=${OUTPUT}/time.txt" \
  -vsync vfr -f null /dev/null
