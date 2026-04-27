test:	./build/bin
	./build/bin/llama-cli -hf ggml-org/gemma-3-1b-it-GGUF -p "What is the meaning of life?"

./build/bin:
	mkdir -p build
	cd build && cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-D GGML_NATIVE=OFF \
		-D GGML_CPU_ARM_ARCH=armv8-a \
		-D GGML_CPU=ON \
		-D BUILD_TESTS=OFF
	cd build && cmake --build . 

