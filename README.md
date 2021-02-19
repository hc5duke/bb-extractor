# bb-framer

frame data extractor

## Requirements

- ffmpeg

## Running

### Input:

- Movie file

### Output:

- thumbnails at set interval
  - default=5fps
- keyframe metadata at given scene detection score threshold
  - default=0.05 min score
  - does not generate images

### Example usage:

```bash
# FPS: frames per second
# MIN_SCORE: minimum scene detection score threshold
# RESIZE: width:height
$ FPS=10 \
  MIN_SCORE=0.01 \
  RESIZE=480:270 \
  INPUT=./res/halloween7_2.mp4 \
  make
```
