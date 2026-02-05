Removing design 'newMAC'...
selecting svt cells
Information: Switched to Time_based power analysis mode.
             Activity data, power analysis options and results are reset.
             Please provide activity data for analysis in the current mode.
Loading db file '/dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/timing_power_noise/CCS/tcbn65lphvt_200a/tcbn65lphvtwc_ccs.db'
Warning: Library file '/dkits/tsmc/65nm/IP_65nm/LP/STDCELL_IO/designPackage/stclib/9-track/Front_End/timing_power_noise/CCS/tcbn65lphvt_200a/tcbn65lphvtwc_ccs.db' is already registered. (DBR-021)
Error: Problem in read_db: No designs were read. (DBR-011)
Information: current_design won't return any data before link (DES-071)
Loading verilog file '/home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC/newMAC.v'
Linking design newMAC...

Designs used to link newMAC:
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_0... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_1... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_2... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_3... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_4... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_5... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_6... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_7... (LNK-044)
Information: Design: SNPS_CLOCK_GATE_HIGH_newMAC_8... (LNK-044)
Information: Design: indexGen... (LNK-044)


Libraries used to link newMAC:
  tcbn65lphvtwc_ccs

Information: Removing 10 unneeded designs..... (LNK-034)
Information: 778 (95.34%) library cells are unused in library tcbn65lphvtwc_ccs..... (LNK-045)
Information: total 778 library cells are unused (LNK-046)
Design 'newMAC' was successfully linked.
Information: There are 679 leaf cells, ports, hiers and 729 nets in the design (LNK-047)
power analyzis during the multiplication

======================================================================
Summary:
Total number of nets = 676
Number of annotated nets = 676 (100.00%)
Total number of leaf cells = 627
Number of fully annotated leaf cells = 627 (100.00%)
======================================================================

Information: Using automatic max wire load selection group 'WireAreaForZero'. (ENV-003)
Information: Using automatic min wire load selection group 'WireAreaForZero'. (ENV-003)
Warning: Some timing arcs have been disabled for breaking timing loops or because of constant propagation. Use the 'report_disable_timing' command to get the list of these disabled timing arcs. (PTE-003)
Information: Building multi voltage information for entire design. (MV-022)
Information: Running time_based power analysis... (PWR-601)
Information: Reading vcd file '/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_tb.vcd'
Information: The waveform options are:
		File name:	primetime_px.fsdb
		File format:	fsdb
		Time interval:	0.01ns
		Hierarchical level:	all

Information: Power analysis is running, please wait ...

Information: analysis is done for time window (0ns - 1760ns)

Information: Total simulation time = 1760.000000 ns
****************************************
Report : Time Based Power
Design : newMAC
Version: U-2022.12-SP1
Date   : Thu Jan  8 11:25:12 2026
****************************************



  Attributes
  ----------
      i  -  Including register clock pin internal power
      u  -  User defined power group

                        Internal  Switching  Leakage    Total
Power Group             Power     Power      Power      Power   (     %)  Attrs
--------------------------------------------------------------------------------
clock_network           7.986e-06 4.733e-07 2.386e-09 8.462e-06 (15.77%)  i
register                1.941e-05 2.457e-07 4.671e-08 1.970e-05 (36.70%)  
combinational           1.586e-05 9.606e-06 4.622e-08 2.551e-05 (47.53%)  
sequential                 0.0000    0.0000    0.0000    0.0000 ( 0.00%)  
memory                     0.0000    0.0000    0.0000    0.0000 ( 0.00%)  
io_pad                     0.0000    0.0000    0.0000    0.0000 ( 0.00%)  
black_box                  0.0000    0.0000    0.0000    0.0000 ( 0.00%)  

  Net Switching Power  = 1.032e-05   (19.24%)
  Cell Internal Power  = 4.325e-05   (80.58%)
  Cell Leakage Power   = 9.532e-08   ( 0.18%)
                         ---------
Total Power            = 5.367e-05  (100.00%)

X Transition Power     =    0.0000
Glitching Power        = 5.800e-07

Peak Power             = 1.940e-03
Peak Time              =    780.00

