SIM=iverilog
SIM_FLAGS=-g2012

BUILD=build

add1: rtl/arithmetic/*.v rtl/logic/*.v rtl/mux/*.v test/arithmetic/add1_tb.sv \
     build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

arithmetic_unit: rtl/arithmetic/*.v rtl/logic/*.v rtl/mux/*.v \
	test/arithmetic/arithmetic_unit_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

alu1: rtl/arithmetic/*.v rtl/logic/*.v rtl/mux/*.v rtl/alu1.v \
	test/alu1_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

alu4: rtl/arithmetic/*.v rtl/logic/*.v rtl/mux/*.v rtl/alu1.v \
	rtl/alu4.v test/alu4_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test


build:
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
