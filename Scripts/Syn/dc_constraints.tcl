#========================
# Clocks
#========================
create_clock -name clk -period 25.0 [get_ports clk]
set_clock_uncertainty 0.2 [get_clocks clk]
set_clock_transition  0.1 [get_clocks clk]

#========================
# Resets: 不做时序约束
#========================
set_false_path -from [get_ports rst_n]
set_false_path -from [get_ports reset]

#========================
# IO delays (示例)
#========================
# 假设外部器件在时钟边沿后 2ns 给稳定输入
set_input_delay  2.0 -clock clk [remove_from_collection [all_inputs] [get_ports {clk rst_n}]]
# 假设输出需要在边沿后 2ns 送出去
set_output_delay 2.0 -clock clk [all_outputs]

#========================
# Drive/Load
#========================
# set_driving_cell -lib_cell BUFX2 -pin Y [all_inputs]
set_load 0.02 [all_outputs]

#========================
# Operating condition / wireload
#========================
# set_operating_conditions
# set_operating_conditions -analysis_type on_chip_variation <OC_NAME>

# wireload；若你们还用：
# set_wire_load_mode top
