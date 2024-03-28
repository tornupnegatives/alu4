SIM=iverilog
SIM_FLAGS=-g2012

test_alu: rtl/*.sv test/*.sv 
	$(SIM) $(SIM_FLAGS) -o $@ $^

