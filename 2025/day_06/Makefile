
6_injected.ps: 6.ps input.txt
	./inject_data.py -i input.txt -t 6.ps -o 6_injected.ps

.PHONY: run
run: 6_injected.ps
	gs 6_injected.ps
