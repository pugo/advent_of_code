
8_injected.ps: 8.ps input.txt
	./inject_data.py -i input.txt -t 8.ps -o 8_injected.ps

.PHONY: run
run: 8_injected.ps
	gs 8_injected.ps
