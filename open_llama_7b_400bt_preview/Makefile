all:

chat-with-bob: 
	../main -m open_llama_7b_400bt_preview/ggml-model-q4_0.bin -n 256 --repeat_penalty 1.0 --color -i -r "User:" -f prompts/chat-with-bob.txt

test:	build prepare
	../main -m open_llama_7b_400bt_preview/ggml-model-q4_0.bin -p "Building a website can be done in 10 simple steps"  -n 512

build:
	make -C .. -j
	python3 -m pip install -r ../requirements.txt

prepare: open_llama_7b_400bt_preview
	python3 ../convert.py open_llama_7b_400bt_preview
	../quantize open_llama_7b_400bt_preview/ggml-model-f16.bin open_llama_7b_400bt_preview/ggml-model-q4_0.bin q4_0

git-lfs:
	brew update
	brew install git-lfs
	git lfs install

# https://huggingface.co/docs/hub/models-downloading#using-git
open_llama_7b_400bt_preview:
	git clone https://huggingface.co/openlm-research/open_llama_7b_400bt_preview
	rm -rf open_llama_7b_400bt_preview/.git

clean:
	rm -rf open_llama_3b_350bt_preview open_llama_7b_400bt_preview
