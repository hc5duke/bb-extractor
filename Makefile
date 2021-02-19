all:
	@./src/generate.sh
test:
	@INPUT=./res/halloween7_2.mp4 ./src/generate.sh