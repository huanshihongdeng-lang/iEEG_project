#!/bin/csh
# set SRC_FILE_LIST = "/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/traditionalMac_v1.sv \
#                      /home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_v5.sv \
#                       "

# set SRC_FILE_LIST = "/home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC/newMAC.v \
#                      /home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC_v1/newMAC_v1.v \
#                      /home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/traditionalMac/traditionalMac.v \
#                      "

set SRC_FILE_LIST = "/home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC_v5/newMAC_v5.v \
                     /home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/traditionalMac_v1/traditionalMac_v1.v \
                     "


set LIBRARY_FILE  = "/dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/verilog/tcbn65lphvt_200a/tcbn65lphvt.v /dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/verilog/tcbn65lp_200a/tcbn65lp.v"
set VERDI_OPTION  = "-P /softs/synopsys/verdi/T-2022.06-1/share/PLI/VCS/LINUX64/novas.tab /softs/synopsys/verdi/T-2022.06-1/share/PLI/VCS/LINUX64/pli.a"
set TESTBENCH     = /home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_8b_tb.sv
setenv LD_LIBRARY_PATH /softs/synopsys/verdi/T-2022.06-1/share/PLI/VCS/linux64
# -debug_access+pp+fn+nomemcbk
# vcs -j 32 -full64 -R -debug_access+all -debug_region+cell+encrypt +vcd +vcdpluson $VERDI_OPTION +define +DUMPFSDB -kdb -lca -l comp.log +v2k +lint=TFIPC-L -sverilog $LIBRARY_FILE $SRC_FILE_LIST $TESTBENCH  -o simv > vcs.log
# GUI
# vcs  -gui -full64 -R -debug_access+pp -debug_region+cell+encrypt +vcd +vcdpluson $VERDI_OPTION +define +DUMPFSDB -kdb -lca -l comp.log +v2k +lint=TFIPC-L +verilog2001 -sverilog $LIBRARY_FILE $SRC_FILE_LIST $TESTBENCH  -o simv > vcs.log

vcs   -gui -full64 -R -debug_access+pp -debug_region+cell+encrypt +vcs +dumparrays +vcd +vcdpluson $VERDI_OPTION +define +DUMPFSDB -kdb -lca -l comp.log +v2k +lint=TFIPC-L +verilog2001 -sverilog $LIBRARY_FILE $SRC_FILE_LIST $TESTBENCH  -o simv > vcs.log

# ./simv -j 32 -gui
# ./simv +fsdbfile+./dumpFileFolder/dump.fsdb
# verdi -ssf ./dumpFileFolder/dump.fsdb $SRC_FILE_LIST $LIBRARY_FILE $TESTBENCH
