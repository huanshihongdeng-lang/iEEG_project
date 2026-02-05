source dc_setup.tcl

#========================
# Read & elaborate
#========================
analyze -format sverilog $RTL_FILES
elaborate $DESIGN_NAME
current_design $DESIGN_NAME

# 基本检查
check_design > $OUT_DIR/check_design.rpt

#========================
# Constraints
#========================
source dc_constraints.tcl

#========================
# Low power / clock gating (按需启用)
#========================
# 如果你的 RTL 有 enable/acc/data_valid 之类的时钟使能机会，可以让 DC 做 clock gating 插入
set_clock_gating_style \
  -positive_edge_logic integrated \
  -control_point before \
  -minimum_bitwidth 4 \
  -max_fanout 32

# 允许 DC 做门控
# insert_clock_gating -global
# 如果你们有专用 ICG cell，最好显式指定（换成你库里的名字）
# set_clock_gating_style -integrated_clock_gating true -clock_gating_cell <ICG_CELL_NAME>

#========================
# Compile
#========================
# 常用：compile_ultra（时序/面积更好）
compile_ultra -gate_clock -no_autoungroup
# compile_ultra -no_autoungroup

#========================
# Reports
#========================
report_qor            > $OUT_DIR/qor.rpt
report_timing -max_paths 20 -delay_type max > $OUT_DIR/timing_max.rpt
report_timing -max_paths 20 -delay_type min > $OUT_DIR/timing_min.rpt
report_area           > $OUT_DIR/area.rpt
report_power -hierarchy > $OUT_DIR/power_hier.rpt
report_clock_gating   > $OUT_DIR/clock_gating.rpt

#========================
# Write outputs
#========================
# 网表
write -format verilog -hierarchy -output $OUT_DIR/${DESIGN_NAME}.v

# SDC（给后端/STA）
write_sdc $OUT_DIR/${DESIGN_NAME}.sdc

# SDF（门级仿真/PrimePower time-based 可用）
write_sdf -version 2.1 -context verilog $OUT_DIR/${DESIGN_NAME}.sdf

# DDC（后续 DC/PrimeTime 继续用）
write -format ddc -hierarchy -output $OUT_DIR/${DESIGN_NAME}.ddc

# quit
