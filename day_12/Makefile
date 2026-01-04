
12_injected.ps: 12.ps input.txt inject_data.py
	./inject_data.py -i input.txt -t 12.ps -o 12_injected.ps

.PHONY: run
run: 12_injected.ps
	gs 12_injected.ps
