#========================
# Project setup
#========================
set DESIGN_NAME       traditionalMac_v1
set RTL_DIR           /home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE
set OUT_DIR           ./traditionalMac_v1
file mkdir $OUT_DIR

set search_path [concat {. /dkits/tsmc/65nm} $search_path]

# RTL files
set RTL_FILES [list \
  $RTL_DIR/newMAC.sv \
  $RTL_DIR/newMAC_v5.sv \
  $RTL_DIR/traditionalMac_v1.sv \
]

#========================
# Libraries (换成你们真实的 .db)
#========================
set target_library [list \
  /dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/timing_power_noise/CCS/tcbn65lphvt_200a/tcbn65lphvtwc_ccs.db \
]

set SYNTH_LIB "dw_foundation.sldb dft_jtag.sldb  dft_lbist.sldb  dft_mbist.sldb  standard.sldb"
set link_library "* $target_library $SYNTH_LIB"

# 如果有 IO 库 / RAM / DW，请加到 link_library
# set link_library [concat "* $target_library /path/to/io.db /path/to/ram.db"]

#========================
# Search path
#========================
set_app_var search_path [list . $RTL_DIR]

#========================
# SV parsing
#========================
# set_app_var hdlin_sv_enable 1
set_app_var verilogout_show_unconnected_pins true

#========================
# Multi-core (可选)
#========================
set_host_options -max_cores 16
