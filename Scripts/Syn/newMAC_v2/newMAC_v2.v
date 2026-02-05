/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jan 16 19:12:24 2026
/////////////////////////////////////////////////////////////


module indexGen ( data_valid, weight, activation, index, zero );
  input [3:0] weight;
  input [7:0] activation;
  output [2:0] index;
  input data_valid;
  output zero;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  INVD0HVT U3 ( .I(weight[3]), .ZN(n6) );
  NR4D0HVT U4 ( .A1(activation[3]), .A2(activation[2]), .A3(activation[1]), 
        .A4(activation[0]), .ZN(n3) );
  NR4D0HVT U5 ( .A1(activation[7]), .A2(activation[6]), .A3(activation[5]), 
        .A4(activation[4]), .ZN(n2) );
  NR4D0HVT U6 ( .A1(weight[0]), .A2(weight[1]), .A3(weight[3]), .A4(weight[2]), 
        .ZN(n1) );
  AO32D0HVT U7 ( .A1(n3), .A2(data_valid), .A3(n2), .B1(n1), .B2(data_valid), 
        .Z(zero) );
  OAI21D0HVT U8 ( .A1(weight[0]), .A2(weight[1]), .B(n6), .ZN(n5) );
  NR2D0HVT U9 ( .A1(weight[2]), .A2(n5), .ZN(n4) );
  AOI211D0HVT U10 ( .A1(weight[2]), .A2(n5), .B(zero), .C(n4), .ZN(index[2])
         );
  CKND2D0HVT U11 ( .A1(weight[0]), .A2(n6), .ZN(n8) );
  NR2D0HVT U12 ( .A1(weight[1]), .A2(n8), .ZN(n7) );
  AOI211D0HVT U13 ( .A1(weight[1]), .A2(n8), .B(zero), .C(n7), .ZN(index[1])
         );
  NR2D0HVT U14 ( .A1(weight[0]), .A2(zero), .ZN(index[0]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module internalStorage ( clk, rst_n, en, reset, wen, addr_A, data_A, ren, 
        addr_B, data_B );
  input [2:0] addr_A;
  input [9:0] data_A;
  input [2:0] addr_B;
  output [9:0] data_B;
  input clk, rst_n, en, reset, wen, ren;
  wire   \*Logic0* , \partialAcc[7][9] , \partialAcc[7][8] ,
         \partialAcc[7][7] , \partialAcc[7][6] , \partialAcc[7][5] ,
         \partialAcc[7][4] , \partialAcc[7][3] , \partialAcc[7][2] ,
         \partialAcc[7][1] , \partialAcc[7][0] , \partialAcc[6][9] ,
         \partialAcc[6][8] , \partialAcc[6][7] , \partialAcc[6][6] ,
         \partialAcc[6][5] , \partialAcc[6][4] , \partialAcc[6][3] ,
         \partialAcc[6][2] , \partialAcc[6][1] , \partialAcc[6][0] ,
         \partialAcc[5][9] , \partialAcc[5][8] , \partialAcc[5][7] ,
         \partialAcc[5][6] , \partialAcc[5][5] , \partialAcc[5][4] ,
         \partialAcc[5][3] , \partialAcc[5][2] , \partialAcc[5][1] ,
         \partialAcc[5][0] , \partialAcc[4][9] , \partialAcc[4][8] ,
         \partialAcc[4][7] , \partialAcc[4][6] , \partialAcc[4][5] ,
         \partialAcc[4][4] , \partialAcc[4][3] , \partialAcc[4][2] ,
         \partialAcc[4][1] , \partialAcc[4][0] , \partialAcc[3][9] ,
         \partialAcc[3][8] , \partialAcc[3][7] , \partialAcc[3][6] ,
         \partialAcc[3][5] , \partialAcc[3][4] , \partialAcc[3][3] ,
         \partialAcc[3][2] , \partialAcc[3][1] , \partialAcc[3][0] ,
         \partialAcc[2][9] , \partialAcc[2][8] , \partialAcc[2][7] ,
         \partialAcc[2][6] , \partialAcc[2][5] , \partialAcc[2][4] ,
         \partialAcc[2][3] , \partialAcc[2][2] , \partialAcc[2][1] ,
         \partialAcc[2][0] , \partialAcc[1][9] , \partialAcc[1][8] ,
         \partialAcc[1][7] , \partialAcc[1][6] , \partialAcc[1][5] ,
         \partialAcc[1][4] , \partialAcc[1][3] , \partialAcc[1][2] ,
         \partialAcc[1][1] , \partialAcc[1][0] , \partialAcc[0][9] ,
         \partialAcc[0][8] , \partialAcc[0][7] , \partialAcc[0][6] ,
         \partialAcc[0][5] , \partialAcc[0][4] , \partialAcc[0][3] ,
         \partialAcc[0][2] , \partialAcc[0][1] , \partialAcc[0][0] , N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N46, N47, N48, N49, N50, N51,
         N52, N53, net149, net157, net163, net169, net175, net181, net187,
         net193, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63;

  SNPS_CLOCK_GATE_HIGH_newMAC_v2_7 \clk_gate_partialAcc_reg[7]  ( .CLK(clk), 
        .EN(N53), .ENCLK(net149), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_6 \clk_gate_partialAcc_reg[6]  ( .CLK(clk), 
        .EN(N52), .ENCLK(net157), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_5 \clk_gate_partialAcc_reg[5]  ( .CLK(clk), 
        .EN(N51), .ENCLK(net163), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_4 \clk_gate_partialAcc_reg[4]  ( .CLK(clk), 
        .EN(N50), .ENCLK(net169), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_3 \clk_gate_partialAcc_reg[3]  ( .CLK(clk), 
        .EN(N49), .ENCLK(net175), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_2 \clk_gate_partialAcc_reg[2]  ( .CLK(clk), 
        .EN(N48), .ENCLK(net181), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_1 \clk_gate_partialAcc_reg[1]  ( .CLK(clk), 
        .EN(N47), .ENCLK(net187), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_0 \clk_gate_partialAcc_reg[0]  ( .CLK(clk), 
        .EN(N46), .ENCLK(net193), .TE(\*Logic0* ) );
  DFCNQD1HVT \partialAcc_reg[7][9]  ( .D(N38), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][9] ) );
  DFCNQD1HVT \partialAcc_reg[7][8]  ( .D(N37), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][8] ) );
  DFCNQD1HVT \partialAcc_reg[7][7]  ( .D(N36), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][7] ) );
  DFCNQD1HVT \partialAcc_reg[7][6]  ( .D(N35), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][6] ) );
  DFCNQD1HVT \partialAcc_reg[7][5]  ( .D(N34), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][5] ) );
  DFCNQD1HVT \partialAcc_reg[7][4]  ( .D(N33), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][4] ) );
  DFCNQD1HVT \partialAcc_reg[7][3]  ( .D(N32), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][3] ) );
  DFCNQD1HVT \partialAcc_reg[7][2]  ( .D(N31), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][2] ) );
  DFCNQD1HVT \partialAcc_reg[7][1]  ( .D(N30), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][1] ) );
  DFCNQD1HVT \partialAcc_reg[7][0]  ( .D(N29), .CP(net149), .CDN(rst_n), .Q(
        \partialAcc[7][0] ) );
  DFCNQD1HVT \partialAcc_reg[6][9]  ( .D(N38), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][9] ) );
  DFCNQD1HVT \partialAcc_reg[6][8]  ( .D(N37), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][8] ) );
  DFCNQD1HVT \partialAcc_reg[6][7]  ( .D(N36), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][7] ) );
  DFCNQD1HVT \partialAcc_reg[6][6]  ( .D(N35), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][6] ) );
  DFCNQD1HVT \partialAcc_reg[6][5]  ( .D(N34), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][5] ) );
  DFCNQD1HVT \partialAcc_reg[6][4]  ( .D(N33), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][4] ) );
  DFCNQD1HVT \partialAcc_reg[6][3]  ( .D(N32), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][3] ) );
  DFCNQD1HVT \partialAcc_reg[6][2]  ( .D(N31), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][2] ) );
  DFCNQD1HVT \partialAcc_reg[6][1]  ( .D(N30), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][1] ) );
  DFCNQD1HVT \partialAcc_reg[6][0]  ( .D(N29), .CP(net157), .CDN(rst_n), .Q(
        \partialAcc[6][0] ) );
  DFCNQD1HVT \partialAcc_reg[5][9]  ( .D(N38), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][9] ) );
  DFCNQD1HVT \partialAcc_reg[5][8]  ( .D(N37), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][8] ) );
  DFCNQD1HVT \partialAcc_reg[5][7]  ( .D(N36), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][7] ) );
  DFCNQD1HVT \partialAcc_reg[5][6]  ( .D(N35), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][6] ) );
  DFCNQD1HVT \partialAcc_reg[5][5]  ( .D(N34), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][5] ) );
  DFCNQD1HVT \partialAcc_reg[5][4]  ( .D(N33), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][4] ) );
  DFCNQD1HVT \partialAcc_reg[5][3]  ( .D(N32), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][3] ) );
  DFCNQD1HVT \partialAcc_reg[5][2]  ( .D(N31), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][2] ) );
  DFCNQD1HVT \partialAcc_reg[5][1]  ( .D(N30), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][1] ) );
  DFCNQD1HVT \partialAcc_reg[5][0]  ( .D(N29), .CP(net163), .CDN(rst_n), .Q(
        \partialAcc[5][0] ) );
  DFCNQD1HVT \partialAcc_reg[4][9]  ( .D(N38), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][9] ) );
  DFCNQD1HVT \partialAcc_reg[4][8]  ( .D(N37), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][8] ) );
  DFCNQD1HVT \partialAcc_reg[4][7]  ( .D(N36), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][7] ) );
  DFCNQD1HVT \partialAcc_reg[4][6]  ( .D(N35), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][6] ) );
  DFCNQD1HVT \partialAcc_reg[4][5]  ( .D(N34), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][5] ) );
  DFCNQD1HVT \partialAcc_reg[4][4]  ( .D(N33), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][4] ) );
  DFCNQD1HVT \partialAcc_reg[4][3]  ( .D(N32), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][3] ) );
  DFCNQD1HVT \partialAcc_reg[4][2]  ( .D(N31), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][2] ) );
  DFCNQD1HVT \partialAcc_reg[4][1]  ( .D(N30), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][1] ) );
  DFCNQD1HVT \partialAcc_reg[4][0]  ( .D(N29), .CP(net169), .CDN(rst_n), .Q(
        \partialAcc[4][0] ) );
  DFCNQD1HVT \partialAcc_reg[3][9]  ( .D(N38), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][9] ) );
  DFCNQD1HVT \partialAcc_reg[3][8]  ( .D(N37), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][8] ) );
  DFCNQD1HVT \partialAcc_reg[3][7]  ( .D(N36), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][7] ) );
  DFCNQD1HVT \partialAcc_reg[3][6]  ( .D(N35), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][6] ) );
  DFCNQD1HVT \partialAcc_reg[3][5]  ( .D(N34), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][5] ) );
  DFCNQD1HVT \partialAcc_reg[3][4]  ( .D(N33), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][4] ) );
  DFCNQD1HVT \partialAcc_reg[3][3]  ( .D(N32), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][3] ) );
  DFCNQD1HVT \partialAcc_reg[3][2]  ( .D(N31), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][2] ) );
  DFCNQD1HVT \partialAcc_reg[3][1]  ( .D(N30), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][1] ) );
  DFCNQD1HVT \partialAcc_reg[3][0]  ( .D(N29), .CP(net175), .CDN(rst_n), .Q(
        \partialAcc[3][0] ) );
  DFCNQD1HVT \partialAcc_reg[2][9]  ( .D(N38), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][9] ) );
  DFCNQD1HVT \partialAcc_reg[2][8]  ( .D(N37), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][8] ) );
  DFCNQD1HVT \partialAcc_reg[2][7]  ( .D(N36), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][7] ) );
  DFCNQD1HVT \partialAcc_reg[2][6]  ( .D(N35), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][6] ) );
  DFCNQD1HVT \partialAcc_reg[2][5]  ( .D(N34), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][5] ) );
  DFCNQD1HVT \partialAcc_reg[2][4]  ( .D(N33), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][4] ) );
  DFCNQD1HVT \partialAcc_reg[2][3]  ( .D(N32), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][3] ) );
  DFCNQD1HVT \partialAcc_reg[2][2]  ( .D(N31), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][2] ) );
  DFCNQD1HVT \partialAcc_reg[2][1]  ( .D(N30), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][1] ) );
  DFCNQD1HVT \partialAcc_reg[2][0]  ( .D(N29), .CP(net181), .CDN(rst_n), .Q(
        \partialAcc[2][0] ) );
  DFCNQD1HVT \partialAcc_reg[1][9]  ( .D(N38), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][9] ) );
  DFCNQD1HVT \partialAcc_reg[1][8]  ( .D(N37), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][8] ) );
  DFCNQD1HVT \partialAcc_reg[1][7]  ( .D(N36), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][7] ) );
  DFCNQD1HVT \partialAcc_reg[1][6]  ( .D(N35), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][6] ) );
  DFCNQD1HVT \partialAcc_reg[1][5]  ( .D(N34), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][5] ) );
  DFCNQD1HVT \partialAcc_reg[1][4]  ( .D(N33), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][4] ) );
  DFCNQD1HVT \partialAcc_reg[1][3]  ( .D(N32), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][3] ) );
  DFCNQD1HVT \partialAcc_reg[1][2]  ( .D(N31), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][2] ) );
  DFCNQD1HVT \partialAcc_reg[1][1]  ( .D(N30), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][1] ) );
  DFCNQD1HVT \partialAcc_reg[1][0]  ( .D(N29), .CP(net187), .CDN(rst_n), .Q(
        \partialAcc[1][0] ) );
  DFCNQD1HVT \partialAcc_reg[0][9]  ( .D(N38), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][9] ) );
  DFCNQD1HVT \partialAcc_reg[0][8]  ( .D(N37), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][8] ) );
  DFCNQD1HVT \partialAcc_reg[0][7]  ( .D(N36), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][7] ) );
  DFCNQD1HVT \partialAcc_reg[0][6]  ( .D(N35), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][6] ) );
  DFCNQD1HVT \partialAcc_reg[0][5]  ( .D(N34), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][5] ) );
  DFCNQD1HVT \partialAcc_reg[0][4]  ( .D(N33), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][4] ) );
  DFCNQD1HVT \partialAcc_reg[0][3]  ( .D(N32), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][3] ) );
  DFCNQD1HVT \partialAcc_reg[0][2]  ( .D(N31), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][2] ) );
  DFCNQD1HVT \partialAcc_reg[0][1]  ( .D(N30), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][1] ) );
  DFCNQD1HVT \partialAcc_reg[0][0]  ( .D(N29), .CP(net193), .CDN(rst_n), .Q(
        \partialAcc[0][0] ) );
  AOI22D0HVT U3 ( .A1(n59), .A2(\partialAcc[0][1] ), .B1(n58), .B2(
        \partialAcc[2][1] ), .ZN(n13) );
  AOI22D0HVT U4 ( .A1(n54), .A2(\partialAcc[1][4] ), .B1(n53), .B2(
        \partialAcc[3][4] ), .ZN(n29) );
  INVD0HVT U5 ( .I(addr_B[0]), .ZN(n6) );
  AOI22D0HVT U6 ( .A1(n59), .A2(\partialAcc[0][0] ), .B1(n58), .B2(
        \partialAcc[2][0] ), .ZN(n8) );
  AOI22D0HVT U7 ( .A1(n54), .A2(\partialAcc[5][5] ), .B1(n53), .B2(
        \partialAcc[7][5] ), .ZN(n37) );
  AOI22D0HVT U8 ( .A1(n59), .A2(\partialAcc[4][8] ), .B1(n58), .B2(
        \partialAcc[6][8] ), .ZN(n50) );
  CKAN2D0HVT U9 ( .A1(data_A[2]), .A2(wen), .Z(N31) );
  TIELHVT U10 ( .ZN(\*Logic0* ) );
  CKAN2D0HVT U11 ( .A1(data_A[0]), .A2(wen), .Z(N29) );
  CKAN2D0HVT U12 ( .A1(data_A[1]), .A2(wen), .Z(N30) );
  CKAN2D0HVT U13 ( .A1(data_A[3]), .A2(wen), .Z(N32) );
  CKAN2D0HVT U14 ( .A1(data_A[4]), .A2(wen), .Z(N33) );
  CKAN2D0HVT U15 ( .A1(data_A[5]), .A2(wen), .Z(N34) );
  CKAN2D0HVT U16 ( .A1(data_A[6]), .A2(wen), .Z(N35) );
  CKAN2D0HVT U17 ( .A1(data_A[7]), .A2(wen), .Z(N36) );
  CKAN2D0HVT U18 ( .A1(data_A[8]), .A2(wen), .Z(N37) );
  CKAN2D0HVT U19 ( .A1(data_A[9]), .A2(wen), .Z(N38) );
  IND3D0HVT U20 ( .A1(addr_A[0]), .B1(en), .B2(wen), .ZN(n5) );
  INVD0HVT U21 ( .I(addr_A[2]), .ZN(n1) );
  INVD0HVT U22 ( .I(addr_A[1]), .ZN(n2) );
  IND3D0HVT U23 ( .A1(wen), .B1(en), .B2(reset), .ZN(n4) );
  OAI31D0HVT U24 ( .A1(n5), .A2(n1), .A3(n2), .B(n4), .ZN(N52) );
  OAI31D0HVT U25 ( .A1(addr_A[1]), .A2(n5), .A3(n1), .B(n4), .ZN(N50) );
  OAI31D0HVT U26 ( .A1(addr_A[2]), .A2(n5), .A3(n2), .B(n4), .ZN(N48) );
  ND3D0HVT U27 ( .A1(wen), .A2(en), .A3(addr_A[0]), .ZN(n3) );
  OAI31D0HVT U28 ( .A1(addr_A[1]), .A2(n1), .A3(n3), .B(n4), .ZN(N51) );
  OAI31D0HVT U29 ( .A1(n1), .A2(n2), .A3(n3), .B(n4), .ZN(N53) );
  OAI31D0HVT U30 ( .A1(addr_A[2]), .A2(n2), .A3(n3), .B(n4), .ZN(N49) );
  OAI31D0HVT U31 ( .A1(addr_A[2]), .A2(addr_A[1]), .A3(n3), .B(n4), .ZN(N47)
         );
  OAI31D0HVT U32 ( .A1(addr_A[2]), .A2(addr_A[1]), .A3(n5), .B(n4), .ZN(N46)
         );
  NR2XD0HVT U33 ( .A1(addr_B[1]), .A2(n6), .ZN(n54) );
  INVD0HVT U34 ( .I(addr_B[1]), .ZN(n7) );
  NR2XD0HVT U35 ( .A1(n7), .A2(n6), .ZN(n53) );
  AOI22D0HVT U36 ( .A1(n54), .A2(\partialAcc[5][0] ), .B1(n53), .B2(
        \partialAcc[7][0] ), .ZN(n12) );
  AOI22D0HVT U37 ( .A1(n54), .A2(\partialAcc[1][0] ), .B1(n53), .B2(
        \partialAcc[3][0] ), .ZN(n9) );
  NR2XD0HVT U38 ( .A1(addr_B[1]), .A2(addr_B[0]), .ZN(n59) );
  NR2XD0HVT U39 ( .A1(addr_B[0]), .A2(n7), .ZN(n58) );
  IND2D0HVT U40 ( .A1(addr_B[2]), .B1(ren), .ZN(n55) );
  AO21D0HVT U41 ( .A1(n9), .A2(n8), .B(n55), .Z(n11) );
  AOI22D0HVT U42 ( .A1(n59), .A2(\partialAcc[4][0] ), .B1(n58), .B2(
        \partialAcc[6][0] ), .ZN(n10) );
  CKND2D0HVT U43 ( .A1(ren), .A2(addr_B[2]), .ZN(n60) );
  AOI32D0HVT U44 ( .A1(n12), .A2(n11), .A3(n10), .B1(n60), .B2(n11), .ZN(
        data_B[0]) );
  AOI22D0HVT U45 ( .A1(n54), .A2(\partialAcc[5][1] ), .B1(n53), .B2(
        \partialAcc[7][1] ), .ZN(n17) );
  AOI22D0HVT U46 ( .A1(n54), .A2(\partialAcc[1][1] ), .B1(n53), .B2(
        \partialAcc[3][1] ), .ZN(n14) );
  AO21D0HVT U47 ( .A1(n14), .A2(n13), .B(n55), .Z(n16) );
  AOI22D0HVT U48 ( .A1(n59), .A2(\partialAcc[4][1] ), .B1(n58), .B2(
        \partialAcc[6][1] ), .ZN(n15) );
  AOI32D0HVT U49 ( .A1(n17), .A2(n16), .A3(n15), .B1(n60), .B2(n16), .ZN(
        data_B[1]) );
  AOI22D0HVT U50 ( .A1(n54), .A2(\partialAcc[5][2] ), .B1(n53), .B2(
        \partialAcc[7][2] ), .ZN(n22) );
  AOI22D0HVT U51 ( .A1(n54), .A2(\partialAcc[1][2] ), .B1(n53), .B2(
        \partialAcc[3][2] ), .ZN(n19) );
  AOI22D0HVT U52 ( .A1(n59), .A2(\partialAcc[0][2] ), .B1(n58), .B2(
        \partialAcc[2][2] ), .ZN(n18) );
  AO21D0HVT U53 ( .A1(n19), .A2(n18), .B(n55), .Z(n21) );
  AOI22D0HVT U54 ( .A1(n59), .A2(\partialAcc[4][2] ), .B1(n58), .B2(
        \partialAcc[6][2] ), .ZN(n20) );
  AOI32D0HVT U55 ( .A1(n22), .A2(n21), .A3(n20), .B1(n60), .B2(n21), .ZN(
        data_B[2]) );
  AOI22D0HVT U56 ( .A1(n54), .A2(\partialAcc[5][3] ), .B1(n53), .B2(
        \partialAcc[7][3] ), .ZN(n27) );
  AOI22D0HVT U57 ( .A1(n54), .A2(\partialAcc[1][3] ), .B1(n53), .B2(
        \partialAcc[3][3] ), .ZN(n24) );
  AOI22D0HVT U58 ( .A1(n59), .A2(\partialAcc[0][3] ), .B1(n58), .B2(
        \partialAcc[2][3] ), .ZN(n23) );
  AO21D0HVT U59 ( .A1(n24), .A2(n23), .B(n55), .Z(n26) );
  AOI22D0HVT U60 ( .A1(n59), .A2(\partialAcc[4][3] ), .B1(n58), .B2(
        \partialAcc[6][3] ), .ZN(n25) );
  AOI32D0HVT U61 ( .A1(n27), .A2(n26), .A3(n25), .B1(n60), .B2(n26), .ZN(
        data_B[3]) );
  AOI22D0HVT U62 ( .A1(n54), .A2(\partialAcc[5][4] ), .B1(n53), .B2(
        \partialAcc[7][4] ), .ZN(n32) );
  AOI22D0HVT U63 ( .A1(n59), .A2(\partialAcc[0][4] ), .B1(n58), .B2(
        \partialAcc[2][4] ), .ZN(n28) );
  AO21D0HVT U64 ( .A1(n29), .A2(n28), .B(n55), .Z(n31) );
  AOI22D0HVT U65 ( .A1(n59), .A2(\partialAcc[4][4] ), .B1(n58), .B2(
        \partialAcc[6][4] ), .ZN(n30) );
  AOI32D0HVT U66 ( .A1(n32), .A2(n31), .A3(n30), .B1(n60), .B2(n31), .ZN(
        data_B[4]) );
  AOI22D0HVT U67 ( .A1(n54), .A2(\partialAcc[1][5] ), .B1(n53), .B2(
        \partialAcc[3][5] ), .ZN(n34) );
  AOI22D0HVT U68 ( .A1(n59), .A2(\partialAcc[0][5] ), .B1(n58), .B2(
        \partialAcc[2][5] ), .ZN(n33) );
  AO21D0HVT U69 ( .A1(n34), .A2(n33), .B(n55), .Z(n36) );
  AOI22D0HVT U70 ( .A1(n59), .A2(\partialAcc[4][5] ), .B1(n58), .B2(
        \partialAcc[6][5] ), .ZN(n35) );
  AOI32D0HVT U71 ( .A1(n37), .A2(n36), .A3(n35), .B1(n60), .B2(n36), .ZN(
        data_B[5]) );
  AOI22D0HVT U72 ( .A1(n54), .A2(\partialAcc[5][6] ), .B1(n53), .B2(
        \partialAcc[7][6] ), .ZN(n42) );
  AOI22D0HVT U73 ( .A1(n54), .A2(\partialAcc[1][6] ), .B1(n53), .B2(
        \partialAcc[3][6] ), .ZN(n39) );
  AOI22D0HVT U74 ( .A1(n59), .A2(\partialAcc[0][6] ), .B1(n58), .B2(
        \partialAcc[2][6] ), .ZN(n38) );
  AO21D0HVT U75 ( .A1(n39), .A2(n38), .B(n55), .Z(n41) );
  AOI22D0HVT U76 ( .A1(n59), .A2(\partialAcc[4][6] ), .B1(n58), .B2(
        \partialAcc[6][6] ), .ZN(n40) );
  AOI32D0HVT U77 ( .A1(n42), .A2(n41), .A3(n40), .B1(n60), .B2(n41), .ZN(
        data_B[6]) );
  AOI22D0HVT U78 ( .A1(n54), .A2(\partialAcc[5][7] ), .B1(n53), .B2(
        \partialAcc[7][7] ), .ZN(n47) );
  AOI22D0HVT U79 ( .A1(n54), .A2(\partialAcc[1][7] ), .B1(n53), .B2(
        \partialAcc[3][7] ), .ZN(n44) );
  AOI22D0HVT U80 ( .A1(n59), .A2(\partialAcc[0][7] ), .B1(n58), .B2(
        \partialAcc[2][7] ), .ZN(n43) );
  AO21D0HVT U81 ( .A1(n44), .A2(n43), .B(n55), .Z(n46) );
  AOI22D0HVT U82 ( .A1(n59), .A2(\partialAcc[4][7] ), .B1(n58), .B2(
        \partialAcc[6][7] ), .ZN(n45) );
  AOI32D0HVT U83 ( .A1(n47), .A2(n46), .A3(n45), .B1(n60), .B2(n46), .ZN(
        data_B[7]) );
  AOI22D0HVT U84 ( .A1(n54), .A2(\partialAcc[5][8] ), .B1(n53), .B2(
        \partialAcc[7][8] ), .ZN(n52) );
  AOI22D0HVT U85 ( .A1(n54), .A2(\partialAcc[1][8] ), .B1(n53), .B2(
        \partialAcc[3][8] ), .ZN(n49) );
  AOI22D0HVT U86 ( .A1(n59), .A2(\partialAcc[0][8] ), .B1(n58), .B2(
        \partialAcc[2][8] ), .ZN(n48) );
  AO21D0HVT U87 ( .A1(n49), .A2(n48), .B(n55), .Z(n51) );
  AOI32D0HVT U88 ( .A1(n52), .A2(n51), .A3(n50), .B1(n60), .B2(n51), .ZN(
        data_B[8]) );
  AOI22D0HVT U89 ( .A1(n54), .A2(\partialAcc[5][9] ), .B1(n53), .B2(
        \partialAcc[7][9] ), .ZN(n63) );
  AOI22D0HVT U90 ( .A1(n54), .A2(\partialAcc[1][9] ), .B1(n53), .B2(
        \partialAcc[3][9] ), .ZN(n57) );
  AOI22D0HVT U91 ( .A1(n59), .A2(\partialAcc[0][9] ), .B1(n58), .B2(
        \partialAcc[2][9] ), .ZN(n56) );
  AO21D0HVT U92 ( .A1(n57), .A2(n56), .B(n55), .Z(n62) );
  AOI22D0HVT U93 ( .A1(n59), .A2(\partialAcc[4][9] ), .B1(n58), .B2(
        \partialAcc[6][9] ), .ZN(n61) );
  AOI32D0HVT U94 ( .A1(n63), .A2(n62), .A3(n61), .B1(n60), .B2(n62), .ZN(
        data_B[9]) );
