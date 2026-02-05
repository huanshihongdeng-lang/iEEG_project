#this script has been written and prepared by Alexandre Levisse in oct2025 - alexandre.levisse@epfl.ch  
#this script is designed as an example for the labs on EDA for pt_shell. 
#feel free to use it as a basis for your designs in EPFL

#clean the design database
remove_design -all

#set initial variables 
set target_library      {}
set symbol_library      {}

#select svt cells. here we select only one family of cells 
# also we do not specifically select the technology corner that make the most sense - here ss1p08v125c
puts "selecting svt cells"
set db_svt_wc /dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/timing_power_noise/CCS/tcbn65lphvt_200a/tcbn65lphvtwc_ccs.db
lappend target_library  $db_svt_wc
lappend symbol_library dw_foundation.sldb

#define the target library and link library
# set target_library "$target_library IPS/MEMORIES/sramHD_32x32/tt1p2v25c/sramHD_32x32.db IPS/MEMORIES/sramHD_32x64/tt1p2v25c/sramHD_32x64.db"
set target_library "$target_library"
set link_library "* $target_library"

#enable primepower - this will request a ppower license 
set power_enable_analysis true
set power_analysis_mode time_based
set report_default_significant_digits 5

#read the technology db
read_db $target_library


#import the verilog file - to update 
read_verilog /home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC_v5/newMAC_v5.v

#define the top cell
# current_design newMac_v5
current_design newMAC_v5
#link the design 
link_design -verbose 

#here we could source a SDC if we want 
#source SDC/10172023/11h47m27s/postSynthesis_svt_clk_4.5.sdc

#definition of the clock - to match with what one wants to check 
create_clock clk -name clk -period 20.0


#run power analysis - to update 
puts "power analyzis during the multiplication"
#1550
# read_vcd /home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_8b_tb.vcd -strip_path /newMAC_tb/u_traditionalMac -time {60 1520}
read_vcd /home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_8b_tb.vcd -strip_path /newMAC_tb/u_newMAC -time {60 1520}

set RPT_DIR ./newMAC_v5
update_power
report_power
report_power -cell_power -cell -hierarchy -levels 1 -sort_by cell_internal_power > $RPT_DIR/power_hierarchy.rpt
# report_power -cell_power -cell -hierarchy -leaf -sort_by cell_internal_power > $RPT_DIR/power_hierarchy.rpt
# report_power > $RPT_DIR/power_hierarchy.rpt
# report_power -cell_power -cell -hierarchy -leaf   [get_cell u_internalStorage] > $RPT_DIR/internalStorage.rpt
# report_power -net_power   [get_nets -of u_internalStorage/partialAcc_reg[5][4]] > $RPT_DIR/reg_pwr.rpt
# report_power -net_power   [get_nets -of u_internalStorage/clk_gate_partialAcc_reg[5]/latch] > $RPT_DIR/clk_reg_new_pwr.rpt