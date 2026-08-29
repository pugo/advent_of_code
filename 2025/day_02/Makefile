
2_injected.ps: 2.ps input.txt
	./inject_data.py -i input.txt -t 2.ps -o 2_injected.ps

.PHONY: run
run: 2_injected.ps
	gs 2_injected.ps
