/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jan 16 18:22:37 2026
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


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module internalStorage ( clk, rst_n, en, reset, wen, addr_A, data_A, ren, 
        addr_B, data_B );
  input [2:0] addr_A;
  input [13:0] data_A;
  input [2:0] addr_B;
  output [13:0] data_B;
  input clk, rst_n, en, reset, wen, ren;
  wire   \*Logic0* , \partialAcc[7][13] , \partialAcc[7][12] ,
         \partialAcc[7][11] , \partialAcc[7][10] , \partialAcc[7][9] ,
         \partialAcc[7][8] , \partialAcc[7][7] , \partialAcc[7][6] ,
         \partialAcc[7][5] , \partialAcc[7][4] , \partialAcc[7][3] ,
         \partialAcc[7][2] , \partialAcc[7][1] , \partialAcc[7][0] ,
         \partialAcc[6][13] , \partialAcc[6][12] , \partialAcc[6][11] ,
         \partialAcc[6][10] , \partialAcc[6][9] , \partialAcc[6][8] ,
         \partialAcc[6][7] , \partialAcc[6][6] , \partialAcc[6][5] ,
         \partialAcc[6][4] , \partialAcc[6][3] , \partialAcc[6][2] ,
         \partialAcc[6][1] , \partialAcc[6][0] , \partialAcc[5][13] ,
         \partialAcc[5][12] , \partialAcc[5][11] , \partialAcc[5][10] ,
         \partialAcc[5][9] , \partialAcc[5][8] , \partialAcc[5][7] ,
         \partialAcc[5][6] , \partialAcc[5][5] , \partialAcc[5][4] ,
         \partialAcc[5][3] , \partialAcc[5][2] , \partialAcc[5][1] ,
         \partialAcc[5][0] , \partialAcc[4][13] , \partialAcc[4][12] ,
         \partialAcc[4][11] , \partialAcc[4][10] , \partialAcc[4][9] ,
         \partialAcc[4][8] , \partialAcc[4][7] , \partialAcc[4][6] ,
         \partialAcc[4][5] , \partialAcc[4][4] , \partialAcc[4][3] ,
         \partialAcc[4][2] , \partialAcc[4][1] , \partialAcc[4][0] ,
         \partialAcc[3][13] , \partialAcc[3][12] , \partialAcc[3][11] ,
         \partialAcc[3][10] , \partialAcc[3][9] , \partialAcc[3][8] ,
         \partialAcc[3][7] , \partialAcc[3][6] , \partialAcc[3][5] ,
         \partialAcc[3][4] , \partialAcc[3][3] , \partialAcc[3][2] ,
         \partialAcc[3][1] , \partialAcc[3][0] , \partialAcc[2][13] ,
         \partialAcc[2][12] , \partialAcc[2][11] , \partialAcc[2][10] ,
         \partialAcc[2][9] , \partialAcc[2][8] , \partialAcc[2][7] ,
         \partialAcc[2][6] , \partialAcc[2][5] , \partialAcc[2][4] ,
         \partialAcc[2][3] , \partialAcc[2][2] , \partialAcc[2][1] ,
         \partialAcc[2][0] , \partialAcc[1][13] , \partialAcc[1][12] ,
         \partialAcc[1][11] , \partialAcc[1][10] , \partialAcc[1][9] ,
         \partialAcc[1][8] , \partialAcc[1][7] , \partialAcc[1][6] ,
         \partialAcc[1][5] , \partialAcc[1][4] , \partialAcc[1][3] ,
         \partialAcc[1][2] , \partialAcc[1][1] , \partialAcc[1][0] ,
         \partialAcc[0][13] , \partialAcc[0][12] , \partialAcc[0][11] ,
         \partialAcc[0][10] , \partialAcc[0][9] , \partialAcc[0][8] ,
         \partialAcc[0][7] , \partialAcc[0][6] , \partialAcc[0][5] ,
         \partialAcc[0][4] , \partialAcc[0][3] , \partialAcc[0][2] ,
         \partialAcc[0][1] , \partialAcc[0][0] , N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N50, N51, N52, N53, N54, N55,
         N56, N57, net153, net161, net167, net173, net179, net185, net191,
         net197, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74;

  SNPS_CLOCK_GATE_HIGH_newMAC_v1_7 \clk_gate_partialAcc_reg[7]  ( .CLK(clk), 
        .EN(N57), .ENCLK(net153), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_6 \clk_gate_partialAcc_reg[6]  ( .CLK(clk), 
        .EN(N56), .ENCLK(net161), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_5 \clk_gate_partialAcc_reg[5]  ( .CLK(clk), 
        .EN(N55), .ENCLK(net167), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_4 \clk_gate_partialAcc_reg[4]  ( .CLK(clk), 
        .EN(N54), .ENCLK(net173), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_3 \clk_gate_partialAcc_reg[3]  ( .CLK(clk), 
        .EN(N53), .ENCLK(net179), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_2 \clk_gate_partialAcc_reg[2]  ( .CLK(clk), 
        .EN(N52), .ENCLK(net185), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_1 \clk_gate_partialAcc_reg[1]  ( .CLK(clk), 
        .EN(N51), .ENCLK(net191), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_0 \clk_gate_partialAcc_reg[0]  ( .CLK(clk), 
        .EN(N50), .ENCLK(net197), .TE(\*Logic0* ) );
  DFCNQD1HVT \partialAcc_reg[7][13]  ( .D(N42), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][13] ) );
  DFCNQD1HVT \partialAcc_reg[7][12]  ( .D(N41), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][12] ) );
  DFCNQD1HVT \partialAcc_reg[7][11]  ( .D(N40), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][11] ) );
  DFCNQD1HVT \partialAcc_reg[7][10]  ( .D(N39), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][10] ) );
  DFCNQD1HVT \partialAcc_reg[7][9]  ( .D(N38), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][9] ) );
  DFCNQD1HVT \partialAcc_reg[7][8]  ( .D(N37), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][8] ) );
  DFCNQD1HVT \partialAcc_reg[7][7]  ( .D(N36), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][7] ) );
  DFCNQD1HVT \partialAcc_reg[7][6]  ( .D(N35), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][6] ) );
  DFCNQD1HVT \partialAcc_reg[7][5]  ( .D(N34), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][5] ) );
  DFCNQD1HVT \partialAcc_reg[7][4]  ( .D(N33), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][4] ) );
  DFCNQD1HVT \partialAcc_reg[7][3]  ( .D(N32), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][3] ) );
  DFCNQD1HVT \partialAcc_reg[7][2]  ( .D(N31), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][2] ) );
  DFCNQD1HVT \partialAcc_reg[7][1]  ( .D(N30), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][1] ) );
  DFCNQD1HVT \partialAcc_reg[7][0]  ( .D(N29), .CP(net153), .CDN(rst_n), .Q(
        \partialAcc[7][0] ) );
  DFCNQD1HVT \partialAcc_reg[6][13]  ( .D(N42), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][13] ) );
  DFCNQD1HVT \partialAcc_reg[6][12]  ( .D(N41), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][12] ) );
  DFCNQD1HVT \partialAcc_reg[6][11]  ( .D(N40), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][11] ) );
  DFCNQD1HVT \partialAcc_reg[6][10]  ( .D(N39), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][10] ) );
  DFCNQD1HVT \partialAcc_reg[6][9]  ( .D(N38), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][9] ) );
  DFCNQD1HVT \partialAcc_reg[6][8]  ( .D(N37), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][8] ) );
  DFCNQD1HVT \partialAcc_reg[6][7]  ( .D(N36), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][7] ) );
  DFCNQD1HVT \partialAcc_reg[6][6]  ( .D(N35), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][6] ) );
  DFCNQD1HVT \partialAcc_reg[6][5]  ( .D(N34), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][5] ) );
  DFCNQD1HVT \partialAcc_reg[6][4]  ( .D(N33), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][4] ) );
  DFCNQD1HVT \partialAcc_reg[6][3]  ( .D(N32), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][3] ) );
  DFCNQD1HVT \partialAcc_reg[6][2]  ( .D(N31), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][2] ) );
  DFCNQD1HVT \partialAcc_reg[6][1]  ( .D(N30), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][1] ) );
  DFCNQD1HVT \partialAcc_reg[6][0]  ( .D(N29), .CP(net161), .CDN(rst_n), .Q(
        \partialAcc[6][0] ) );
  DFCNQD1HVT \partialAcc_reg[5][13]  ( .D(N42), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][13] ) );
  DFCNQD1HVT \partialAcc_reg[5][12]  ( .D(N41), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][12] ) );
  DFCNQD1HVT \partialAcc_reg[5][11]  ( .D(N40), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][11] ) );
  DFCNQD1HVT \partialAcc_reg[5][10]  ( .D(N39), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][10] ) );
  DFCNQD1HVT \partialAcc_reg[5][9]  ( .D(N38), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][9] ) );
  DFCNQD1HVT \partialAcc_reg[5][8]  ( .D(N37), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][8] ) );
  DFCNQD1HVT \partialAcc_reg[5][7]  ( .D(N36), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][7] ) );
  DFCNQD1HVT \partialAcc_reg[5][6]  ( .D(N35), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][6] ) );
  DFCNQD1HVT \partialAcc_reg[5][5]  ( .D(N34), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][5] ) );
  DFCNQD1HVT \partialAcc_reg[5][4]  ( .D(N33), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][4] ) );
  DFCNQD1HVT \partialAcc_reg[5][3]  ( .D(N32), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][3] ) );
  DFCNQD1HVT \partialAcc_reg[5][2]  ( .D(N31), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][2] ) );
  DFCNQD1HVT \partialAcc_reg[5][1]  ( .D(N30), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][1] ) );
  DFCNQD1HVT \partialAcc_reg[5][0]  ( .D(N29), .CP(net167), .CDN(rst_n), .Q(
        \partialAcc[5][0] ) );
  DFCNQD1HVT \partialAcc_reg[4][13]  ( .D(N42), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][13] ) );
  DFCNQD1HVT \partialAcc_reg[4][12]  ( .D(N41), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][12] ) );
  DFCNQD1HVT \partialAcc_reg[4][11]  ( .D(N40), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][11] ) );
  DFCNQD1HVT \partialAcc_reg[4][10]  ( .D(N39), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][10] ) );
  DFCNQD1HVT \partialAcc_reg[4][9]  ( .D(N38), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][9] ) );
  DFCNQD1HVT \partialAcc_reg[4][8]  ( .D(N37), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][8] ) );
  DFCNQD1HVT \partialAcc_reg[4][7]  ( .D(N36), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][7] ) );
  DFCNQD1HVT \partialAcc_reg[4][6]  ( .D(N35), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][6] ) );
  DFCNQD1HVT \partialAcc_reg[4][5]  ( .D(N34), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][5] ) );
  DFCNQD1HVT \partialAcc_reg[4][4]  ( .D(N33), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][4] ) );
  DFCNQD1HVT \partialAcc_reg[4][3]  ( .D(N32), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][3] ) );
  DFCNQD1HVT \partialAcc_reg[4][2]  ( .D(N31), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][2] ) );
  DFCNQD1HVT \partialAcc_reg[4][1]  ( .D(N30), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][1] ) );
  DFCNQD1HVT \partialAcc_reg[4][0]  ( .D(N29), .CP(net173), .CDN(rst_n), .Q(
        \partialAcc[4][0] ) );
  DFCNQD1HVT \partialAcc_reg[3][13]  ( .D(N42), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][13] ) );
  DFCNQD1HVT \partialAcc_reg[3][12]  ( .D(N41), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][12] ) );
  DFCNQD1HVT \partialAcc_reg[3][11]  ( .D(N40), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][11] ) );
  DFCNQD1HVT \partialAcc_reg[3][10]  ( .D(N39), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][10] ) );
  DFCNQD1HVT \partialAcc_reg[3][9]  ( .D(N38), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][9] ) );
  DFCNQD1HVT \partialAcc_reg[3][8]  ( .D(N37), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][8] ) );
  DFCNQD1HVT \partialAcc_reg[3][7]  ( .D(N36), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][7] ) );
  DFCNQD1HVT \partialAcc_reg[3][6]  ( .D(N35), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][6] ) );
  DFCNQD1HVT \partialAcc_reg[3][5]  ( .D(N34), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][5] ) );
  DFCNQD1HVT \partialAcc_reg[3][4]  ( .D(N33), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][4] ) );
  DFCNQD1HVT \partialAcc_reg[3][3]  ( .D(N32), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][3] ) );
  DFCNQD1HVT \partialAcc_reg[3][2]  ( .D(N31), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][2] ) );
  DFCNQD1HVT \partialAcc_reg[3][1]  ( .D(N30), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][1] ) );
  DFCNQD1HVT \partialAcc_reg[3][0]  ( .D(N29), .CP(net179), .CDN(rst_n), .Q(
        \partialAcc[3][0] ) );
  DFCNQD1HVT \partialAcc_reg[2][13]  ( .D(N42), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][13] ) );
  DFCNQD1HVT \partialAcc_reg[2][12]  ( .D(N41), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][12] ) );
  DFCNQD1HVT \partialAcc_reg[2][11]  ( .D(N40), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][11] ) );
  DFCNQD1HVT \partialAcc_reg[2][10]  ( .D(N39), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][10] ) );
  DFCNQD1HVT \partialAcc_reg[2][9]  ( .D(N38), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][9] ) );
  DFCNQD1HVT \partialAcc_reg[2][8]  ( .D(N37), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][8] ) );
  DFCNQD1HVT \partialAcc_reg[2][7]  ( .D(N36), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][7] ) );
  DFCNQD1HVT \partialAcc_reg[2][6]  ( .D(N35), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][6] ) );
  DFCNQD1HVT \partialAcc_reg[2][5]  ( .D(N34), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][5] ) );
  DFCNQD1HVT \partialAcc_reg[2][4]  ( .D(N33), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][4] ) );
  DFCNQD1HVT \partialAcc_reg[2][3]  ( .D(N32), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][3] ) );
  DFCNQD1HVT \partialAcc_reg[2][2]  ( .D(N31), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][2] ) );
  DFCNQD1HVT \partialAcc_reg[2][1]  ( .D(N30), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][1] ) );
  DFCNQD1HVT \partialAcc_reg[2][0]  ( .D(N29), .CP(net185), .CDN(rst_n), .Q(
        \partialAcc[2][0] ) );
  DFCNQD1HVT \partialAcc_reg[1][13]  ( .D(N42), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][13] ) );
  DFCNQD1HVT \partialAcc_reg[1][12]  ( .D(N41), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][12] ) );
  DFCNQD1HVT \partialAcc_reg[1][11]  ( .D(N40), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][11] ) );
  DFCNQD1HVT \partialAcc_reg[1][10]  ( .D(N39), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][10] ) );
  DFCNQD1HVT \partialAcc_reg[1][9]  ( .D(N38), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][9] ) );
  DFCNQD1HVT \partialAcc_reg[1][8]  ( .D(N37), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][8] ) );
  DFCNQD1HVT \partialAcc_reg[1][7]  ( .D(N36), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][7] ) );
  DFCNQD1HVT \partialAcc_reg[1][6]  ( .D(N35), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][6] ) );
  DFCNQD1HVT \partialAcc_reg[1][5]  ( .D(N34), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][5] ) );
  DFCNQD1HVT \partialAcc_reg[1][4]  ( .D(N33), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][4] ) );
  DFCNQD1HVT \partialAcc_reg[1][3]  ( .D(N32), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][3] ) );
  DFCNQD1HVT \partialAcc_reg[1][2]  ( .D(N31), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][2] ) );
  DFCNQD1HVT \partialAcc_reg[1][1]  ( .D(N30), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][1] ) );
  DFCNQD1HVT \partialAcc_reg[1][0]  ( .D(N29), .CP(net191), .CDN(rst_n), .Q(
        \partialAcc[1][0] ) );
  DFCNQD1HVT \partialAcc_reg[0][13]  ( .D(N42), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][13] ) );
  DFCNQD1HVT \partialAcc_reg[0][12]  ( .D(N41), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][12] ) );
  DFCNQD1HVT \partialAcc_reg[0][11]  ( .D(N40), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][11] ) );
  DFCNQD1HVT \partialAcc_reg[0][10]  ( .D(N39), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][10] ) );
  DFCNQD1HVT \partialAcc_reg[0][9]  ( .D(N38), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][9] ) );
  DFCNQD1HVT \partialAcc_reg[0][8]  ( .D(N37), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][8] ) );
  DFCNQD1HVT \partialAcc_reg[0][7]  ( .D(N36), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][7] ) );
  DFCNQD1HVT \partialAcc_reg[0][6]  ( .D(N35), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][6] ) );
  DFCNQD1HVT \partialAcc_reg[0][5]  ( .D(N34), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][5] ) );
  DFCNQD1HVT \partialAcc_reg[0][4]  ( .D(N33), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][4] ) );
  DFCNQD1HVT \partialAcc_reg[0][3]  ( .D(N32), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][3] ) );
  DFCNQD1HVT \partialAcc_reg[0][2]  ( .D(N31), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][2] ) );
  DFCNQD1HVT \partialAcc_reg[0][1]  ( .D(N30), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][1] ) );
  DFCNQD1HVT \partialAcc_reg[0][0]  ( .D(N29), .CP(net197), .CDN(rst_n), .Q(
        \partialAcc[0][0] ) );
  CKND2D0HVT U3 ( .A1(addr_B[2]), .A2(ren), .ZN(n4) );
  AOI22D0HVT U4 ( .A1(n65), .A2(\partialAcc[5][0] ), .B1(n64), .B2(
        \partialAcc[7][0] ), .ZN(n6) );
  ND4D0HVT U5 ( .A1(n49), .A2(n48), .A3(n47), .A4(n46), .ZN(data_B[10]) );
  AOI22D0HVT U6 ( .A1(n65), .A2(\partialAcc[5][13] ), .B1(n64), .B2(
        \partialAcc[7][13] ), .ZN(n66) );
  ND4D0HVT U7 ( .A1(n53), .A2(n52), .A3(n51), .A4(n50), .ZN(data_B[11]) );
  CKAN2D0HVT U8 ( .A1(data_A[11]), .A2(wen), .Z(N40) );
  TIELHVT U9 ( .ZN(\*Logic0* ) );
  CKAN2D0HVT U10 ( .A1(data_A[0]), .A2(wen), .Z(N29) );
  CKAN2D0HVT U11 ( .A1(data_A[1]), .A2(wen), .Z(N30) );
  CKAN2D0HVT U12 ( .A1(data_A[2]), .A2(wen), .Z(N31) );
  CKAN2D0HVT U13 ( .A1(data_A[3]), .A2(wen), .Z(N32) );
  CKAN2D0HVT U14 ( .A1(data_A[4]), .A2(wen), .Z(N33) );
  CKAN2D0HVT U15 ( .A1(data_A[5]), .A2(wen), .Z(N34) );
  CKAN2D0HVT U16 ( .A1(data_A[6]), .A2(wen), .Z(N35) );
  CKAN2D0HVT U17 ( .A1(data_A[7]), .A2(wen), .Z(N36) );
  CKAN2D0HVT U18 ( .A1(data_A[8]), .A2(wen), .Z(N37) );
  CKAN2D0HVT U19 ( .A1(data_A[9]), .A2(wen), .Z(N38) );
  CKAN2D0HVT U20 ( .A1(data_A[10]), .A2(wen), .Z(N39) );
  CKAN2D0HVT U21 ( .A1(data_A[12]), .A2(wen), .Z(N41) );
  CKAN2D0HVT U22 ( .A1(data_A[13]), .A2(wen), .Z(N42) );
  IND2D0HVT U23 ( .A1(addr_B[2]), .B1(ren), .ZN(n1) );
  NR3D0HVT U24 ( .A1(addr_B[1]), .A2(addr_B[0]), .A3(n1), .ZN(n59) );
  IND2D0HVT U25 ( .A1(addr_B[0]), .B1(addr_B[1]), .ZN(n2) );
  NR2D0HVT U26 ( .A1(n1), .A2(n2), .ZN(n58) );
  AOI22D0HVT U27 ( .A1(n59), .A2(\partialAcc[0][0] ), .B1(n58), .B2(
        \partialAcc[2][0] ), .ZN(n9) );
  IND2D0HVT U28 ( .A1(addr_B[1]), .B1(addr_B[0]), .ZN(n3) );
  NR2D0HVT U29 ( .A1(n1), .A2(n3), .ZN(n61) );
  CKND2D0HVT U30 ( .A1(addr_B[1]), .A2(addr_B[0]), .ZN(n5) );
  NR2D0HVT U31 ( .A1(n1), .A2(n5), .ZN(n60) );
  AOI22D0HVT U32 ( .A1(n61), .A2(\partialAcc[1][0] ), .B1(n60), .B2(
        \partialAcc[3][0] ), .ZN(n8) );
  NR3D0HVT U33 ( .A1(addr_B[1]), .A2(addr_B[0]), .A3(n4), .ZN(n63) );
  NR2D0HVT U34 ( .A1(n2), .A2(n4), .ZN(n62) );
  AOI22D0HVT U35 ( .A1(n63), .A2(\partialAcc[4][0] ), .B1(n62), .B2(
        \partialAcc[6][0] ), .ZN(n7) );
  NR2D0HVT U36 ( .A1(n3), .A2(n4), .ZN(n65) );
  NR2D0HVT U37 ( .A1(n5), .A2(n4), .ZN(n64) );
  ND4D0HVT U38 ( .A1(n9), .A2(n8), .A3(n7), .A4(n6), .ZN(data_B[0]) );
  AOI22D0HVT U39 ( .A1(n59), .A2(\partialAcc[0][1] ), .B1(n58), .B2(
        \partialAcc[2][1] ), .ZN(n13) );
  AOI22D0HVT U40 ( .A1(n61), .A2(\partialAcc[1][1] ), .B1(n60), .B2(
        \partialAcc[3][1] ), .ZN(n12) );
  AOI22D0HVT U41 ( .A1(n63), .A2(\partialAcc[4][1] ), .B1(n62), .B2(
        \partialAcc[6][1] ), .ZN(n11) );
  AOI22D0HVT U42 ( .A1(n65), .A2(\partialAcc[5][1] ), .B1(n64), .B2(
        \partialAcc[7][1] ), .ZN(n10) );
  ND4D0HVT U43 ( .A1(n13), .A2(n12), .A3(n11), .A4(n10), .ZN(data_B[1]) );
  AOI22D0HVT U44 ( .A1(n59), .A2(\partialAcc[0][2] ), .B1(n58), .B2(
        \partialAcc[2][2] ), .ZN(n17) );
  AOI22D0HVT U45 ( .A1(n61), .A2(\partialAcc[1][2] ), .B1(n60), .B2(
        \partialAcc[3][2] ), .ZN(n16) );
  AOI22D0HVT U46 ( .A1(n63), .A2(\partialAcc[4][2] ), .B1(n62), .B2(
        \partialAcc[6][2] ), .ZN(n15) );
  AOI22D0HVT U47 ( .A1(n65), .A2(\partialAcc[5][2] ), .B1(n64), .B2(
        \partialAcc[7][2] ), .ZN(n14) );
  ND4D0HVT U48 ( .A1(n17), .A2(n16), .A3(n15), .A4(n14), .ZN(data_B[2]) );
  AOI22D0HVT U49 ( .A1(n59), .A2(\partialAcc[0][3] ), .B1(n58), .B2(
        \partialAcc[2][3] ), .ZN(n21) );
  AOI22D0HVT U50 ( .A1(n61), .A2(\partialAcc[1][3] ), .B1(n60), .B2(
        \partialAcc[3][3] ), .ZN(n20) );
  AOI22D0HVT U51 ( .A1(n63), .A2(\partialAcc[4][3] ), .B1(n62), .B2(
        \partialAcc[6][3] ), .ZN(n19) );
  AOI22D0HVT U52 ( .A1(n65), .A2(\partialAcc[5][3] ), .B1(n64), .B2(
        \partialAcc[7][3] ), .ZN(n18) );
  ND4D0HVT U53 ( .A1(n21), .A2(n20), .A3(n19), .A4(n18), .ZN(data_B[3]) );
  AOI22D0HVT U54 ( .A1(n59), .A2(\partialAcc[0][4] ), .B1(n58), .B2(
        \partialAcc[2][4] ), .ZN(n25) );
  AOI22D0HVT U55 ( .A1(n61), .A2(\partialAcc[1][4] ), .B1(n60), .B2(
        \partialAcc[3][4] ), .ZN(n24) );
  AOI22D0HVT U56 ( .A1(n63), .A2(\partialAcc[4][4] ), .B1(n62), .B2(
        \partialAcc[6][4] ), .ZN(n23) );
  AOI22D0HVT U57 ( .A1(n65), .A2(\partialAcc[5][4] ), .B1(n64), .B2(
        \partialAcc[7][4] ), .ZN(n22) );
  ND4D0HVT U58 ( .A1(n25), .A2(n24), .A3(n23), .A4(n22), .ZN(data_B[4]) );
  AOI22D0HVT U59 ( .A1(n59), .A2(\partialAcc[0][5] ), .B1(n58), .B2(
        \partialAcc[2][5] ), .ZN(n29) );
  AOI22D0HVT U60 ( .A1(n61), .A2(\partialAcc[1][5] ), .B1(n60), .B2(
        \partialAcc[3][5] ), .ZN(n28) );
  AOI22D0HVT U61 ( .A1(n63), .A2(\partialAcc[4][5] ), .B1(n62), .B2(
        \partialAcc[6][5] ), .ZN(n27) );
  AOI22D0HVT U62 ( .A1(n65), .A2(\partialAcc[5][5] ), .B1(n64), .B2(
        \partialAcc[7][5] ), .ZN(n26) );
  ND4D0HVT U63 ( .A1(n29), .A2(n28), .A3(n27), .A4(n26), .ZN(data_B[5]) );
  AOI22D0HVT U64 ( .A1(n59), .A2(\partialAcc[0][6] ), .B1(n58), .B2(
        \partialAcc[2][6] ), .ZN(n33) );
  AOI22D0HVT U65 ( .A1(n61), .A2(\partialAcc[1][6] ), .B1(n60), .B2(
        \partialAcc[3][6] ), .ZN(n32) );
  AOI22D0HVT U66 ( .A1(n63), .A2(\partialAcc[4][6] ), .B1(n62), .B2(
        \partialAcc[6][6] ), .ZN(n31) );
  AOI22D0HVT U67 ( .A1(n65), .A2(\partialAcc[5][6] ), .B1(n64), .B2(
        \partialAcc[7][6] ), .ZN(n30) );
  ND4D0HVT U68 ( .A1(n33), .A2(n32), .A3(n31), .A4(n30), .ZN(data_B[6]) );
  AOI22D0HVT U69 ( .A1(n59), .A2(\partialAcc[0][7] ), .B1(n58), .B2(
        \partialAcc[2][7] ), .ZN(n37) );
  AOI22D0HVT U70 ( .A1(n61), .A2(\partialAcc[1][7] ), .B1(n60), .B2(
        \partialAcc[3][7] ), .ZN(n36) );
  AOI22D0HVT U71 ( .A1(n63), .A2(\partialAcc[4][7] ), .B1(n62), .B2(
        \partialAcc[6][7] ), .ZN(n35) );
  AOI22D0HVT U72 ( .A1(n65), .A2(\partialAcc[5][7] ), .B1(n64), .B2(
        \partialAcc[7][7] ), .ZN(n34) );
  ND4D0HVT U73 ( .A1(n37), .A2(n36), .A3(n35), .A4(n34), .ZN(data_B[7]) );
  AOI22D0HVT U74 ( .A1(n59), .A2(\partialAcc[0][8] ), .B1(n58), .B2(
        \partialAcc[2][8] ), .ZN(n41) );
  AOI22D0HVT U75 ( .A1(n61), .A2(\partialAcc[1][8] ), .B1(n60), .B2(
        \partialAcc[3][8] ), .ZN(n40) );
  AOI22D0HVT U76 ( .A1(n63), .A2(\partialAcc[4][8] ), .B1(n62), .B2(
        \partialAcc[6][8] ), .ZN(n39) );
  AOI22D0HVT U77 ( .A1(n65), .A2(\partialAcc[5][8] ), .B1(n64), .B2(
        \partialAcc[7][8] ), .ZN(n38) );
  ND4D0HVT U78 ( .A1(n41), .A2(n40), .A3(n39), .A4(n38), .ZN(data_B[8]) );
  AOI22D0HVT U79 ( .A1(n59), .A2(\partialAcc[0][9] ), .B1(n58), .B2(
        \partialAcc[2][9] ), .ZN(n45) );
  AOI22D0HVT U80 ( .A1(n61), .A2(\partialAcc[1][9] ), .B1(n60), .B2(
        \partialAcc[3][9] ), .ZN(n44) );
  AOI22D0HVT U81 ( .A1(n63), .A2(\partialAcc[4][9] ), .B1(n62), .B2(
        \partialAcc[6][9] ), .ZN(n43) );
  AOI22D0HVT U82 ( .A1(n65), .A2(\partialAcc[5][9] ), .B1(n64), .B2(
        \partialAcc[7][9] ), .ZN(n42) );
  ND4D0HVT U83 ( .A1(n45), .A2(n44), .A3(n43), .A4(n42), .ZN(data_B[9]) );
  AOI22D0HVT U84 ( .A1(n59), .A2(\partialAcc[0][10] ), .B1(n58), .B2(
        \partialAcc[2][10] ), .ZN(n49) );
  AOI22D0HVT U85 ( .A1(n61), .A2(\partialAcc[1][10] ), .B1(n60), .B2(
        \partialAcc[3][10] ), .ZN(n48) );
  AOI22D0HVT U86 ( .A1(n63), .A2(\partialAcc[4][10] ), .B1(n62), .B2(
        \partialAcc[6][10] ), .ZN(n47) );
  AOI22D0HVT U87 ( .A1(n65), .A2(\partialAcc[5][10] ), .B1(n64), .B2(
        \partialAcc[7][10] ), .ZN(n46) );
  AOI22D0HVT U88 ( .A1(n59), .A2(\partialAcc[0][11] ), .B1(n58), .B2(
        \partialAcc[2][11] ), .ZN(n53) );
  AOI22D0HVT U89 ( .A1(n61), .A2(\partialAcc[1][11] ), .B1(n60), .B2(
        \partialAcc[3][11] ), .ZN(n52) );
  AOI22D0HVT U90 ( .A1(n63), .A2(\partialAcc[4][11] ), .B1(n62), .B2(
        \partialAcc[6][11] ), .ZN(n51) );
  AOI22D0HVT U91 ( .A1(n65), .A2(\partialAcc[5][11] ), .B1(n64), .B2(
        \partialAcc[7][11] ), .ZN(n50) );
  AOI22D0HVT U92 ( .A1(n59), .A2(\partialAcc[0][12] ), .B1(n58), .B2(
        \partialAcc[2][12] ), .ZN(n57) );
  AOI22D0HVT U93 ( .A1(n61), .A2(\partialAcc[1][12] ), .B1(n60), .B2(
        \partialAcc[3][12] ), .ZN(n56) );
  AOI22D0HVT U94 ( .A1(n63), .A2(\partialAcc[4][12] ), .B1(n62), .B2(
        \partialAcc[6][12] ), .ZN(n55) );
  AOI22D0HVT U95 ( .A1(n65), .A2(\partialAcc[5][12] ), .B1(n64), .B2(
        \partialAcc[7][12] ), .ZN(n54) );
  ND4D0HVT U96 ( .A1(n57), .A2(n56), .A3(n55), .A4(n54), .ZN(data_B[12]) );
  AOI22D0HVT U97 ( .A1(n59), .A2(\partialAcc[0][13] ), .B1(n58), .B2(
        \partialAcc[2][13] ), .ZN(n69) );
  AOI22D0HVT U98 ( .A1(n61), .A2(\partialAcc[1][13] ), .B1(n60), .B2(
        \partialAcc[3][13] ), .ZN(n68) );
  AOI22D0HVT U99 ( .A1(n63), .A2(\partialAcc[4][13] ), .B1(n62), .B2(
        \partialAcc[6][13] ), .ZN(n67) );
  ND4D0HVT U100 ( .A1(n69), .A2(n68), .A3(n67), .A4(n66), .ZN(data_B[13]) );
  IND3D0HVT U101 ( .A1(addr_A[0]), .B1(en), .B2(wen), .ZN(n70) );
  INVD0HVT U102 ( .I(addr_A[2]), .ZN(n74) );
  INVD0HVT U103 ( .I(addr_A[1]), .ZN(n73) );
  IND3D0HVT U104 ( .A1(wen), .B1(en), .B2(reset), .ZN(n71) );
  OAI31D0HVT U105 ( .A1(n70), .A2(n74), .A3(n73), .B(n71), .ZN(N56) );
  OAI31D0HVT U106 ( .A1(addr_A[2]), .A2(n70), .A3(n73), .B(n71), .ZN(N52) );
  OAI31D0HVT U107 ( .A1(addr_A[1]), .A2(n70), .A3(n74), .B(n71), .ZN(N54) );
  ND3D0HVT U108 ( .A1(wen), .A2(en), .A3(addr_A[0]), .ZN(n72) );
  OAI31D0HVT U109 ( .A1(addr_A[1]), .A2(n74), .A3(n72), .B(n71), .ZN(N55) );
  OAI31D0HVT U110 ( .A1(addr_A[2]), .A2(n73), .A3(n72), .B(n71), .ZN(N53) );
  OAI31D0HVT U111 ( .A1(addr_A[2]), .A2(addr_A[1]), .A3(n72), .B(n71), .ZN(N51) );
  OAI31D0HVT U112 ( .A1(addr_A[2]), .A2(addr_A[1]), .A3(n70), .B(n71), .ZN(N50) );
  OAI31D0HVT U113 ( .A1(n74), .A2(n73), .A3(n72), .B(n71), .ZN(N57) );
