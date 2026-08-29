
3_injected.ps: 3.ps input.txt
	./inject_data.py -i input.txt -t 3.ps -o 3_injected.ps

.PHONY: run
run: 3_injected.ps
	gs 3_injected.ps
