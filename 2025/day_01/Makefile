
1_injected.ps: 1.ps input.txt
	./inject_data.py -i input.txt -t 1.ps -o 1_injected.ps

.PHONY: run
run: 1_injected.ps
	gs 1_injected.ps