endmodule


module ADDER ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [13:0] ADD_OP_A;
  input [13:0] ADD_OP_B;
  output [13:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_1/CI , \intadd_1/SUM[5] , \intadd_1/SUM[4] ,
         \intadd_1/SUM[3] , \intadd_1/SUM[2] , \intadd_1/SUM[1] ,
         \intadd_1/SUM[0] , \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;

  FA1D0HVT \intadd_1/U7  ( .A(ADD_OP_B[2]), .B(ADD_OP_A[2]), .CI(\intadd_1/CI ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U6  ( .A(ADD_OP_B[3]), .B(ADD_OP_A[3]), .CI(\intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[1] ) );
  FA1D0HVT \intadd_1/U5  ( .A(ADD_OP_B[4]), .B(ADD_OP_A[4]), .CI(\intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[2] ) );
  FA1D0HVT \intadd_1/U4  ( .A(ADD_OP_B[5]), .B(ADD_OP_A[5]), .CI(\intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[3] ) );
  FA1D0HVT \intadd_1/U3  ( .A(ADD_OP_B[6]), .B(ADD_OP_A[6]), .CI(\intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[4] ) );
  FA1D0HVT \intadd_1/U2  ( .A(ADD_OP_B[7]), .B(ADD_OP_A[7]), .CI(\intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[5] ) );
  CKAN2D0HVT U2 ( .A1(\intadd_1/SUM[0] ), .A2(ADD_EN), .Z(ADD_RESULT[2]) );
  CKAN2D0HVT U3 ( .A1(\intadd_1/SUM[1] ), .A2(ADD_EN), .Z(ADD_RESULT[3]) );
  CKAN2D0HVT U4 ( .A1(\intadd_1/SUM[2] ), .A2(ADD_EN), .Z(ADD_RESULT[4]) );
  CKAN2D0HVT U5 ( .A1(\intadd_1/SUM[3] ), .A2(ADD_EN), .Z(ADD_RESULT[5]) );
  CKAN2D0HVT U6 ( .A1(\intadd_1/SUM[4] ), .A2(ADD_EN), .Z(ADD_RESULT[6]) );
  CKAN2D0HVT U7 ( .A1(\intadd_1/SUM[5] ), .A2(ADD_EN), .Z(ADD_RESULT[7]) );
  INVD0HVT U8 ( .I(ADD_OP_B[12]), .ZN(n27) );
  AO31D0HVT U9 ( .A1(\intadd_1/n1 ), .A2(ADD_OP_A[8]), .A3(ADD_OP_A[9]), .B(
        ADD_OP_B[12]), .Z(n11) );
  AOI21D0HVT U10 ( .A1(ADD_OP_A[10]), .A2(n11), .B(ADD_OP_B[12]), .ZN(n17) );
  INR2D0HVT U11 ( .A1(ADD_OP_A[11]), .B1(n17), .ZN(n1) );
  NR3D0HVT U12 ( .A1(ADD_OP_A[9]), .A2(\intadd_1/n1 ), .A3(ADD_OP_A[8]), .ZN(
        n12) );
  INVD0HVT U13 ( .I(ADD_OP_A[10]), .ZN(n15) );
  AOI21D0HVT U14 ( .A1(n12), .A2(n15), .B(n27), .ZN(n16) );
  NR2D0HVT U15 ( .A1(n1), .A2(n16), .ZN(n24) );
  INVD0HVT U16 ( .I(ADD_EN), .ZN(n25) );
  AO221D0HVT U17 ( .A1(n27), .A2(n1), .B1(ADD_OP_B[12]), .B2(n24), .C(n25), 
        .Z(n3) );
  OAI221D0HVT U18 ( .A1(ADD_OP_B[12]), .A2(n1), .B1(n27), .B2(n24), .C(ADD_EN), 
        .ZN(n2) );
  INVD0HVT U19 ( .I(ADD_OP_A[12]), .ZN(n23) );
  AOI22D0HVT U20 ( .A1(ADD_OP_A[12]), .A2(n3), .B1(n2), .B2(n23), .ZN(
        ADD_RESULT[12]) );
  CKND2D0HVT U21 ( .A1(ADD_OP_A[0]), .A2(ADD_OP_B[0]), .ZN(n22) );
  OA211D0HVT U22 ( .A1(ADD_OP_A[0]), .A2(ADD_OP_B[0]), .B(ADD_EN), .C(n22), 
        .Z(ADD_RESULT[0]) );
  INVD0HVT U23 ( .I(ADD_OP_A[1]), .ZN(n20) );
  MUX2ND0HVT U24 ( .I0(ADD_OP_A[1]), .I1(n20), .S(ADD_OP_B[1]), .ZN(n5) );
  NR2D0HVT U25 ( .A1(n22), .A2(n5), .ZN(n4) );
  AOI211D0HVT U26 ( .A1(n22), .A2(n5), .B(n25), .C(n4), .ZN(ADD_RESULT[1]) );
  MUX2ND0HVT U27 ( .I0(n27), .I1(ADD_OP_B[12]), .S(\intadd_1/n1 ), .ZN(n7) );
  NR2D0HVT U28 ( .A1(ADD_OP_A[8]), .A2(n7), .ZN(n6) );
  AOI211D0HVT U29 ( .A1(ADD_OP_A[8]), .A2(n7), .B(n25), .C(n6), .ZN(
        ADD_RESULT[8]) );
  AOI21D0HVT U30 ( .A1(\intadd_1/n1 ), .A2(ADD_OP_A[8]), .B(ADD_OP_B[12]), 
        .ZN(n8) );
  AOI221D0HVT U31 ( .A1(\intadd_1/n1 ), .A2(ADD_OP_B[12]), .B1(ADD_OP_A[8]), 
        .B2(ADD_OP_B[12]), .C(n8), .ZN(n10) );
  NR2D0HVT U32 ( .A1(ADD_OP_A[9]), .A2(n10), .ZN(n9) );
  AOI211D0HVT U33 ( .A1(ADD_OP_A[9]), .A2(n10), .B(n25), .C(n9), .ZN(
        ADD_RESULT[9]) );
  OAI21D0HVT U34 ( .A1(n12), .A2(n27), .B(n11), .ZN(n14) );
  NR2D0HVT U35 ( .A1(n15), .A2(n14), .ZN(n13) );
  AOI211D0HVT U36 ( .A1(n15), .A2(n14), .B(n25), .C(n13), .ZN(ADD_RESULT[10])
         );
  NR2D0HVT U37 ( .A1(n17), .A2(n16), .ZN(n19) );
  NR2D0HVT U38 ( .A1(ADD_OP_A[11]), .A2(n19), .ZN(n18) );
  AOI211D0HVT U39 ( .A1(ADD_OP_A[11]), .A2(n19), .B(n25), .C(n18), .ZN(
        ADD_RESULT[11]) );
  INVD0HVT U40 ( .I(ADD_OP_B[1]), .ZN(n21) );
  MAOI222D0HVT U41 ( .A(n22), .B(n21), .C(n20), .ZN(\intadd_1/CI ) );
  IND2D0HVT U42 ( .A1(n24), .B1(ADD_OP_A[12]), .ZN(n28) );
  CKND2D0HVT U43 ( .A1(n24), .A2(n23), .ZN(n26) );
  AO221D0HVT U44 ( .A1(n27), .A2(n28), .B1(ADD_OP_B[12]), .B2(n26), .C(n25), 
        .Z(n30) );
  OAI221D0HVT U45 ( .A1(ADD_OP_B[12]), .A2(n28), .B1(n27), .B2(n26), .C(ADD_EN), .ZN(n29) );
  MUX2ND0HVT U46 ( .I0(n30), .I1(n29), .S(ADD_OP_A[13]), .ZN(ADD_RESULT[13])
         );
endmodule


module MULTIPLIER ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [13:0] MUL_OP_A;
  input [3:0] MUL_OP_B;
  output [17:0] MUL_RESULT;
  input MUL_EN;
  wire   \intadd_2/A[13] , \intadd_2/A[12] , \intadd_2/A[11] ,
         \intadd_2/A[10] , \intadd_2/A[9] , \intadd_2/A[8] , \intadd_2/A[7] ,
         \intadd_2/A[6] , \intadd_2/A[5] , \intadd_2/A[4] , \intadd_2/A[3] ,
         \intadd_2/A[2] , \intadd_2/A[1] , \intadd_2/A[0] , \intadd_2/B[13] ,
         \intadd_2/B[12] , \intadd_2/B[11] , \intadd_2/B[10] , \intadd_2/B[9] ,
         \intadd_2/B[8] , \intadd_2/B[7] , \intadd_2/B[6] , \intadd_2/B[5] ,
         \intadd_2/B[4] , \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] ,
         \intadd_2/B[0] , \intadd_2/CI , \intadd_2/SUM[13] ,
         \intadd_2/SUM[12] , \intadd_2/SUM[11] , \intadd_2/SUM[10] ,
         \intadd_2/SUM[9] , \intadd_2/SUM[8] , \intadd_2/SUM[7] ,
         \intadd_2/SUM[6] , \intadd_2/SUM[5] , \intadd_2/SUM[4] ,
         \intadd_2/SUM[3] , \intadd_2/SUM[2] , \intadd_2/SUM[1] ,
         \intadd_2/SUM[0] , \intadd_2/n14 , \intadd_2/n13 , \intadd_2/n12 ,
         \intadd_2/n11 , \intadd_2/n10 , \intadd_2/n9 , \intadd_2/n8 ,
         \intadd_2/n7 , \intadd_2/n6 , \intadd_2/n5 , \intadd_2/n4 ,
         \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87;
  assign MUL_RESULT[17] = \intadd_2/n1 ;

  FA1D0HVT \intadd_2/U15  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n14 ), .S(\intadd_2/SUM[0] ) );
  FA1D0HVT \intadd_2/U14  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n14 ), .CO(\intadd_2/n13 ), .S(\intadd_2/SUM[1] ) );
  FA1D0HVT \intadd_2/U13  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n13 ), .CO(\intadd_2/n12 ), .S(\intadd_2/SUM[2] ) );
  FA1D0HVT \intadd_2/U12  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n12 ), .CO(\intadd_2/n11 ), .S(\intadd_2/SUM[3] ) );
  FA1D0HVT \intadd_2/U11  ( .A(\intadd_2/A[4] ), .B(\intadd_2/B[4] ), .CI(
        \intadd_2/n11 ), .CO(\intadd_2/n10 ), .S(\intadd_2/SUM[4] ) );
  FA1D0HVT \intadd_2/U10  ( .A(\intadd_2/A[5] ), .B(\intadd_2/B[5] ), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(\intadd_2/SUM[5] ) );
  FA1D0HVT \intadd_2/U9  ( .A(\intadd_2/A[6] ), .B(\intadd_2/B[6] ), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(\intadd_2/SUM[6] ) );
  FA1D0HVT \intadd_2/U8  ( .A(\intadd_2/A[7] ), .B(\intadd_2/B[7] ), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(\intadd_2/SUM[7] ) );
  FA1D0HVT \intadd_2/U7  ( .A(\intadd_2/A[8] ), .B(\intadd_2/B[8] ), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(\intadd_2/SUM[8] ) );
  FA1D0HVT \intadd_2/U6  ( .A(\intadd_2/A[9] ), .B(\intadd_2/B[9] ), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(\intadd_2/SUM[9] ) );
  FA1D0HVT \intadd_2/U5  ( .A(\intadd_2/A[10] ), .B(\intadd_2/B[10] ), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[10] ) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[11] ), .B(\intadd_2/B[11] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(\intadd_2/SUM[11] ) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[12] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(\intadd_2/SUM[12] ) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[13] ), .B(\intadd_2/B[13] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(\intadd_2/SUM[13] ) );
  CKAN2D0HVT U2 ( .A1(n46), .A2(n72), .Z(n1) );
  CKND2D0HVT U3 ( .A1(n1), .A2(n14), .ZN(n13) );
  CKND2D0HVT U4 ( .A1(n1), .A2(n29), .ZN(n28) );
  OAI22D0HVT U5 ( .A1(n78), .A2(n12), .B1(n79), .B2(n15), .ZN(n51) );
  OAI22D0HVT U6 ( .A1(n78), .A2(n36), .B1(n79), .B2(n39), .ZN(n67) );
  CKND2D0HVT U7 ( .A1(n61), .A2(n62), .ZN(\intadd_2/B[7] ) );
  INVD0HVT U8 ( .I(\intadd_2/A[12] ), .ZN(\intadd_2/B[13] ) );
  INVD0HVT U9 ( .I(\intadd_2/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U10 ( .I(\intadd_2/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U11 ( .I(\intadd_2/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U12 ( .I(\intadd_2/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U13 ( .I(\intadd_2/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U14 ( .I(\intadd_2/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U15 ( .I(\intadd_2/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U16 ( .I(\intadd_2/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U17 ( .I(\intadd_2/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U18 ( .I(\intadd_2/SUM[9] ), .ZN(MUL_RESULT[12]) );
  INVD0HVT U19 ( .I(\intadd_2/SUM[10] ), .ZN(MUL_RESULT[13]) );
  INVD0HVT U20 ( .I(\intadd_2/SUM[11] ), .ZN(MUL_RESULT[14]) );
  INVD0HVT U21 ( .I(\intadd_2/SUM[12] ), .ZN(MUL_RESULT[15]) );
  INVD0HVT U22 ( .I(\intadd_2/SUM[13] ), .ZN(MUL_RESULT[16]) );
  ND3D0HVT U23 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .A3(MUL_OP_B[1]), .ZN(n80) );
  INVD0HVT U24 ( .I(MUL_OP_A[2]), .ZN(n11) );
  CKND2D0HVT U25 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n46) );
  CKND2D0HVT U26 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n86) );
  INVD0HVT U27 ( .I(n86), .ZN(n72) );
  NR2D0HVT U28 ( .A1(n46), .A2(n72), .ZN(n81) );
  INVD0HVT U29 ( .I(n81), .ZN(n41) );
  INVD0HVT U30 ( .I(MUL_OP_A[1]), .ZN(n83) );
  CKND2D0HVT U31 ( .A1(n1), .A2(n83), .ZN(n2) );
  OAI221D0HVT U32 ( .A1(MUL_OP_A[2]), .A2(n80), .B1(n11), .B2(n41), .C(n2), 
        .ZN(n47) );
  CKND2D0HVT U33 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n7) );
  NR2D0HVT U34 ( .A1(n72), .A2(n7), .ZN(n4) );
  INVD0HVT U35 ( .I(n7), .ZN(n8) );
  NR2D0HVT U36 ( .A1(n8), .A2(n86), .ZN(n3) );
  NR2D0HVT U37 ( .A1(n4), .A2(n3), .ZN(n79) );
  INVD0HVT U38 ( .I(MUL_OP_A[0]), .ZN(n45) );
  OAI211D0HVT U39 ( .A1(n46), .A2(n83), .B(n72), .C(n45), .ZN(n84) );
  OAI21D0HVT U40 ( .A1(n79), .A2(n45), .B(n84), .ZN(n48) );
  CKND2D0HVT U41 ( .A1(n47), .A2(n48), .ZN(\intadd_2/CI ) );
  CKND2D0HVT U42 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n44) );
  INVD0HVT U43 ( .I(n44), .ZN(n43) );
  INVD0HVT U44 ( .I(n79), .ZN(n6) );
  NR3D0HVT U45 ( .A1(n72), .A2(n8), .A3(n44), .ZN(n5) );
  AOI31D0HVT U46 ( .A1(n43), .A2(n45), .A3(n6), .B(n5), .ZN(\intadd_2/B[0] )
         );
  AOI33D0HVT U47 ( .A1(n72), .A2(n8), .A3(n44), .B1(n43), .B2(n7), .B3(n86), 
        .ZN(n78) );
  AOI22D0HVT U48 ( .A1(MUL_OP_A[0]), .A2(n44), .B1(n43), .B2(n45), .ZN(n9) );
  AOI22D0HVT U49 ( .A1(MUL_OP_A[1]), .A2(n44), .B1(n43), .B2(n83), .ZN(n12) );
  OAI22D0HVT U50 ( .A1(n78), .A2(n9), .B1(n79), .B2(n12), .ZN(n49) );
  INVD0HVT U51 ( .I(MUL_OP_A[3]), .ZN(n14) );
  CKND2D0HVT U52 ( .A1(n1), .A2(n11), .ZN(n10) );
  OAI221D0HVT U53 ( .A1(MUL_OP_A[3]), .A2(n80), .B1(n14), .B2(n41), .C(n10), 
        .ZN(n50) );
  CKND2D0HVT U54 ( .A1(n49), .A2(n50), .ZN(\intadd_2/B[1] ) );
  AOI22D0HVT U55 ( .A1(MUL_OP_A[2]), .A2(n44), .B1(n43), .B2(n11), .ZN(n15) );
  INVD0HVT U56 ( .I(MUL_OP_A[4]), .ZN(n17) );
  OAI221D0HVT U57 ( .A1(MUL_OP_A[4]), .A2(n80), .B1(n17), .B2(n41), .C(n13), 
        .ZN(n52) );
  CKND2D0HVT U58 ( .A1(n51), .A2(n52), .ZN(\intadd_2/B[2] ) );
  AOI22D0HVT U59 ( .A1(n43), .A2(n14), .B1(MUL_OP_A[3]), .B2(n44), .ZN(n18) );
  OAI22D0HVT U60 ( .A1(n78), .A2(n15), .B1(n79), .B2(n18), .ZN(n53) );
  INVD0HVT U61 ( .I(MUL_OP_A[5]), .ZN(n20) );
  CKND2D0HVT U62 ( .A1(n1), .A2(n17), .ZN(n16) );
  OAI221D0HVT U63 ( .A1(MUL_OP_A[5]), .A2(n80), .B1(n20), .B2(n41), .C(n16), 
        .ZN(n54) );
  CKND2D0HVT U64 ( .A1(n53), .A2(n54), .ZN(\intadd_2/B[3] ) );
  AOI22D0HVT U65 ( .A1(n43), .A2(n17), .B1(MUL_OP_A[4]), .B2(n44), .ZN(n21) );
  OAI22D0HVT U66 ( .A1(n78), .A2(n18), .B1(n79), .B2(n21), .ZN(n55) );
  INVD0HVT U67 ( .I(MUL_OP_A[6]), .ZN(n23) );
  CKND2D0HVT U68 ( .A1(n1), .A2(n20), .ZN(n19) );
  OAI221D0HVT U69 ( .A1(MUL_OP_A[6]), .A2(n80), .B1(n23), .B2(n41), .C(n19), 
        .ZN(n56) );
  CKND2D0HVT U70 ( .A1(n55), .A2(n56), .ZN(\intadd_2/B[4] ) );
  AOI22D0HVT U71 ( .A1(n43), .A2(n20), .B1(MUL_OP_A[5]), .B2(n44), .ZN(n24) );
  OAI22D0HVT U72 ( .A1(n78), .A2(n21), .B1(n79), .B2(n24), .ZN(n57) );
  INVD0HVT U73 ( .I(MUL_OP_A[7]), .ZN(n26) );
  CKND2D0HVT U74 ( .A1(n1), .A2(n23), .ZN(n22) );
  OAI221D0HVT U75 ( .A1(MUL_OP_A[7]), .A2(n80), .B1(n26), .B2(n41), .C(n22), 
        .ZN(n58) );
  CKND2D0HVT U76 ( .A1(n57), .A2(n58), .ZN(\intadd_2/B[5] ) );
  AOI22D0HVT U77 ( .A1(n43), .A2(n23), .B1(MUL_OP_A[6]), .B2(n44), .ZN(n27) );
  OAI22D0HVT U78 ( .A1(n78), .A2(n24), .B1(n79), .B2(n27), .ZN(n59) );
  INVD0HVT U79 ( .I(MUL_OP_A[8]), .ZN(n29) );
  CKND2D0HVT U80 ( .A1(n1), .A2(n26), .ZN(n25) );
  OAI221D0HVT U81 ( .A1(MUL_OP_A[8]), .A2(n80), .B1(n29), .B2(n41), .C(n25), 
        .ZN(n60) );
  CKND2D0HVT U82 ( .A1(n59), .A2(n60), .ZN(\intadd_2/B[6] ) );
  AOI22D0HVT U83 ( .A1(n43), .A2(n26), .B1(MUL_OP_A[7]), .B2(n44), .ZN(n30) );
  OAI22D0HVT U84 ( .A1(n78), .A2(n27), .B1(n79), .B2(n30), .ZN(n61) );
  INVD0HVT U85 ( .I(MUL_OP_A[9]), .ZN(n32) );
  OAI221D0HVT U86 ( .A1(MUL_OP_A[9]), .A2(n80), .B1(n32), .B2(n41), .C(n28), 
        .ZN(n62) );
  AOI22D0HVT U87 ( .A1(n43), .A2(n29), .B1(MUL_OP_A[8]), .B2(n44), .ZN(n33) );
  OAI22D0HVT U88 ( .A1(n78), .A2(n30), .B1(n79), .B2(n33), .ZN(n63) );
  INVD0HVT U89 ( .I(MUL_OP_A[10]), .ZN(n35) );
  CKND2D0HVT U90 ( .A1(n1), .A2(n32), .ZN(n31) );
  OAI221D0HVT U91 ( .A1(MUL_OP_A[10]), .A2(n80), .B1(n35), .B2(n41), .C(n31), 
        .ZN(n64) );
  CKND2D0HVT U92 ( .A1(n63), .A2(n64), .ZN(\intadd_2/B[8] ) );
  AOI22D0HVT U93 ( .A1(n43), .A2(n32), .B1(MUL_OP_A[9]), .B2(n44), .ZN(n36) );
  OAI22D0HVT U94 ( .A1(n78), .A2(n33), .B1(n79), .B2(n36), .ZN(n65) );
  INVD0HVT U95 ( .I(MUL_OP_A[11]), .ZN(n38) );
  CKND2D0HVT U96 ( .A1(n1), .A2(n35), .ZN(n34) );
  OAI221D0HVT U97 ( .A1(MUL_OP_A[11]), .A2(n80), .B1(n38), .B2(n41), .C(n34), 
        .ZN(n66) );
  CKND2D0HVT U98 ( .A1(n65), .A2(n66), .ZN(\intadd_2/B[9] ) );
  AOI22D0HVT U99 ( .A1(n43), .A2(n35), .B1(MUL_OP_A[10]), .B2(n44), .ZN(n39)
         );
  INVD0HVT U100 ( .I(MUL_OP_A[12]), .ZN(n42) );
  CKND2D0HVT U101 ( .A1(n1), .A2(n38), .ZN(n37) );
  OAI221D0HVT U102 ( .A1(MUL_OP_A[12]), .A2(n80), .B1(n42), .B2(n41), .C(n37), 
        .ZN(n68) );
  CKND2D0HVT U103 ( .A1(n67), .A2(n68), .ZN(\intadd_2/B[10] ) );
  AOI22D0HVT U104 ( .A1(n43), .A2(n38), .B1(MUL_OP_A[11]), .B2(n44), .ZN(n74)
         );
  OAI22D0HVT U105 ( .A1(n78), .A2(n39), .B1(n79), .B2(n74), .ZN(n69) );
  INVD0HVT U106 ( .I(MUL_OP_A[13]), .ZN(n71) );
  CKND2D0HVT U107 ( .A1(n1), .A2(n42), .ZN(n40) );
  OAI221D0HVT U108 ( .A1(MUL_OP_A[13]), .A2(n80), .B1(n71), .B2(n41), .C(n40), 
        .ZN(n70) );
  CKND2D0HVT U109 ( .A1(n69), .A2(n70), .ZN(\intadd_2/B[11] ) );
  AOI22D0HVT U110 ( .A1(n43), .A2(n42), .B1(MUL_OP_A[12]), .B2(n44), .ZN(n73)
         );
  AOI22D0HVT U111 ( .A1(MUL_OP_A[13]), .A2(n44), .B1(n43), .B2(n71), .ZN(n77)
         );
  OAI22D0HVT U112 ( .A1(n78), .A2(n73), .B1(n79), .B2(n77), .ZN(
        \intadd_2/A[12] ) );
  NR2D0HVT U113 ( .A1(n46), .A2(n45), .ZN(MUL_RESULT[0]) );
  OA21D0HVT U114 ( .A1(n48), .A2(n47), .B(\intadd_2/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U115 ( .A1(n50), .A2(n49), .B(\intadd_2/B[1] ), .ZN(
        \intadd_2/A[0] ) );
  OAI21D0HVT U116 ( .A1(n52), .A2(n51), .B(\intadd_2/B[2] ), .ZN(
        \intadd_2/A[1] ) );
  OAI21D0HVT U117 ( .A1(n54), .A2(n53), .B(\intadd_2/B[3] ), .ZN(
        \intadd_2/A[2] ) );
  OAI21D0HVT U118 ( .A1(n56), .A2(n55), .B(\intadd_2/B[4] ), .ZN(
        \intadd_2/A[3] ) );
  OAI21D0HVT U119 ( .A1(n58), .A2(n57), .B(\intadd_2/B[5] ), .ZN(
        \intadd_2/A[4] ) );
  OAI21D0HVT U120 ( .A1(n60), .A2(n59), .B(\intadd_2/B[6] ), .ZN(
        \intadd_2/A[5] ) );
  OAI21D0HVT U121 ( .A1(n62), .A2(n61), .B(\intadd_2/B[7] ), .ZN(
        \intadd_2/A[6] ) );
  OAI21D0HVT U122 ( .A1(n64), .A2(n63), .B(\intadd_2/B[8] ), .ZN(
        \intadd_2/A[7] ) );
  OAI21D0HVT U123 ( .A1(n66), .A2(n65), .B(\intadd_2/B[9] ), .ZN(
        \intadd_2/A[8] ) );
  OAI21D0HVT U124 ( .A1(n68), .A2(n67), .B(\intadd_2/B[10] ), .ZN(
        \intadd_2/A[9] ) );
  OAI21D0HVT U125 ( .A1(n70), .A2(n69), .B(\intadd_2/B[11] ), .ZN(
        \intadd_2/A[10] ) );
  AOI22D0HVT U126 ( .A1(MUL_OP_A[13]), .A2(n81), .B1(n72), .B2(n71), .ZN(n76)
         );
  OAI22D0HVT U127 ( .A1(n78), .A2(n74), .B1(n79), .B2(n73), .ZN(n75) );
  NR2D0HVT U128 ( .A1(n76), .A2(n75), .ZN(\intadd_2/B[12] ) );
  AOI21D0HVT U129 ( .A1(n76), .A2(n75), .B(\intadd_2/B[12] ), .ZN(
        \intadd_2/A[11] ) );
  AOI21D0HVT U130 ( .A1(n79), .A2(n78), .B(n77), .ZN(\intadd_2/A[13] ) );
  INVD0HVT U131 ( .I(n80), .ZN(n82) );
  AOI22D0HVT U132 ( .A1(n83), .A2(n82), .B1(MUL_OP_A[1]), .B2(n81), .ZN(n87)
         );
  INVD0HVT U133 ( .I(n84), .ZN(n85) );
  AOI221D0HVT U134 ( .A1(MUL_RESULT[0]), .A2(n87), .B1(n86), .B2(n87), .C(n85), 
        .ZN(MUL_RESULT[1]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v1_8 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module newMAC_v1 ( clk, rst_n, en, data_valid, weight, activation, reset, acc, 
        output_valid, output_result );
  input [3:0] weight;
  input [7:0] activation;
  output [20:0] output_result;
  input clk, rst_n, en, data_valid, reset, acc;
  output output_valid;
  wire   zero_flag, update_Flag, N78, \MUL_CNT_PLUS_1[3] , N168, N169, N170,
         N171, N172, N173, N174, N175, N176, N177, N178, N179, N180, N181,
         N182, N183, N184, N185, N186, N187, N188, N189, ren_IS, net145, n30,
         n31, n32, \intadd_0/A[16] , \intadd_0/A[15] , \intadd_0/A[14] ,
         \intadd_0/A[13] , \intadd_0/A[12] , \intadd_0/A[11] ,
         \intadd_0/A[10] , \intadd_0/A[9] , \intadd_0/A[8] , \intadd_0/A[7] ,
         \intadd_0/A[6] , \intadd_0/A[5] , \intadd_0/A[4] , \intadd_0/A[3] ,
         \intadd_0/A[2] , \intadd_0/A[1] , \intadd_0/A[0] , \intadd_0/B[18] ,
         \intadd_0/B[17] , \intadd_0/B[16] , \intadd_0/B[15] ,
         \intadd_0/B[14] , \intadd_0/B[13] , \intadd_0/B[12] ,
         \intadd_0/B[11] , \intadd_0/B[10] , \intadd_0/B[9] , \intadd_0/B[8] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/n19 , \intadd_0/n18 , \intadd_0/n17 ,
         \intadd_0/n16 , \intadd_0/n15 , \intadd_0/n14 , \intadd_0/n13 ,
         \intadd_0/n12 , \intadd_0/n11 , \intadd_0/n10 , \intadd_0/n9 ,
         \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [2:0] index;
  wire   [13:0] ADD_OP_A;
  wire   [13:0] ADD_OP_B;
  wire   [13:0] data_A_READ_DATA;
  wire   [2:0] MUL_CNT;
  wire   [17:0] MUL_RESULT;
  wire   [2:0] addr_B_IS;
  assign N78 = activation[0];

  indexGen u_indexGen ( .data_valid(data_valid), .weight(weight), .activation(
        {activation[7:1], N78}), .index(index), .zero(zero_flag) );
  internalStorage u_internalStorage ( .clk(clk), .rst_n(rst_n), .en(en), 
        .reset(reset), .wen(update_Flag), .addr_A(index), .data_A(
        data_A_READ_DATA), .ren(ren_IS), .addr_B(addr_B_IS), .data_B(ADD_OP_A)
         );
  ADDER u_ADDER ( .ADD_EN(update_Flag), .ADD_OP_A(ADD_OP_A), .ADD_OP_B({1'b0, 
        ADD_OP_B[13], 1'b0, 1'b0, 1'b0, 1'b0, ADD_OP_B[7:0]}), .ADD_RESULT(
        data_A_READ_DATA) );
  MULTIPLIER u_MULTIPLIER ( .MUL_EN(n71), .MUL_OP_A(ADD_OP_A), .MUL_OP_B({
        \MUL_CNT_PLUS_1[3] , n31, n30, n32}), .MUL_RESULT(MUL_RESULT) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v1_8 clk_gate_output_result_reg ( .CLK(clk), 
        .EN(N189), .ENCLK(net145), .TE(n34) );
  DFCNQD1HVT \MUL_CNT_reg[0]  ( .D(n32), .CP(net145), .CDN(rst_n), .Q(
        MUL_CNT[0]) );
  DFCNQD1HVT \MUL_CNT_reg[1]  ( .D(n30), .CP(net145), .CDN(rst_n), .Q(
        MUL_CNT[1]) );
  DFCNQD1HVT \MUL_CNT_reg[2]  ( .D(n31), .CP(net145), .CDN(rst_n), .Q(
        MUL_CNT[2]) );
  FA1D0HVT \intadd_0/U20  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n19 ), .S(N169) );
  FA1D0HVT \intadd_0/U19  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n19 ), .CO(\intadd_0/n18 ), .S(N170) );
  FA1D0HVT \intadd_0/U18  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n18 ), .CO(\intadd_0/n17 ), .S(N171) );
  FA1D0HVT \intadd_0/U17  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n17 ), .CO(\intadd_0/n16 ), .S(N172) );
  FA1D0HVT \intadd_0/U16  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n16 ), .CO(\intadd_0/n15 ), .S(N173) );
  FA1D0HVT \intadd_0/U15  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n15 ), .CO(\intadd_0/n14 ), .S(N174) );
  FA1D0HVT \intadd_0/U14  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n14 ), .CO(\intadd_0/n13 ), .S(N175) );
  FA1D0HVT \intadd_0/U13  ( .A(\intadd_0/A[7] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n13 ), .CO(\intadd_0/n12 ), .S(N176) );
  FA1D0HVT \intadd_0/U12  ( .A(\intadd_0/A[8] ), .B(\intadd_0/B[8] ), .CI(
        \intadd_0/n12 ), .CO(\intadd_0/n11 ), .S(N177) );
  FA1D0HVT \intadd_0/U11  ( .A(\intadd_0/A[9] ), .B(\intadd_0/B[9] ), .CI(
        \intadd_0/n11 ), .CO(\intadd_0/n10 ), .S(N178) );
  FA1D0HVT \intadd_0/U10  ( .A(\intadd_0/A[10] ), .B(\intadd_0/B[10] ), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(N179) );
  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[11] ), .B(\intadd_0/B[11] ), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(N180) );
  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[12] ), .B(\intadd_0/B[12] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(N181) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[13] ), .B(\intadd_0/B[13] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(N182) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/A[14] ), .B(\intadd_0/B[14] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(N183) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/A[15] ), .B(\intadd_0/B[15] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(N184) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/A[16] ), .B(\intadd_0/B[16] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(N185) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/A[16] ), .B(\intadd_0/B[17] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(N186) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[16] ), .B(\intadd_0/B[18] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(N187) );
  DFCNQD1HVT output_valid_reg ( .D(\MUL_CNT_PLUS_1[3] ), .CP(net145), .CDN(
        rst_n), .Q(output_valid) );
  DFCNQD1HVT \output_result_reg[19]  ( .D(N187), .CP(net145), .CDN(rst_n), .Q(
        output_result[19]) );
  DFCNQD1HVT \output_result_reg[18]  ( .D(N186), .CP(net145), .CDN(rst_n), .Q(
        output_result[18]) );
  DFCNQD1HVT \output_result_reg[17]  ( .D(N185), .CP(net145), .CDN(rst_n), .Q(
        output_result[17]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N184), .CP(net145), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[20]  ( .D(N188), .CP(net145), .CDN(rst_n), .Q(
        output_result[20]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N183), .CP(net145), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N182), .CP(net145), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N181), .CP(net145), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N180), .CP(net145), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N179), .CP(net145), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N178), .CP(net145), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N177), .CP(net145), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N176), .CP(net145), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N175), .CP(net145), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N174), .CP(net145), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N173), .CP(net145), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N172), .CP(net145), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N171), .CP(net145), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N170), .CP(net145), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N169), .CP(net145), .CDN(rst_n), .Q(
        output_result[1]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N168), .CP(net145), .CDN(rst_n), .Q(
        output_result[0]) );
  TIELHVT U113 ( .ZN(n34) );
  CKND2D0HVT U114 ( .A1(n52), .A2(n56), .ZN(ren_IS) );
  CKND2D0HVT U115 ( .A1(n66), .A2(n43), .ZN(n46) );
  INVD0HVT U116 ( .I(n58), .ZN(n57) );
  INVD0HVT U117 ( .I(activation[1]), .ZN(n60) );
  OR2D0HVT U118 ( .A1(n65), .A2(n59), .Z(n64) );
  CKND2D0HVT U119 ( .A1(n59), .A2(n41), .ZN(n69) );
  INVD0HVT U120 ( .I(n68), .ZN(n48) );
  CKND2D0HVT U121 ( .A1(output_result[0]), .A2(MUL_RESULT[0]), .ZN(n51) );
  CKAN2D0HVT U122 ( .A1(MUL_RESULT[6]), .A2(n71), .Z(\intadd_0/B[5] ) );
  NR4D0HVT U123 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .A3(MUL_CNT[2]), .A4(acc), 
        .ZN(n35) );
  BUFFD0HVT U124 ( .I(n35), .Z(n52) );
  INVD0HVT U125 ( .I(n52), .ZN(n71) );
  IND2D0HVT U126 ( .A1(zero_flag), .B1(data_valid), .ZN(n56) );
  INVD0HVT U127 ( .I(n56), .ZN(update_Flag) );
  INVD0HVT U128 ( .I(activation[7]), .ZN(n40) );
  NR3D0HVT U129 ( .A1(activation[2]), .A2(N78), .A3(activation[1]), .ZN(n59)
         );
  INVD0HVT U130 ( .I(activation[3]), .ZN(n41) );
  NR2D0HVT U131 ( .A1(activation[4]), .A2(n69), .ZN(n66) );
  INVD0HVT U132 ( .I(activation[5]), .ZN(n43) );
  NR2D0HVT U133 ( .A1(activation[6]), .A2(n46), .ZN(n45) );
  XNR2D0HVT U134 ( .A1(n40), .A2(n45), .ZN(n39) );
  INVD0HVT U135 ( .I(weight[3]), .ZN(n37) );
  NR3D0HVT U136 ( .A1(weight[0]), .A2(weight[2]), .A3(weight[1]), .ZN(n36) );
  MUX2ND0HVT U137 ( .I0(n37), .I1(weight[3]), .S(n36), .ZN(n38) );
  CKND2D0HVT U138 ( .A1(update_Flag), .A2(n38), .ZN(n65) );
  INVD0HVT U139 ( .I(n38), .ZN(n55) );
  CKND2D0HVT U140 ( .A1(update_Flag), .A2(n55), .ZN(n68) );
  OAI22D0HVT U141 ( .A1(n39), .A2(n65), .B1(n40), .B2(n68), .ZN(ADD_OP_B[7])
         );
  AOI22D0HVT U142 ( .A1(activation[7]), .A2(n68), .B1(n65), .B2(n40), .ZN(
        ADD_OP_B[13]) );
  CKAN2D0HVT U143 ( .A1(MUL_RESULT[1]), .A2(n71), .Z(\intadd_0/CI ) );
  CKAN2D0HVT U144 ( .A1(MUL_RESULT[2]), .A2(n71), .Z(\intadd_0/B[1] ) );
  CKAN2D0HVT U145 ( .A1(MUL_RESULT[3]), .A2(n71), .Z(\intadd_0/B[2] ) );
  CKAN2D0HVT U146 ( .A1(MUL_RESULT[4]), .A2(n71), .Z(\intadd_0/B[3] ) );
  CKAN2D0HVT U147 ( .A1(MUL_RESULT[5]), .A2(n71), .Z(\intadd_0/B[4] ) );
  CKAN2D0HVT U148 ( .A1(MUL_RESULT[7]), .A2(n71), .Z(\intadd_0/B[6] ) );
  CKAN2D0HVT U149 ( .A1(MUL_RESULT[8]), .A2(n71), .Z(\intadd_0/B[7] ) );
  CKAN2D0HVT U150 ( .A1(MUL_RESULT[9]), .A2(n71), .Z(\intadd_0/B[8] ) );
  CKAN2D0HVT U151 ( .A1(MUL_RESULT[10]), .A2(n71), .Z(\intadd_0/B[9] ) );
  CKAN2D0HVT U152 ( .A1(MUL_RESULT[11]), .A2(n71), .Z(\intadd_0/B[10] ) );
  CKAN2D0HVT U153 ( .A1(MUL_RESULT[12]), .A2(n71), .Z(\intadd_0/B[11] ) );
  CKAN2D0HVT U154 ( .A1(MUL_RESULT[13]), .A2(n71), .Z(\intadd_0/B[12] ) );
  CKAN2D0HVT U155 ( .A1(MUL_RESULT[14]), .A2(n71), .Z(\intadd_0/B[13] ) );
  CKAN2D0HVT U156 ( .A1(MUL_RESULT[15]), .A2(n71), .Z(\intadd_0/B[14] ) );
  CKAN2D0HVT U157 ( .A1(MUL_RESULT[16]), .A2(n71), .Z(\intadd_0/B[15] ) );
  CKAN2D0HVT U158 ( .A1(MUL_RESULT[17]), .A2(n71), .Z(\intadd_0/A[16] ) );
  OA21D0HVT U159 ( .A1(reset), .A2(n71), .B(en), .Z(N189) );
  OA211D0HVT U160 ( .A1(output_result[0]), .A2(MUL_RESULT[0]), .B(n71), .C(n51), .Z(N168) );
  INVD0HVT U161 ( .I(N78), .ZN(n61) );
  NR2D0HVT U162 ( .A1(n56), .A2(n61), .ZN(ADD_OP_B[0]) );
  OAI21D0HVT U163 ( .A1(n59), .A2(n55), .B(update_Flag), .ZN(n42) );
  OAI32D0HVT U164 ( .A1(activation[3]), .A2(n59), .A3(n65), .B1(n42), .B2(n41), 
        .ZN(ADD_OP_B[3]) );
  OAI21D0HVT U165 ( .A1(n66), .A2(n55), .B(update_Flag), .ZN(n44) );
  OAI32D0HVT U166 ( .A1(activation[5]), .A2(n66), .A3(n65), .B1(n44), .B2(n43), 
        .ZN(ADD_OP_B[5]) );
  AOI211D0HVT U167 ( .A1(activation[6]), .A2(n46), .B(n45), .C(n65), .ZN(n47)
         );
  AO21D0HVT U168 ( .A1(n48), .A2(activation[6]), .B(n47), .Z(ADD_OP_B[6]) );
  CKND2D0HVT U169 ( .A1(MUL_RESULT[17]), .A2(output_result[20]), .ZN(n49) );
  OAI211D0HVT U170 ( .A1(MUL_RESULT[17]), .A2(output_result[20]), .B(n71), .C(
        n49), .ZN(n50) );
  XNR2D0HVT U171 ( .A1(\intadd_0/n1 ), .A2(n50), .ZN(N188) );
  INR2D0HVT U172 ( .A1(output_result[1]), .B1(n52), .ZN(\intadd_0/B[0] ) );
  NR2D0HVT U173 ( .A1(n52), .A2(n51), .ZN(\intadd_0/A[0] ) );
  INR2D0HVT U174 ( .A1(output_result[2]), .B1(n52), .ZN(\intadd_0/A[1] ) );
  INR2D0HVT U175 ( .A1(output_result[3]), .B1(n52), .ZN(\intadd_0/A[2] ) );
  INR2D0HVT U176 ( .A1(output_result[4]), .B1(n52), .ZN(\intadd_0/A[3] ) );
  INR2D0HVT U177 ( .A1(output_result[5]), .B1(n52), .ZN(\intadd_0/A[4] ) );
  INR2D0HVT U178 ( .A1(output_result[6]), .B1(n52), .ZN(\intadd_0/A[5] ) );
  INR2D0HVT U179 ( .A1(output_result[7]), .B1(n52), .ZN(\intadd_0/A[6] ) );
  INR2D0HVT U180 ( .A1(output_result[8]), .B1(n52), .ZN(\intadd_0/A[7] ) );
  INR2D0HVT U181 ( .A1(output_result[9]), .B1(n52), .ZN(\intadd_0/A[8] ) );
  INR2D0HVT U182 ( .A1(output_result[10]), .B1(n52), .ZN(\intadd_0/A[9] ) );
  INR2D0HVT U183 ( .A1(output_result[11]), .B1(n52), .ZN(\intadd_0/A[10] ) );
  INR2D0HVT U184 ( .A1(output_result[12]), .B1(n52), .ZN(\intadd_0/A[11] ) );
  INR2D0HVT U185 ( .A1(output_result[13]), .B1(n52), .ZN(\intadd_0/A[12] ) );
  INR2D0HVT U186 ( .A1(output_result[14]), .B1(n52), .ZN(\intadd_0/A[13] ) );
  INR2D0HVT U187 ( .A1(output_result[15]), .B1(n52), .ZN(\intadd_0/A[14] ) );
  INR2D0HVT U188 ( .A1(output_result[16]), .B1(n52), .ZN(\intadd_0/A[15] ) );
  INR2D0HVT U189 ( .A1(output_result[17]), .B1(n52), .ZN(\intadd_0/B[16] ) );
  INR2D0HVT U190 ( .A1(output_result[18]), .B1(n52), .ZN(\intadd_0/B[17] ) );
  INR2D0HVT U191 ( .A1(output_result[19]), .B1(n52), .ZN(\intadd_0/B[18] ) );
  NR2D0HVT U192 ( .A1(MUL_CNT[0]), .A2(n52), .ZN(n32) );
  AO21D0HVT U193 ( .A1(n52), .A2(index[2]), .B(MUL_CNT[2]), .Z(addr_B_IS[2])
         );
  AO21D0HVT U194 ( .A1(n52), .A2(index[0]), .B(MUL_CNT[0]), .Z(addr_B_IS[0])
         );
  AO21D0HVT U195 ( .A1(n52), .A2(index[1]), .B(MUL_CNT[1]), .Z(addr_B_IS[1])
         );
  INVD0HVT U196 ( .I(MUL_CNT[2]), .ZN(n53) );
  CKND2D0HVT U197 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .ZN(n54) );
  NR2D0HVT U198 ( .A1(n53), .A2(n54), .ZN(\MUL_CNT_PLUS_1[3] ) );
  AOI21D0HVT U199 ( .A1(n53), .A2(n54), .B(\MUL_CNT_PLUS_1[3] ), .ZN(n31) );
  OA21D0HVT U200 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .B(n54), .Z(n30) );
  NR2D0HVT U201 ( .A1(n55), .A2(n61), .ZN(n58) );
  AOI221D0HVT U202 ( .A1(activation[1]), .A2(n58), .B1(n60), .B2(n57), .C(n56), 
        .ZN(ADD_OP_B[1]) );
  CKND2D0HVT U203 ( .A1(n61), .A2(n60), .ZN(n63) );
  INVD0HVT U204 ( .I(activation[2]), .ZN(n62) );
  OAI222D0HVT U205 ( .A1(n64), .A2(n63), .B1(n64), .B2(activation[2]), .C1(n68), .C2(n62), .ZN(ADD_OP_B[2]) );
  OR2D0HVT U206 ( .A1(n66), .A2(n65), .Z(n70) );
  INVD0HVT U207 ( .I(activation[4]), .ZN(n67) );
  OAI222D0HVT U208 ( .A1(n70), .A2(n69), .B1(n70), .B2(activation[4]), .C1(n68), .C2(n67), .ZN(ADD_OP_B[4]) );
endmodule

