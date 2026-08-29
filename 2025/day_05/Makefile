
5_injected.ps: 5.ps input.txt
	./inject_data.py -i input.txt -t 5.ps -o 5_injected.ps

.PHONY: run
run: 5_injected.ps
	gs 5_injected.ps
