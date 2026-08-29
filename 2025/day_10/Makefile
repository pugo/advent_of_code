
10_injected.ps: 10.ps input.txt inject_data.py
	./inject_data.py -i input.txt -t 10.ps -o 10_injected.ps

.PHONY: run
run: 10_injected.ps
	gs 10_injected.ps
