SIM=iverilog
SIM_FLAGS=-g2012

BUILD=build

decoder4: rtl/decoder4.sv test/decoder4_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

decoder8: rtl/decoder4.sv rtl/decoder8.sv test/decoder8_tb.sv build
	$(SIM) $(SIM_FLAGS) -o $(BUILD)/$@_test $^
	./$(BUILD)/$@_test

build:
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)
