
7_injected.ps: 7.ps input.txt
	./inject_data.py -i input.txt -t 7.ps -o 7_injected.ps

.PHONY: run
run: 7_injected.ps
	gs 7_injected.ps
