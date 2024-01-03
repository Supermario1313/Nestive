.PHONY: all clean cmake compile test

all: compile_commands.json out/nestive

out/nestive: compile
	mkdir -p out
	cp build/out/nestive out

test: compile
	ctest --test-dir build --output-on-failure

compile: cmake
	cmake --build build

compile_commands.json: cmake
	cp build/compile_commands.json .

cmake:
	mkdir -p build
	cd build && cmake .. -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=1

clean:
	rm -rf build
	rm -f compile_commands.json
	rm -rf out
