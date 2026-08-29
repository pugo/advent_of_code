
9_injected.ps: 9.ps input.txt
	./inject_data.py -i input.txt -t 9.ps -o 9_injected.ps

.PHONY: run
run: 9_injected.ps
	gs 9_injected.ps
