
11_injected.ps: 11.ps input.txt inject_data.py
	./inject_data.py -i input.txt -t 11.ps -o 11_injected.ps

.PHONY: run
run: 11_injected.ps
	gs 11_injected.ps