endmodule


module ADDER ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [9:0] ADD_OP_A;
  input [9:0] ADD_OP_B;
  output [9:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_1/CI , \intadd_1/SUM[6] , \intadd_1/SUM[5] ,
         \intadd_1/SUM[4] , \intadd_1/SUM[3] , \intadd_1/SUM[2] ,
         \intadd_1/SUM[1] , \intadd_1/SUM[0] , \intadd_1/n7 , \intadd_1/n6 ,
         \intadd_1/n5 , \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 ,
         \intadd_1/n1 , n1, n2, n3, n4, n5, n6, n7, n8, n9;

  FA1D0HVT \intadd_1/U8  ( .A(ADD_OP_B[2]), .B(ADD_OP_A[2]), .CI(\intadd_1/CI ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U7  ( .A(ADD_OP_B[3]), .B(ADD_OP_A[3]), .CI(\intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[1] ) );
  FA1D0HVT \intadd_1/U6  ( .A(ADD_OP_B[4]), .B(ADD_OP_A[4]), .CI(\intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[2] ) );
  FA1D0HVT \intadd_1/U5  ( .A(ADD_OP_B[5]), .B(ADD_OP_A[5]), .CI(\intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[3] ) );
  FA1D0HVT \intadd_1/U4  ( .A(ADD_OP_B[6]), .B(ADD_OP_A[6]), .CI(\intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[4] ) );
  FA1D0HVT \intadd_1/U3  ( .A(ADD_OP_B[7]), .B(ADD_OP_A[7]), .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[5] ) );
  FA1D0HVT \intadd_1/U2  ( .A(ADD_OP_B[8]), .B(ADD_OP_A[8]), .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[6] ) );
  CKND2D0HVT U2 ( .A1(ADD_OP_A[0]), .A2(ADD_OP_B[0]), .ZN(n9) );
  CKAN2D0HVT U3 ( .A1(\intadd_1/SUM[0] ), .A2(ADD_EN), .Z(ADD_RESULT[2]) );
  CKAN2D0HVT U4 ( .A1(\intadd_1/SUM[1] ), .A2(ADD_EN), .Z(ADD_RESULT[3]) );
  CKAN2D0HVT U5 ( .A1(\intadd_1/SUM[2] ), .A2(ADD_EN), .Z(ADD_RESULT[4]) );
  CKAN2D0HVT U6 ( .A1(\intadd_1/SUM[3] ), .A2(ADD_EN), .Z(ADD_RESULT[5]) );
  CKAN2D0HVT U7 ( .A1(\intadd_1/SUM[4] ), .A2(ADD_EN), .Z(ADD_RESULT[6]) );
  CKAN2D0HVT U8 ( .A1(\intadd_1/SUM[5] ), .A2(ADD_EN), .Z(ADD_RESULT[7]) );
  CKAN2D0HVT U9 ( .A1(\intadd_1/SUM[6] ), .A2(ADD_EN), .Z(ADD_RESULT[8]) );
  OA211D0HVT U10 ( .A1(ADD_OP_A[0]), .A2(ADD_OP_B[0]), .B(ADD_EN), .C(n9), .Z(
        ADD_RESULT[0]) );
  INVD0HVT U11 ( .I(ADD_OP_A[1]), .ZN(n7) );
  MUX2ND0HVT U12 ( .I0(ADD_OP_A[1]), .I1(n7), .S(ADD_OP_B[1]), .ZN(n2) );
  INVD0HVT U13 ( .I(ADD_EN), .ZN(n5) );
  NR2D0HVT U14 ( .A1(n9), .A2(n2), .ZN(n1) );
  AOI211D0HVT U15 ( .A1(n9), .A2(n2), .B(n5), .C(n1), .ZN(ADD_RESULT[1]) );
  INVD0HVT U16 ( .I(ADD_OP_B[8]), .ZN(n3) );
  MUX2ND0HVT U17 ( .I0(n3), .I1(ADD_OP_B[8]), .S(\intadd_1/n1 ), .ZN(n6) );
  NR2D0HVT U18 ( .A1(ADD_OP_A[9]), .A2(n6), .ZN(n4) );
  AOI211D0HVT U19 ( .A1(ADD_OP_A[9]), .A2(n6), .B(n5), .C(n4), .ZN(
        ADD_RESULT[9]) );
  INVD0HVT U20 ( .I(ADD_OP_B[1]), .ZN(n8) );
  MAOI222D0HVT U21 ( .A(n9), .B(n8), .C(n7), .ZN(\intadd_1/CI ) );
endmodule


module MULTIPLIER ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [9:0] MUL_OP_A;
  input [3:0] MUL_OP_B;
  output [13:0] MUL_RESULT;
  input MUL_EN;
  wire   \intadd_2/A[9] , \intadd_2/A[8] , \intadd_2/A[7] , \intadd_2/A[6] ,
         \intadd_2/A[5] , \intadd_2/A[4] , \intadd_2/A[3] , \intadd_2/A[2] ,
         \intadd_2/A[1] , \intadd_2/A[0] , \intadd_2/B[9] , \intadd_2/B[8] ,
         \intadd_2/B[7] , \intadd_2/B[6] , \intadd_2/B[5] , \intadd_2/B[4] ,
         \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] ,
         \intadd_2/CI , \intadd_2/SUM[9] , \intadd_2/SUM[8] ,
         \intadd_2/SUM[7] , \intadd_2/SUM[6] , \intadd_2/SUM[5] ,
         \intadd_2/SUM[4] , \intadd_2/SUM[3] , \intadd_2/SUM[2] ,
         \intadd_2/SUM[1] , \intadd_2/SUM[0] , \intadd_2/n10 , \intadd_2/n9 ,
         \intadd_2/n8 , \intadd_2/n7 , \intadd_2/n6 , \intadd_2/n5 ,
         \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67;
  assign MUL_RESULT[13] = \intadd_2/n1 ;

  FA1D0HVT \intadd_2/U11  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n10 ), .S(\intadd_2/SUM[0] ) );
  FA1D0HVT \intadd_2/U10  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(\intadd_2/SUM[1] ) );
  FA1D0HVT \intadd_2/U9  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(\intadd_2/SUM[2] ) );
  FA1D0HVT \intadd_2/U8  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(\intadd_2/SUM[3] ) );
  FA1D0HVT \intadd_2/U7  ( .A(\intadd_2/A[4] ), .B(\intadd_2/B[4] ), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(\intadd_2/SUM[4] ) );
  FA1D0HVT \intadd_2/U6  ( .A(\intadd_2/A[5] ), .B(\intadd_2/B[5] ), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(\intadd_2/SUM[5] ) );
  FA1D0HVT \intadd_2/U5  ( .A(\intadd_2/A[6] ), .B(\intadd_2/B[6] ), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[6] ) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[7] ), .B(\intadd_2/B[7] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[7] ) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[8] ), .B(\intadd_2/B[8] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[8] ) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[9] ), .B(\intadd_2/B[9] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(\intadd_2/SUM[9] ) );
  CKAN2D0HVT U2 ( .A1(n5), .A2(n59), .Z(n1) );
  CKND2D0HVT U3 ( .A1(n1), .A2(n25), .ZN(n24) );
  OAI22D0HVT U4 ( .A1(n66), .A2(n32), .B1(n67), .B2(n35), .ZN(n54) );
  CKND2D0HVT U5 ( .A1(n48), .A2(n49), .ZN(\intadd_2/B[3] ) );
  CKND2D0HVT U6 ( .A1(n42), .A2(n43), .ZN(\intadd_2/CI ) );
  CKND2D0HVT U7 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n5) );
  INVD0HVT U8 ( .I(MUL_OP_A[0]), .ZN(n15) );
  NR2D0HVT U9 ( .A1(n5), .A2(n15), .ZN(MUL_RESULT[0]) );
  INVD0HVT U10 ( .I(MUL_OP_A[1]), .ZN(n16) );
  ND3D0HVT U11 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .A3(MUL_OP_B[1]), .ZN(n38) );
  INVD0HVT U12 ( .I(n38), .ZN(n2) );
  CKND2D0HVT U13 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n12) );
  INVD0HVT U14 ( .I(n12), .ZN(n59) );
  NR2D0HVT U15 ( .A1(n5), .A2(n59), .ZN(n60) );
  AOI22D0HVT U16 ( .A1(n16), .A2(n2), .B1(MUL_OP_A[1]), .B2(n60), .ZN(n4) );
  OAI211D0HVT U17 ( .A1(n5), .A2(n16), .B(n59), .C(n15), .ZN(n9) );
  INVD0HVT U18 ( .I(n9), .ZN(n3) );
  AOI221D0HVT U19 ( .A1(MUL_RESULT[0]), .A2(n4), .B1(n12), .B2(n4), .C(n3), 
        .ZN(MUL_RESULT[1]) );
  INVD0HVT U20 ( .I(\intadd_2/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U21 ( .I(\intadd_2/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U22 ( .I(\intadd_2/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U23 ( .I(\intadd_2/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U24 ( .I(\intadd_2/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U25 ( .I(\intadd_2/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U26 ( .I(\intadd_2/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U27 ( .I(\intadd_2/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U28 ( .I(\intadd_2/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U29 ( .I(\intadd_2/SUM[9] ), .ZN(MUL_RESULT[12]) );
  INVD0HVT U30 ( .I(MUL_OP_A[2]), .ZN(n19) );
  INVD0HVT U31 ( .I(n60), .ZN(n37) );
  CKND2D0HVT U32 ( .A1(n1), .A2(n16), .ZN(n6) );
  OAI221D0HVT U33 ( .A1(MUL_OP_A[2]), .A2(n38), .B1(n19), .B2(n37), .C(n6), 
        .ZN(n42) );
  CKND2D0HVT U34 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n13) );
  NR2D0HVT U35 ( .A1(n59), .A2(n13), .ZN(n8) );
  INVD0HVT U36 ( .I(n13), .ZN(n14) );
  NR2D0HVT U37 ( .A1(n14), .A2(n12), .ZN(n7) );
  NR2D0HVT U38 ( .A1(n8), .A2(n7), .ZN(n67) );
  OAI21D0HVT U39 ( .A1(n67), .A2(n15), .B(n9), .ZN(n43) );
  CKND2D0HVT U40 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n41) );
  INVD0HVT U41 ( .I(n41), .ZN(n40) );
  INVD0HVT U42 ( .I(n67), .ZN(n11) );
  NR3D0HVT U43 ( .A1(n59), .A2(n14), .A3(n41), .ZN(n10) );
  AOI31D0HVT U44 ( .A1(n40), .A2(n15), .A3(n11), .B(n10), .ZN(\intadd_2/B[0] )
         );
  AOI33D0HVT U45 ( .A1(n59), .A2(n14), .A3(n41), .B1(n40), .B2(n13), .B3(n12), 
        .ZN(n66) );
  AOI22D0HVT U46 ( .A1(MUL_OP_A[0]), .A2(n41), .B1(n40), .B2(n15), .ZN(n17) );
  AOI22D0HVT U47 ( .A1(MUL_OP_A[1]), .A2(n41), .B1(n40), .B2(n16), .ZN(n20) );
  OAI22D0HVT U48 ( .A1(n66), .A2(n17), .B1(n67), .B2(n20), .ZN(n44) );
  INVD0HVT U49 ( .I(MUL_OP_A[3]), .ZN(n22) );
  CKND2D0HVT U50 ( .A1(n1), .A2(n19), .ZN(n18) );
  OAI221D0HVT U51 ( .A1(MUL_OP_A[3]), .A2(n38), .B1(n22), .B2(n37), .C(n18), 
        .ZN(n45) );
  CKND2D0HVT U52 ( .A1(n44), .A2(n45), .ZN(\intadd_2/B[1] ) );
  AOI22D0HVT U53 ( .A1(MUL_OP_A[2]), .A2(n41), .B1(n40), .B2(n19), .ZN(n23) );
  OAI22D0HVT U54 ( .A1(n66), .A2(n20), .B1(n67), .B2(n23), .ZN(n46) );
  INVD0HVT U55 ( .I(MUL_OP_A[4]), .ZN(n25) );
  CKND2D0HVT U56 ( .A1(n1), .A2(n22), .ZN(n21) );
  OAI221D0HVT U57 ( .A1(MUL_OP_A[4]), .A2(n38), .B1(n25), .B2(n37), .C(n21), 
        .ZN(n47) );
  CKND2D0HVT U58 ( .A1(n46), .A2(n47), .ZN(\intadd_2/B[2] ) );
  AOI22D0HVT U59 ( .A1(n40), .A2(n22), .B1(MUL_OP_A[3]), .B2(n41), .ZN(n26) );
  OAI22D0HVT U60 ( .A1(n66), .A2(n23), .B1(n67), .B2(n26), .ZN(n48) );
  INVD0HVT U61 ( .I(MUL_OP_A[5]), .ZN(n28) );
  OAI221D0HVT U62 ( .A1(MUL_OP_A[5]), .A2(n38), .B1(n28), .B2(n37), .C(n24), 
        .ZN(n49) );
  AOI22D0HVT U63 ( .A1(n40), .A2(n25), .B1(MUL_OP_A[4]), .B2(n41), .ZN(n29) );
  OAI22D0HVT U64 ( .A1(n66), .A2(n26), .B1(n67), .B2(n29), .ZN(n50) );
  INVD0HVT U65 ( .I(MUL_OP_A[6]), .ZN(n31) );
  CKND2D0HVT U66 ( .A1(n1), .A2(n28), .ZN(n27) );
  OAI221D0HVT U67 ( .A1(MUL_OP_A[6]), .A2(n38), .B1(n31), .B2(n37), .C(n27), 
        .ZN(n51) );
  CKND2D0HVT U68 ( .A1(n50), .A2(n51), .ZN(\intadd_2/B[4] ) );
  AOI22D0HVT U69 ( .A1(n40), .A2(n28), .B1(MUL_OP_A[5]), .B2(n41), .ZN(n32) );
  OAI22D0HVT U70 ( .A1(n66), .A2(n29), .B1(n67), .B2(n32), .ZN(n52) );
  INVD0HVT U71 ( .I(MUL_OP_A[7]), .ZN(n34) );
  CKND2D0HVT U72 ( .A1(n1), .A2(n31), .ZN(n30) );
  OAI221D0HVT U73 ( .A1(MUL_OP_A[7]), .A2(n38), .B1(n34), .B2(n37), .C(n30), 
        .ZN(n53) );
  CKND2D0HVT U74 ( .A1(n52), .A2(n53), .ZN(\intadd_2/B[5] ) );
  AOI22D0HVT U75 ( .A1(n40), .A2(n31), .B1(MUL_OP_A[6]), .B2(n41), .ZN(n35) );
  INVD0HVT U76 ( .I(MUL_OP_A[8]), .ZN(n39) );
  CKND2D0HVT U77 ( .A1(n1), .A2(n34), .ZN(n33) );
  OAI221D0HVT U78 ( .A1(MUL_OP_A[8]), .A2(n38), .B1(n39), .B2(n37), .C(n33), 
        .ZN(n55) );
  CKND2D0HVT U79 ( .A1(n54), .A2(n55), .ZN(\intadd_2/B[6] ) );
  AOI22D0HVT U80 ( .A1(n40), .A2(n34), .B1(MUL_OP_A[7]), .B2(n41), .ZN(n62) );
  OAI22D0HVT U81 ( .A1(n66), .A2(n35), .B1(n67), .B2(n62), .ZN(n56) );
  INVD0HVT U82 ( .I(MUL_OP_A[9]), .ZN(n58) );
  CKND2D0HVT U83 ( .A1(n1), .A2(n39), .ZN(n36) );
  OAI221D0HVT U84 ( .A1(MUL_OP_A[9]), .A2(n38), .B1(n58), .B2(n37), .C(n36), 
        .ZN(n57) );
  CKND2D0HVT U85 ( .A1(n56), .A2(n57), .ZN(\intadd_2/B[7] ) );
  AOI22D0HVT U86 ( .A1(n40), .A2(n39), .B1(MUL_OP_A[8]), .B2(n41), .ZN(n61) );
  AOI22D0HVT U87 ( .A1(MUL_OP_A[9]), .A2(n41), .B1(n40), .B2(n58), .ZN(n65) );
  OAI22D0HVT U88 ( .A1(n66), .A2(n61), .B1(n67), .B2(n65), .ZN(\intadd_2/A[8] ) );
  INVD0HVT U89 ( .I(\intadd_2/A[8] ), .ZN(\intadd_2/B[9] ) );
  OA21D0HVT U90 ( .A1(n43), .A2(n42), .B(\intadd_2/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U91 ( .A1(n45), .A2(n44), .B(\intadd_2/B[1] ), .ZN(
        \intadd_2/A[0] ) );
  OAI21D0HVT U92 ( .A1(n47), .A2(n46), .B(\intadd_2/B[2] ), .ZN(
        \intadd_2/A[1] ) );
  OAI21D0HVT U93 ( .A1(n49), .A2(n48), .B(\intadd_2/B[3] ), .ZN(
        \intadd_2/A[2] ) );
  OAI21D0HVT U94 ( .A1(n51), .A2(n50), .B(\intadd_2/B[4] ), .ZN(
        \intadd_2/A[3] ) );
  OAI21D0HVT U95 ( .A1(n53), .A2(n52), .B(\intadd_2/B[5] ), .ZN(
        \intadd_2/A[4] ) );
  OAI21D0HVT U96 ( .A1(n55), .A2(n54), .B(\intadd_2/B[6] ), .ZN(
        \intadd_2/A[5] ) );
  OAI21D0HVT U97 ( .A1(n57), .A2(n56), .B(\intadd_2/B[7] ), .ZN(
        \intadd_2/A[6] ) );
  AOI22D0HVT U98 ( .A1(MUL_OP_A[9]), .A2(n60), .B1(n59), .B2(n58), .ZN(n64) );
  OAI22D0HVT U99 ( .A1(n66), .A2(n62), .B1(n67), .B2(n61), .ZN(n63) );
  NR2D0HVT U100 ( .A1(n64), .A2(n63), .ZN(\intadd_2/B[8] ) );
  AOI21D0HVT U101 ( .A1(n64), .A2(n63), .B(\intadd_2/B[8] ), .ZN(
        \intadd_2/A[7] ) );
  AOI21D0HVT U102 ( .A1(n67), .A2(n66), .B(n65), .ZN(\intadd_2/A[9] ) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v2_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module newMAC_v2 ( clk, rst_n, en, data_valid, weight, activation, reset, acc, 
        output_valid, output_result );
  input [3:0] weight;
  input [7:0] activation;
  output [16:0] output_result;
  input clk, rst_n, en, data_valid, reset, acc;
  output output_valid;
  wire   zero_flag, update_Flag, N74, inACC, \MUL_CNT_PLUS_1[3] , N156, N157,
         N158, N159, N160, N161, N162, N163, N164, N165, N166, N167, N168,
         N169, N170, N171, N172, N173, ren_IS, net141, n30, n31, n32,
         \intadd_0/A[12] , \intadd_0/A[11] , \intadd_0/A[10] , \intadd_0/A[9] ,
         \intadd_0/A[8] , \intadd_0/A[7] , \intadd_0/A[6] , \intadd_0/A[5] ,
         \intadd_0/A[4] , \intadd_0/A[3] , \intadd_0/A[2] , \intadd_0/A[1] ,
         \intadd_0/A[0] , \intadd_0/B[14] , \intadd_0/B[13] , \intadd_0/B[12] ,
         \intadd_0/B[11] , \intadd_0/B[10] , \intadd_0/B[9] , \intadd_0/B[8] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/n15 , \intadd_0/n14 , \intadd_0/n13 ,
         \intadd_0/n12 , \intadd_0/n11 , \intadd_0/n10 , \intadd_0/n9 ,
         \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69;
  wire   [2:0] index;
  wire   [9:0] ADD_OP_A;
  wire   [9:0] ADD_OP_B;
  wire   [9:0] data_A_READ_DATA;
  wire   [2:0] MUL_CNT;
  wire   [13:0] MUL_RESULT;
  wire   [2:0] addr_B_IS;
  assign N74 = activation[0];

  indexGen u_indexGen ( .data_valid(data_valid), .weight(weight), .activation(
        {activation[7:1], N74}), .index(index), .zero(zero_flag) );
  internalStorage u_internalStorage ( .clk(clk), .rst_n(rst_n), .en(en), 
        .reset(reset), .wen(update_Flag), .addr_A(index), .data_A(
        data_A_READ_DATA), .ren(ren_IS), .addr_B(addr_B_IS), .data_B(ADD_OP_A)
         );
  ADDER u_ADDER ( .ADD_EN(update_Flag), .ADD_OP_A(ADD_OP_A), .ADD_OP_B({1'b0, 
        ADD_OP_B[9], ADD_OP_B[7:0]}), .ADD_RESULT(data_A_READ_DATA) );
  MULTIPLIER u_MULTIPLIER ( .MUL_EN(inACC), .MUL_OP_A(ADD_OP_A), .MUL_OP_B({
        \MUL_CNT_PLUS_1[3] , n31, n30, n32}), .MUL_RESULT(MUL_RESULT) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v2_8 clk_gate_output_result_reg ( .CLK(clk), 
        .EN(N173), .ENCLK(net141), .TE(n34) );
  DFCNQD1HVT \MUL_CNT_reg[0]  ( .D(n32), .CP(net141), .CDN(rst_n), .Q(
        MUL_CNT[0]) );
  DFCNQD1HVT \MUL_CNT_reg[1]  ( .D(n30), .CP(net141), .CDN(rst_n), .Q(
        MUL_CNT[1]) );
  DFCNQD1HVT \MUL_CNT_reg[2]  ( .D(n31), .CP(net141), .CDN(rst_n), .Q(
        MUL_CNT[2]) );
  DFCNQD1HVT output_valid_reg ( .D(\MUL_CNT_PLUS_1[3] ), .CP(net141), .CDN(
        rst_n), .Q(output_valid) );
  FA1D0HVT \intadd_0/U16  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n15 ), .S(N157) );
  FA1D0HVT \intadd_0/U15  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n15 ), .CO(\intadd_0/n14 ), .S(N158) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/A[12] ), .B(\intadd_0/B[12] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(N169) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/A[12] ), .B(\intadd_0/B[13] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(N170) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[12] ), .B(\intadd_0/B[14] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(N171) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N171), .CP(net141), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N170), .CP(net141), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N169), .CP(net141), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N168), .CP(net141), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N172), .CP(net141), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N167), .CP(net141), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N166), .CP(net141), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N165), .CP(net141), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N164), .CP(net141), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N163), .CP(net141), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N162), .CP(net141), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N161), .CP(net141), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N160), .CP(net141), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N159), .CP(net141), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N158), .CP(net141), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N157), .CP(net141), .CDN(rst_n), .Q(
        output_result[1]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N156), .CP(net141), .CDN(rst_n), .Q(
        output_result[0]) );
  FA1D0HVT \intadd_0/U14  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n14 ), .CO(\intadd_0/n13 ), .S(N159) );
  FA1D0HVT \intadd_0/U13  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n13 ), .CO(\intadd_0/n12 ), .S(N160) );
  FA1D0HVT \intadd_0/U12  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n12 ), .CO(\intadd_0/n11 ), .S(N161) );
  FA1D0HVT \intadd_0/U11  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n11 ), .CO(\intadd_0/n10 ), .S(N162) );
  FA1D0HVT \intadd_0/U10  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(N163) );
  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[7] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(N164) );
  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[8] ), .B(\intadd_0/B[8] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(N165) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[9] ), .B(\intadd_0/B[9] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(N166) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/A[10] ), .B(\intadd_0/B[10] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(N167) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/A[11] ), .B(\intadd_0/B[11] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(N168) );
  TIELHVT U101 ( .ZN(n34) );
  INVD0HVT U102 ( .I(weight[3]), .ZN(n36) );
  INVD0HVT U103 ( .I(activation[1]), .ZN(n59) );
  INVD0HVT U104 ( .I(N74), .ZN(n60) );
  CKAN2D0HVT U105 ( .A1(MUL_RESULT[2]), .A2(inACC), .Z(\intadd_0/B[1] ) );
  NR4D1HVT U106 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .A3(MUL_CNT[2]), .A4(acc), 
        .ZN(n51) );
  INVD0HVT U107 ( .I(n51), .ZN(inACC) );
  IND2D0HVT U108 ( .A1(zero_flag), .B1(data_valid), .ZN(n55) );
  INVD0HVT U109 ( .I(n55), .ZN(update_Flag) );
  CKND2D0HVT U110 ( .A1(n51), .A2(n55), .ZN(ren_IS) );
  INVD0HVT U111 ( .I(activation[7]), .ZN(n39) );
  NR3D0HVT U112 ( .A1(activation[2]), .A2(N74), .A3(activation[1]), .ZN(n58)
         );
  INVD0HVT U113 ( .I(activation[3]), .ZN(n40) );
  CKND2D0HVT U114 ( .A1(n58), .A2(n40), .ZN(n68) );
  NR2D0HVT U115 ( .A1(activation[4]), .A2(n68), .ZN(n65) );
  INVD0HVT U116 ( .I(activation[5]), .ZN(n42) );
  CKND2D0HVT U117 ( .A1(n65), .A2(n42), .ZN(n45) );
  NR2D0HVT U118 ( .A1(activation[6]), .A2(n45), .ZN(n44) );
  XNR2D0HVT U119 ( .A1(n39), .A2(n44), .ZN(n38) );
  NR3D0HVT U120 ( .A1(weight[0]), .A2(weight[2]), .A3(weight[1]), .ZN(n35) );
  MUX2ND0HVT U121 ( .I0(n36), .I1(weight[3]), .S(n35), .ZN(n37) );
  CKND2D0HVT U122 ( .A1(update_Flag), .A2(n37), .ZN(n64) );
  INVD0HVT U123 ( .I(n37), .ZN(n54) );
  CKND2D0HVT U124 ( .A1(update_Flag), .A2(n54), .ZN(n67) );
  OAI22D0HVT U125 ( .A1(n38), .A2(n64), .B1(n39), .B2(n67), .ZN(ADD_OP_B[7])
         );
  AOI22D0HVT U126 ( .A1(activation[7]), .A2(n67), .B1(n64), .B2(n39), .ZN(
        ADD_OP_B[9]) );
  CKAN2D0HVT U127 ( .A1(MUL_RESULT[1]), .A2(inACC), .Z(\intadd_0/CI ) );
  CKAN2D0HVT U128 ( .A1(MUL_RESULT[13]), .A2(inACC), .Z(\intadd_0/A[12] ) );
  CKAN2D0HVT U129 ( .A1(MUL_RESULT[3]), .A2(inACC), .Z(\intadd_0/B[2] ) );
  CKAN2D0HVT U130 ( .A1(MUL_RESULT[4]), .A2(inACC), .Z(\intadd_0/B[3] ) );
  CKAN2D0HVT U131 ( .A1(MUL_RESULT[5]), .A2(inACC), .Z(\intadd_0/B[4] ) );
  CKAN2D0HVT U132 ( .A1(MUL_RESULT[6]), .A2(inACC), .Z(\intadd_0/B[5] ) );
  CKAN2D0HVT U133 ( .A1(MUL_RESULT[7]), .A2(inACC), .Z(\intadd_0/B[6] ) );
  CKAN2D0HVT U134 ( .A1(MUL_RESULT[8]), .A2(inACC), .Z(\intadd_0/B[7] ) );
  CKAN2D0HVT U135 ( .A1(MUL_RESULT[9]), .A2(inACC), .Z(\intadd_0/B[8] ) );
  CKAN2D0HVT U136 ( .A1(MUL_RESULT[10]), .A2(inACC), .Z(\intadd_0/B[9] ) );
  CKAN2D0HVT U137 ( .A1(MUL_RESULT[11]), .A2(inACC), .Z(\intadd_0/B[10] ) );
  CKAN2D0HVT U138 ( .A1(MUL_RESULT[12]), .A2(inACC), .Z(\intadd_0/B[11] ) );
  OA21D0HVT U139 ( .A1(reset), .A2(inACC), .B(en), .Z(N173) );
  CKND2D0HVT U140 ( .A1(output_result[0]), .A2(MUL_RESULT[0]), .ZN(n50) );
  OA211D0HVT U141 ( .A1(output_result[0]), .A2(MUL_RESULT[0]), .B(inACC), .C(
        n50), .Z(N156) );
  NR2D0HVT U142 ( .A1(n55), .A2(n60), .ZN(ADD_OP_B[0]) );
  OAI21D0HVT U143 ( .A1(n58), .A2(n54), .B(update_Flag), .ZN(n41) );
  OAI32D0HVT U144 ( .A1(activation[3]), .A2(n58), .A3(n64), .B1(n41), .B2(n40), 
        .ZN(ADD_OP_B[3]) );
  OAI21D0HVT U145 ( .A1(n65), .A2(n54), .B(update_Flag), .ZN(n43) );
  OAI32D0HVT U146 ( .A1(activation[5]), .A2(n65), .A3(n64), .B1(n43), .B2(n42), 
        .ZN(ADD_OP_B[5]) );
  INVD0HVT U147 ( .I(n67), .ZN(n47) );
  AOI211D0HVT U148 ( .A1(activation[6]), .A2(n45), .B(n44), .C(n64), .ZN(n46)
         );
  AO21D0HVT U149 ( .A1(n47), .A2(activation[6]), .B(n46), .Z(ADD_OP_B[6]) );
  CKND2D0HVT U150 ( .A1(MUL_RESULT[13]), .A2(output_result[16]), .ZN(n48) );
  OAI211D0HVT U151 ( .A1(MUL_RESULT[13]), .A2(output_result[16]), .B(inACC), 
        .C(n48), .ZN(n49) );
  XNR2D0HVT U152 ( .A1(\intadd_0/n1 ), .A2(n49), .ZN(N172) );
  INR2D0HVT U153 ( .A1(output_result[1]), .B1(n51), .ZN(\intadd_0/B[0] ) );
  NR2D0HVT U154 ( .A1(n51), .A2(n50), .ZN(\intadd_0/A[0] ) );
  INR2D0HVT U155 ( .A1(output_result[2]), .B1(n51), .ZN(\intadd_0/A[1] ) );
  INR2D0HVT U156 ( .A1(output_result[3]), .B1(n51), .ZN(\intadd_0/A[2] ) );
  INR2D0HVT U157 ( .A1(output_result[4]), .B1(n51), .ZN(\intadd_0/A[3] ) );
  INR2D0HVT U158 ( .A1(output_result[5]), .B1(n51), .ZN(\intadd_0/A[4] ) );
  INR2D0HVT U159 ( .A1(output_result[6]), .B1(n51), .ZN(\intadd_0/A[5] ) );
  INR2D0HVT U160 ( .A1(output_result[7]), .B1(n51), .ZN(\intadd_0/A[6] ) );
  INR2D0HVT U161 ( .A1(output_result[8]), .B1(n51), .ZN(\intadd_0/A[7] ) );
  INR2D0HVT U162 ( .A1(output_result[9]), .B1(n51), .ZN(\intadd_0/A[8] ) );
  INR2D0HVT U163 ( .A1(output_result[10]), .B1(n51), .ZN(\intadd_0/A[9] ) );
  INR2D0HVT U164 ( .A1(output_result[11]), .B1(n51), .ZN(\intadd_0/A[10] ) );
  INR2D0HVT U165 ( .A1(output_result[12]), .B1(n51), .ZN(\intadd_0/A[11] ) );
  INR2D0HVT U166 ( .A1(output_result[13]), .B1(n51), .ZN(\intadd_0/B[12] ) );
  INR2D0HVT U167 ( .A1(output_result[14]), .B1(n51), .ZN(\intadd_0/B[13] ) );
  INR2D0HVT U168 ( .A1(output_result[15]), .B1(n51), .ZN(\intadd_0/B[14] ) );
  NR2D0HVT U169 ( .A1(MUL_CNT[0]), .A2(n51), .ZN(n32) );
  AO21D0HVT U170 ( .A1(n51), .A2(index[2]), .B(MUL_CNT[2]), .Z(addr_B_IS[2])
         );
  AO21D0HVT U171 ( .A1(n51), .A2(index[0]), .B(MUL_CNT[0]), .Z(addr_B_IS[0])
         );
  AO21D0HVT U172 ( .A1(n51), .A2(index[1]), .B(MUL_CNT[1]), .Z(addr_B_IS[1])
         );
  INVD0HVT U173 ( .I(MUL_CNT[2]), .ZN(n52) );
  CKND2D0HVT U174 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .ZN(n53) );
  NR2D0HVT U175 ( .A1(n52), .A2(n53), .ZN(\MUL_CNT_PLUS_1[3] ) );
  AOI21D0HVT U176 ( .A1(n52), .A2(n53), .B(\MUL_CNT_PLUS_1[3] ), .ZN(n31) );
  OA21D0HVT U177 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .B(n53), .Z(n30) );
  NR2D0HVT U178 ( .A1(n54), .A2(n60), .ZN(n57) );
  INVD0HVT U179 ( .I(n57), .ZN(n56) );
  AOI221D0HVT U180 ( .A1(activation[1]), .A2(n57), .B1(n59), .B2(n56), .C(n55), 
        .ZN(ADD_OP_B[1]) );
  OR2D0HVT U181 ( .A1(n64), .A2(n58), .Z(n63) );
  CKND2D0HVT U182 ( .A1(n60), .A2(n59), .ZN(n62) );
  INVD0HVT U183 ( .I(activation[2]), .ZN(n61) );
  OAI222D0HVT U184 ( .A1(n63), .A2(n62), .B1(n63), .B2(activation[2]), .C1(n67), .C2(n61), .ZN(ADD_OP_B[2]) );
  OR2D0HVT U185 ( .A1(n65), .A2(n64), .Z(n69) );
  INVD0HVT U186 ( .I(activation[4]), .ZN(n66) );
  OAI222D0HVT U187 ( .A1(n69), .A2(n68), .B1(n69), .B2(activation[4]), .C1(n67), .C2(n66), .ZN(ADD_OP_B[4]) );
endmodule

