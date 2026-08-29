
4_injected.ps: 4.ps input.txt
	./inject_data.py -i input.txt -t 4.ps -o 4_injected.ps

.PHONY: run
run: 4_injected.ps
	gs 4_injected.ps
