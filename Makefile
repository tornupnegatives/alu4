SIM=iverilog
SIM_FLAGS=-g2012

BUILD=build

decoder4: rtl/decoder/decoder4.v test/decoder/decoder4_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

decoder8: rtl/decoder/decoder4.v rtl/decoder/decoder8.v \
	test/decoder/decoder8_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

add1: rtl/arithmetic/*.v rtl/logic/*.v test/add1/add1_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

alu1: rtl/arithmetic/*.v rtl/decoder/*.v rtl/logic/*.v rtl/alu1.v \
	test/alu1_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

build:
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
