/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Jan 17 17:40:46 2026
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


module SNPS_CLOCK_GATE_HIGH_internalStorage_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_7 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_6 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_internalStorage_1 ( CLK, EN, ENCLK, TE );
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
         \partialAcc[0][2] , \partialAcc[0][1] , \partialAcc[0][0] , N18, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, N42, N45, N46, N47, N48, N49, N50, N51, N52,
         N53, N54, N55, N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68,
         N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N84, N85, N86,
         N87, N88, N89, N90, N91, N92, N93, N94, N97, N98, N99, N100, N101,
         N102, N103, N104, N105, N106, N107, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, net348, net354, net359, net364,
         net369, net374, net379, net384, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92;

  SNPS_CLOCK_GATE_HIGH_internalStorage_0 \clk_gate_partialAcc_reg[0]  ( .CLK(
        clk), .EN(N18), .ENCLK(net348), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_7 \clk_gate_partialAcc_reg[1]  ( .CLK(
        clk), .EN(N32), .ENCLK(net354), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_6 \clk_gate_partialAcc_reg[2]  ( .CLK(
        clk), .EN(N45), .ENCLK(net359), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_5 \clk_gate_partialAcc_reg[3]  ( .CLK(
        clk), .EN(N58), .ENCLK(net364), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_4 \clk_gate_partialAcc_reg[4]  ( .CLK(
        clk), .EN(N71), .ENCLK(net369), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_3 \clk_gate_partialAcc_reg[5]  ( .CLK(
        clk), .EN(N84), .ENCLK(net374), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_2 \clk_gate_partialAcc_reg[6]  ( .CLK(
        clk), .EN(N97), .ENCLK(net379), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_internalStorage_1 \clk_gate_partialAcc_reg[7]  ( .CLK(
        clk), .EN(N110), .ENCLK(net384), .TE(\*Logic0* ) );
  DFCNQD1HVT \partialAcc_reg[0][9]  ( .D(N29), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][9] ) );
  DFCNQD1HVT \partialAcc_reg[0][8]  ( .D(N28), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][8] ) );
  DFCNQD1HVT \partialAcc_reg[0][7]  ( .D(N27), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][7] ) );
  DFCNQD1HVT \partialAcc_reg[0][6]  ( .D(N26), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][6] ) );
  DFCNQD1HVT \partialAcc_reg[0][5]  ( .D(N25), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][5] ) );
  DFCNQD1HVT \partialAcc_reg[0][4]  ( .D(N24), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][4] ) );
  DFCNQD1HVT \partialAcc_reg[0][3]  ( .D(N23), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][3] ) );
  DFCNQD1HVT \partialAcc_reg[0][2]  ( .D(N22), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][2] ) );
  DFCNQD1HVT \partialAcc_reg[0][1]  ( .D(N21), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][1] ) );
  DFCNQD1HVT \partialAcc_reg[0][0]  ( .D(N20), .CP(net348), .CDN(rst_n), .Q(
        \partialAcc[0][0] ) );
  DFCNQD1HVT \partialAcc_reg[1][9]  ( .D(N42), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][9] ) );
  DFCNQD1HVT \partialAcc_reg[1][8]  ( .D(N41), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][8] ) );
  DFCNQD1HVT \partialAcc_reg[1][7]  ( .D(N40), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][7] ) );
  DFCNQD1HVT \partialAcc_reg[1][6]  ( .D(N39), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][6] ) );
  DFCNQD1HVT \partialAcc_reg[1][5]  ( .D(N38), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][5] ) );
  DFCNQD1HVT \partialAcc_reg[1][4]  ( .D(N37), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][4] ) );
  DFCNQD1HVT \partialAcc_reg[1][3]  ( .D(N36), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][3] ) );
  DFCNQD1HVT \partialAcc_reg[1][2]  ( .D(N35), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][2] ) );
  DFCNQD1HVT \partialAcc_reg[1][1]  ( .D(N34), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][1] ) );
  DFCNQD1HVT \partialAcc_reg[1][0]  ( .D(N33), .CP(net354), .CDN(rst_n), .Q(
        \partialAcc[1][0] ) );
  DFCNQD1HVT \partialAcc_reg[2][9]  ( .D(N55), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][9] ) );
  DFCNQD1HVT \partialAcc_reg[2][8]  ( .D(N54), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][8] ) );
  DFCNQD1HVT \partialAcc_reg[2][7]  ( .D(N53), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][7] ) );
  DFCNQD1HVT \partialAcc_reg[2][6]  ( .D(N52), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][6] ) );
  DFCNQD1HVT \partialAcc_reg[2][5]  ( .D(N51), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][5] ) );
  DFCNQD1HVT \partialAcc_reg[2][4]  ( .D(N50), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][4] ) );
  DFCNQD1HVT \partialAcc_reg[2][3]  ( .D(N49), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][3] ) );
  DFCNQD1HVT \partialAcc_reg[2][2]  ( .D(N48), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][2] ) );
  DFCNQD1HVT \partialAcc_reg[2][1]  ( .D(N47), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][1] ) );
  DFCNQD1HVT \partialAcc_reg[2][0]  ( .D(N46), .CP(net359), .CDN(rst_n), .Q(
        \partialAcc[2][0] ) );
  DFCNQD1HVT \partialAcc_reg[3][9]  ( .D(N68), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][9] ) );
  DFCNQD1HVT \partialAcc_reg[3][8]  ( .D(N67), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][8] ) );
  DFCNQD1HVT \partialAcc_reg[3][7]  ( .D(N66), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][7] ) );
  DFCNQD1HVT \partialAcc_reg[3][6]  ( .D(N65), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][6] ) );
  DFCNQD1HVT \partialAcc_reg[3][5]  ( .D(N64), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][5] ) );
  DFCNQD1HVT \partialAcc_reg[3][4]  ( .D(N63), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][4] ) );
  DFCNQD1HVT \partialAcc_reg[3][3]  ( .D(N62), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][3] ) );
  DFCNQD1HVT \partialAcc_reg[3][2]  ( .D(N61), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][2] ) );
  DFCNQD1HVT \partialAcc_reg[3][1]  ( .D(N60), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][1] ) );
  DFCNQD1HVT \partialAcc_reg[3][0]  ( .D(N59), .CP(net364), .CDN(rst_n), .Q(
        \partialAcc[3][0] ) );
  DFCNQD1HVT \partialAcc_reg[4][9]  ( .D(N81), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][9] ) );
  DFCNQD1HVT \partialAcc_reg[4][8]  ( .D(N80), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][8] ) );
  DFCNQD1HVT \partialAcc_reg[4][7]  ( .D(N79), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][7] ) );
  DFCNQD1HVT \partialAcc_reg[4][6]  ( .D(N78), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][6] ) );
  DFCNQD1HVT \partialAcc_reg[4][5]  ( .D(N77), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][5] ) );
  DFCNQD1HVT \partialAcc_reg[4][4]  ( .D(N76), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][4] ) );
  DFCNQD1HVT \partialAcc_reg[4][3]  ( .D(N75), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][3] ) );
  DFCNQD1HVT \partialAcc_reg[4][2]  ( .D(N74), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][2] ) );
  DFCNQD1HVT \partialAcc_reg[4][1]  ( .D(N73), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][1] ) );
  DFCNQD1HVT \partialAcc_reg[4][0]  ( .D(N72), .CP(net369), .CDN(rst_n), .Q(
        \partialAcc[4][0] ) );
  DFCNQD1HVT \partialAcc_reg[5][9]  ( .D(N94), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][9] ) );
  DFCNQD1HVT \partialAcc_reg[5][8]  ( .D(N93), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][8] ) );
  DFCNQD1HVT \partialAcc_reg[5][7]  ( .D(N92), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][7] ) );
  DFCNQD1HVT \partialAcc_reg[5][6]  ( .D(N91), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][6] ) );
  DFCNQD1HVT \partialAcc_reg[5][5]  ( .D(N90), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][5] ) );
  DFCNQD1HVT \partialAcc_reg[5][4]  ( .D(N89), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][4] ) );
  DFCNQD1HVT \partialAcc_reg[5][3]  ( .D(N88), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][3] ) );
  DFCNQD1HVT \partialAcc_reg[5][2]  ( .D(N87), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][2] ) );
  DFCNQD1HVT \partialAcc_reg[5][1]  ( .D(N86), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][1] ) );
  DFCNQD1HVT \partialAcc_reg[5][0]  ( .D(N85), .CP(net374), .CDN(rst_n), .Q(
        \partialAcc[5][0] ) );
  DFCNQD1HVT \partialAcc_reg[6][9]  ( .D(N107), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][9] ) );
  DFCNQD1HVT \partialAcc_reg[6][8]  ( .D(N106), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][8] ) );
  DFCNQD1HVT \partialAcc_reg[6][7]  ( .D(N105), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][7] ) );
  DFCNQD1HVT \partialAcc_reg[6][6]  ( .D(N104), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][6] ) );
  DFCNQD1HVT \partialAcc_reg[6][5]  ( .D(N103), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][5] ) );
  DFCNQD1HVT \partialAcc_reg[6][4]  ( .D(N102), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][4] ) );
  DFCNQD1HVT \partialAcc_reg[6][3]  ( .D(N101), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][3] ) );
  DFCNQD1HVT \partialAcc_reg[6][2]  ( .D(N100), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][2] ) );
  DFCNQD1HVT \partialAcc_reg[6][1]  ( .D(N99), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][1] ) );
  DFCNQD1HVT \partialAcc_reg[6][0]  ( .D(N98), .CP(net379), .CDN(rst_n), .Q(
        \partialAcc[6][0] ) );
  DFCNQD1HVT \partialAcc_reg[7][9]  ( .D(N120), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][9] ) );
  DFCNQD1HVT \partialAcc_reg[7][8]  ( .D(N119), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][8] ) );
  DFCNQD1HVT \partialAcc_reg[7][7]  ( .D(N118), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][7] ) );
  DFCNQD1HVT \partialAcc_reg[7][6]  ( .D(N117), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][6] ) );
  DFCNQD1HVT \partialAcc_reg[7][5]  ( .D(N116), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][5] ) );
  DFCNQD1HVT \partialAcc_reg[7][4]  ( .D(N115), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][4] ) );
  DFCNQD1HVT \partialAcc_reg[7][3]  ( .D(N114), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][3] ) );
  DFCNQD1HVT \partialAcc_reg[7][2]  ( .D(N113), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][2] ) );
  DFCNQD1HVT \partialAcc_reg[7][1]  ( .D(N112), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][1] ) );
  DFCNQD1HVT \partialAcc_reg[7][0]  ( .D(N111), .CP(net384), .CDN(rst_n), .Q(
        \partialAcc[7][0] ) );
  AOI22D0HVT U2 ( .A1(n83), .A2(\partialAcc[1][4] ), .B1(n82), .B2(
        \partialAcc[3][4] ), .ZN(n58) );
  AOI22D0HVT U3 ( .A1(n83), .A2(\partialAcc[5][4] ), .B1(n82), .B2(
        \partialAcc[7][4] ), .ZN(n61) );
  AOI22D0HVT U4 ( .A1(n88), .A2(\partialAcc[4][7] ), .B1(n87), .B2(
        \partialAcc[6][7] ), .ZN(n74) );
  CKND2D0HVT U5 ( .A1(addr_A[2]), .A2(addr_A[1]), .ZN(n11) );
  INVD0HVT U6 ( .I(reset), .ZN(n6) );
  INVD0HVT U7 ( .I(data_A[4]), .ZN(n21) );
  TIELHVT U8 ( .ZN(\*Logic0* ) );
  INVD0HVT U9 ( .I(addr_A[1]), .ZN(n1) );
  NR2D0HVT U10 ( .A1(addr_A[2]), .A2(n1), .ZN(n15) );
  INVD0HVT U11 ( .I(n15), .ZN(n4) );
  CKND2D0HVT U12 ( .A1(addr_A[0]), .A2(wen), .ZN(n2) );
  OAI21D0HVT U13 ( .A1(n4), .A2(n2), .B(n6), .ZN(N58) );
  NR2D0HVT U14 ( .A1(addr_A[2]), .A2(addr_A[1]), .ZN(n13) );
  INVD0HVT U15 ( .I(n13), .ZN(n3) );
  OAI21D0HVT U16 ( .A1(n3), .A2(n2), .B(n6), .ZN(N32) );
  CKND2D0HVT U17 ( .A1(n1), .A2(addr_A[2]), .ZN(n8) );
  OAI21D0HVT U18 ( .A1(n8), .A2(n2), .B(n6), .ZN(N84) );
  OAI21D0HVT U19 ( .A1(n11), .A2(n2), .B(n6), .ZN(N110) );
  INVD0HVT U20 ( .I(addr_A[0]), .ZN(n7) );
  CKND2D0HVT U21 ( .A1(wen), .A2(n7), .ZN(n5) );
  OAI21D0HVT U22 ( .A1(n3), .A2(n5), .B(n6), .ZN(N18) );
  OAI21D0HVT U23 ( .A1(n4), .A2(n5), .B(n6), .ZN(N45) );
  OAI21D0HVT U24 ( .A1(n8), .A2(n5), .B(n6), .ZN(N71) );
  OAI21D0HVT U25 ( .A1(n11), .A2(n5), .B(n6), .ZN(N97) );
  INVD0HVT U26 ( .I(data_A[0]), .ZN(n17) );
  CKND2D0HVT U27 ( .A1(wen), .A2(n6), .ZN(n9) );
  NR2D0HVT U28 ( .A1(n7), .A2(n9), .ZN(n14) );
  INVD0HVT U29 ( .I(n8), .ZN(n10) );
  CKND2D0HVT U30 ( .A1(n14), .A2(n10), .ZN(n30) );
  NR2D0HVT U31 ( .A1(n17), .A2(n30), .ZN(N85) );
  NR2D0HVT U32 ( .A1(addr_A[0]), .A2(n9), .ZN(n16) );
  CKND2D0HVT U33 ( .A1(n16), .A2(n10), .ZN(n26) );
  NR2D0HVT U34 ( .A1(n17), .A2(n26), .ZN(N72) );
  INVD0HVT U35 ( .I(n11), .ZN(n12) );
  CKND2D0HVT U36 ( .A1(n14), .A2(n12), .ZN(n34) );
  NR2D0HVT U37 ( .A1(n17), .A2(n34), .ZN(N111) );
  CKND2D0HVT U38 ( .A1(n12), .A2(n16), .ZN(n28) );
  NR2D0HVT U39 ( .A1(n17), .A2(n28), .ZN(N98) );
  CKND2D0HVT U40 ( .A1(n16), .A2(n13), .ZN(n27) );
  NR2D0HVT U41 ( .A1(n17), .A2(n27), .ZN(N20) );
  CKND2D0HVT U42 ( .A1(n14), .A2(n13), .ZN(n32) );
  NR2D0HVT U43 ( .A1(n17), .A2(n32), .ZN(N33) );
  CKND2D0HVT U44 ( .A1(n14), .A2(n15), .ZN(n31) );
  NR2D0HVT U45 ( .A1(n17), .A2(n31), .ZN(N59) );
  CKND2D0HVT U46 ( .A1(n16), .A2(n15), .ZN(n29) );
  NR2D0HVT U47 ( .A1(n17), .A2(n29), .ZN(N46) );
  INVD0HVT U48 ( .I(data_A[1]), .ZN(n18) );
  NR2D0HVT U49 ( .A1(n18), .A2(n32), .ZN(N34) );
  NR2D0HVT U50 ( .A1(n18), .A2(n29), .ZN(N47) );
  NR2D0HVT U51 ( .A1(n18), .A2(n26), .ZN(N73) );
  NR2D0HVT U52 ( .A1(n18), .A2(n31), .ZN(N60) );
  NR2D0HVT U53 ( .A1(n18), .A2(n27), .ZN(N21) );
  NR2D0HVT U54 ( .A1(n18), .A2(n30), .ZN(N86) );
  NR2D0HVT U55 ( .A1(n18), .A2(n28), .ZN(N99) );
  NR2D0HVT U56 ( .A1(n34), .A2(n18), .ZN(N112) );
  INVD0HVT U57 ( .I(data_A[2]), .ZN(n19) );
  NR2D0HVT U58 ( .A1(n19), .A2(n29), .ZN(N48) );
  NR2D0HVT U59 ( .A1(n19), .A2(n26), .ZN(N74) );
  NR2D0HVT U60 ( .A1(n19), .A2(n31), .ZN(N61) );
  NR2D0HVT U61 ( .A1(n19), .A2(n32), .ZN(N35) );
  NR2D0HVT U62 ( .A1(n19), .A2(n27), .ZN(N22) );
  NR2D0HVT U63 ( .A1(n19), .A2(n28), .ZN(N100) );
  NR2D0HVT U64 ( .A1(n19), .A2(n30), .ZN(N87) );
  NR2D0HVT U65 ( .A1(n34), .A2(n19), .ZN(N113) );
  INVD0HVT U66 ( .I(data_A[3]), .ZN(n20) );
  NR2D0HVT U67 ( .A1(n20), .A2(n28), .ZN(N101) );
  NR2D0HVT U68 ( .A1(n20), .A2(n32), .ZN(N36) );
  NR2D0HVT U69 ( .A1(n20), .A2(n31), .ZN(N62) );
  NR2D0HVT U70 ( .A1(n20), .A2(n30), .ZN(N88) );
  NR2D0HVT U71 ( .A1(n20), .A2(n26), .ZN(N75) );
  NR2D0HVT U72 ( .A1(n20), .A2(n29), .ZN(N49) );
  NR2D0HVT U73 ( .A1(n20), .A2(n27), .ZN(N23) );
  NR2D0HVT U74 ( .A1(n34), .A2(n20), .ZN(N114) );
  NR2D0HVT U75 ( .A1(n21), .A2(n32), .ZN(N37) );
  NR2D0HVT U76 ( .A1(n21), .A2(n28), .ZN(N102) );
  NR2D0HVT U77 ( .A1(n21), .A2(n30), .ZN(N89) );
  NR2D0HVT U78 ( .A1(n21), .A2(n26), .ZN(N76) );
  NR2D0HVT U79 ( .A1(n21), .A2(n27), .ZN(N24) );
  NR2D0HVT U80 ( .A1(n21), .A2(n29), .ZN(N50) );
  NR2D0HVT U81 ( .A1(n21), .A2(n31), .ZN(N63) );
  NR2D0HVT U82 ( .A1(n34), .A2(n21), .ZN(N115) );
  INVD0HVT U83 ( .I(data_A[5]), .ZN(n22) );
  NR2D0HVT U84 ( .A1(n22), .A2(n26), .ZN(N77) );
  NR2D0HVT U85 ( .A1(n22), .A2(n31), .ZN(N64) );
  NR2D0HVT U86 ( .A1(n22), .A2(n28), .ZN(N103) );
  NR2D0HVT U87 ( .A1(n22), .A2(n32), .ZN(N38) );
  NR2D0HVT U88 ( .A1(n22), .A2(n27), .ZN(N25) );
  NR2D0HVT U89 ( .A1(n22), .A2(n29), .ZN(N51) );
  NR2D0HVT U90 ( .A1(n22), .A2(n30), .ZN(N90) );
  NR2D0HVT U91 ( .A1(n34), .A2(n22), .ZN(N116) );
  INVD0HVT U92 ( .I(data_A[6]), .ZN(n23) );
  NR2D0HVT U93 ( .A1(n23), .A2(n31), .ZN(N65) );
  NR2D0HVT U94 ( .A1(n23), .A2(n32), .ZN(N39) );
  NR2D0HVT U95 ( .A1(n23), .A2(n27), .ZN(N26) );
  NR2D0HVT U96 ( .A1(n23), .A2(n29), .ZN(N52) );
  NR2D0HVT U97 ( .A1(n23), .A2(n30), .ZN(N91) );
  NR2D0HVT U98 ( .A1(n23), .A2(n28), .ZN(N104) );
  NR2D0HVT U99 ( .A1(n23), .A2(n26), .ZN(N78) );
  NR2D0HVT U100 ( .A1(n34), .A2(n23), .ZN(N117) );
  INVD0HVT U101 ( .I(data_A[7]), .ZN(n24) );
  NR2D0HVT U102 ( .A1(n24), .A2(n26), .ZN(N79) );
  NR2D0HVT U103 ( .A1(n24), .A2(n27), .ZN(N27) );
  NR2D0HVT U104 ( .A1(n24), .A2(n30), .ZN(N92) );
  NR2D0HVT U105 ( .A1(n24), .A2(n28), .ZN(N105) );
  NR2D0HVT U106 ( .A1(n24), .A2(n32), .ZN(N40) );
  NR2D0HVT U107 ( .A1(n24), .A2(n29), .ZN(N53) );
  NR2D0HVT U108 ( .A1(n24), .A2(n31), .ZN(N66) );
  NR2D0HVT U109 ( .A1(n34), .A2(n24), .ZN(N118) );
  INVD0HVT U110 ( .I(data_A[8]), .ZN(n25) );
  NR2D0HVT U111 ( .A1(n25), .A2(n29), .ZN(N54) );
  NR2D0HVT U112 ( .A1(n25), .A2(n30), .ZN(N93) );
  NR2D0HVT U113 ( .A1(n25), .A2(n26), .ZN(N80) );
  NR2D0HVT U114 ( .A1(n25), .A2(n32), .ZN(N41) );
  NR2D0HVT U115 ( .A1(n25), .A2(n28), .ZN(N106) );
  NR2D0HVT U116 ( .A1(n25), .A2(n27), .ZN(N28) );
  NR2D0HVT U117 ( .A1(n25), .A2(n31), .ZN(N67) );
  NR2D0HVT U118 ( .A1(n34), .A2(n25), .ZN(N119) );
  INVD0HVT U119 ( .I(data_A[9]), .ZN(n33) );
  NR2D0HVT U120 ( .A1(n33), .A2(n26), .ZN(N81) );
  NR2D0HVT U121 ( .A1(n33), .A2(n27), .ZN(N29) );
  NR2D0HVT U122 ( .A1(n33), .A2(n28), .ZN(N107) );
  NR2D0HVT U123 ( .A1(n33), .A2(n29), .ZN(N55) );
  NR2D0HVT U124 ( .A1(n33), .A2(n30), .ZN(N94) );
  NR2D0HVT U125 ( .A1(n33), .A2(n31), .ZN(N68) );
  NR2D0HVT U126 ( .A1(n33), .A2(n32), .ZN(N42) );
  NR2D0HVT U127 ( .A1(n34), .A2(n33), .ZN(N120) );
  INVD0HVT U128 ( .I(addr_B[0]), .ZN(n35) );
  NR2XD0HVT U129 ( .A1(addr_B[1]), .A2(n35), .ZN(n83) );
  INVD0HVT U130 ( .I(addr_B[1]), .ZN(n36) );
  NR2XD0HVT U131 ( .A1(n36), .A2(n35), .ZN(n82) );
  AOI22D0HVT U132 ( .A1(n83), .A2(\partialAcc[5][0] ), .B1(n82), .B2(
        \partialAcc[7][0] ), .ZN(n41) );
  AOI22D0HVT U133 ( .A1(n83), .A2(\partialAcc[1][0] ), .B1(n82), .B2(
        \partialAcc[3][0] ), .ZN(n38) );
  NR2XD0HVT U134 ( .A1(addr_B[1]), .A2(addr_B[0]), .ZN(n88) );
  NR2XD0HVT U135 ( .A1(addr_B[0]), .A2(n36), .ZN(n87) );
  AOI22D0HVT U136 ( .A1(n88), .A2(\partialAcc[0][0] ), .B1(n87), .B2(
        \partialAcc[2][0] ), .ZN(n37) );
  IND2D0HVT U137 ( .A1(addr_B[2]), .B1(ren), .ZN(n84) );
  AO21D0HVT U138 ( .A1(n38), .A2(n37), .B(n84), .Z(n40) );
  AOI22D0HVT U139 ( .A1(n88), .A2(\partialAcc[4][0] ), .B1(n87), .B2(
        \partialAcc[6][0] ), .ZN(n39) );
  CKND2D0HVT U140 ( .A1(ren), .A2(addr_B[2]), .ZN(n89) );
  AOI32D0HVT U141 ( .A1(n41), .A2(n40), .A3(n39), .B1(n89), .B2(n40), .ZN(
        data_B[0]) );
  AOI22D0HVT U142 ( .A1(n83), .A2(\partialAcc[5][1] ), .B1(n82), .B2(
        \partialAcc[7][1] ), .ZN(n46) );
  AOI22D0HVT U143 ( .A1(n83), .A2(\partialAcc[1][1] ), .B1(n82), .B2(
        \partialAcc[3][1] ), .ZN(n43) );
  AOI22D0HVT U144 ( .A1(n88), .A2(\partialAcc[0][1] ), .B1(n87), .B2(
        \partialAcc[2][1] ), .ZN(n42) );
  AO21D0HVT U145 ( .A1(n43), .A2(n42), .B(n84), .Z(n45) );
  AOI22D0HVT U146 ( .A1(n88), .A2(\partialAcc[4][1] ), .B1(n87), .B2(
        \partialAcc[6][1] ), .ZN(n44) );
  AOI32D0HVT U147 ( .A1(n46), .A2(n45), .A3(n44), .B1(n89), .B2(n45), .ZN(
        data_B[1]) );
  AOI22D0HVT U148 ( .A1(n83), .A2(\partialAcc[5][2] ), .B1(n82), .B2(
        \partialAcc[7][2] ), .ZN(n51) );
  AOI22D0HVT U149 ( .A1(n83), .A2(\partialAcc[1][2] ), .B1(n82), .B2(
        \partialAcc[3][2] ), .ZN(n48) );
  AOI22D0HVT U150 ( .A1(n88), .A2(\partialAcc[0][2] ), .B1(n87), .B2(
        \partialAcc[2][2] ), .ZN(n47) );
  AO21D0HVT U151 ( .A1(n48), .A2(n47), .B(n84), .Z(n50) );
  AOI22D0HVT U152 ( .A1(n88), .A2(\partialAcc[4][2] ), .B1(n87), .B2(
        \partialAcc[6][2] ), .ZN(n49) );
  AOI32D0HVT U153 ( .A1(n51), .A2(n50), .A3(n49), .B1(n89), .B2(n50), .ZN(
        data_B[2]) );
  AOI22D0HVT U154 ( .A1(n83), .A2(\partialAcc[5][3] ), .B1(n82), .B2(
        \partialAcc[7][3] ), .ZN(n56) );
  AOI22D0HVT U155 ( .A1(n83), .A2(\partialAcc[1][3] ), .B1(n82), .B2(
        \partialAcc[3][3] ), .ZN(n53) );
  AOI22D0HVT U156 ( .A1(n88), .A2(\partialAcc[0][3] ), .B1(n87), .B2(
        \partialAcc[2][3] ), .ZN(n52) );
  AO21D0HVT U157 ( .A1(n53), .A2(n52), .B(n84), .Z(n55) );
  AOI22D0HVT U158 ( .A1(n88), .A2(\partialAcc[4][3] ), .B1(n87), .B2(
        \partialAcc[6][3] ), .ZN(n54) );
  AOI32D0HVT U159 ( .A1(n56), .A2(n55), .A3(n54), .B1(n89), .B2(n55), .ZN(
        data_B[3]) );
  AOI22D0HVT U160 ( .A1(n88), .A2(\partialAcc[0][4] ), .B1(n87), .B2(
        \partialAcc[2][4] ), .ZN(n57) );
  AO21D0HVT U161 ( .A1(n58), .A2(n57), .B(n84), .Z(n60) );
  AOI22D0HVT U162 ( .A1(n88), .A2(\partialAcc[4][4] ), .B1(n87), .B2(
        \partialAcc[6][4] ), .ZN(n59) );
  AOI32D0HVT U163 ( .A1(n61), .A2(n60), .A3(n59), .B1(n89), .B2(n60), .ZN(
        data_B[4]) );
  AOI22D0HVT U164 ( .A1(n83), .A2(\partialAcc[5][5] ), .B1(n82), .B2(
        \partialAcc[7][5] ), .ZN(n66) );
  AOI22D0HVT U165 ( .A1(n83), .A2(\partialAcc[1][5] ), .B1(n82), .B2(
        \partialAcc[3][5] ), .ZN(n63) );
  AOI22D0HVT U166 ( .A1(n88), .A2(\partialAcc[0][5] ), .B1(n87), .B2(
        \partialAcc[2][5] ), .ZN(n62) );
  AO21D0HVT U167 ( .A1(n63), .A2(n62), .B(n84), .Z(n65) );
  AOI22D0HVT U168 ( .A1(n88), .A2(\partialAcc[4][5] ), .B1(n87), .B2(
        \partialAcc[6][5] ), .ZN(n64) );
  AOI32D0HVT U169 ( .A1(n66), .A2(n65), .A3(n64), .B1(n89), .B2(n65), .ZN(
        data_B[5]) );
  AOI22D0HVT U170 ( .A1(n83), .A2(\partialAcc[5][6] ), .B1(n82), .B2(
        \partialAcc[7][6] ), .ZN(n71) );
  AOI22D0HVT U171 ( .A1(n83), .A2(\partialAcc[1][6] ), .B1(n82), .B2(
        \partialAcc[3][6] ), .ZN(n68) );
  AOI22D0HVT U172 ( .A1(n88), .A2(\partialAcc[0][6] ), .B1(n87), .B2(
        \partialAcc[2][6] ), .ZN(n67) );
  AO21D0HVT U173 ( .A1(n68), .A2(n67), .B(n84), .Z(n70) );
  AOI22D0HVT U174 ( .A1(n88), .A2(\partialAcc[4][6] ), .B1(n87), .B2(
        \partialAcc[6][6] ), .ZN(n69) );
  AOI32D0HVT U175 ( .A1(n71), .A2(n70), .A3(n69), .B1(n89), .B2(n70), .ZN(
        data_B[6]) );
  AOI22D0HVT U176 ( .A1(n83), .A2(\partialAcc[5][7] ), .B1(n82), .B2(
        \partialAcc[7][7] ), .ZN(n76) );
  AOI22D0HVT U177 ( .A1(n83), .A2(\partialAcc[1][7] ), .B1(n82), .B2(
        \partialAcc[3][7] ), .ZN(n73) );
  AOI22D0HVT U178 ( .A1(n88), .A2(\partialAcc[0][7] ), .B1(n87), .B2(
        \partialAcc[2][7] ), .ZN(n72) );
  AO21D0HVT U179 ( .A1(n73), .A2(n72), .B(n84), .Z(n75) );
  AOI32D0HVT U180 ( .A1(n76), .A2(n75), .A3(n74), .B1(n89), .B2(n75), .ZN(
        data_B[7]) );
  AOI22D0HVT U181 ( .A1(n83), .A2(\partialAcc[5][8] ), .B1(n82), .B2(
        \partialAcc[7][8] ), .ZN(n81) );
  AOI22D0HVT U182 ( .A1(n83), .A2(\partialAcc[1][8] ), .B1(n82), .B2(
        \partialAcc[3][8] ), .ZN(n78) );
  AOI22D0HVT U183 ( .A1(n88), .A2(\partialAcc[0][8] ), .B1(n87), .B2(
        \partialAcc[2][8] ), .ZN(n77) );
  AO21D0HVT U184 ( .A1(n78), .A2(n77), .B(n84), .Z(n80) );
  AOI22D0HVT U185 ( .A1(n88), .A2(\partialAcc[4][8] ), .B1(n87), .B2(
        \partialAcc[6][8] ), .ZN(n79) );
  AOI32D0HVT U186 ( .A1(n81), .A2(n80), .A3(n79), .B1(n89), .B2(n80), .ZN(
        data_B[8]) );
  AOI22D0HVT U187 ( .A1(n83), .A2(\partialAcc[5][9] ), .B1(n82), .B2(
        \partialAcc[7][9] ), .ZN(n92) );
  AOI22D0HVT U188 ( .A1(n83), .A2(\partialAcc[1][9] ), .B1(n82), .B2(
        \partialAcc[3][9] ), .ZN(n86) );
  AOI22D0HVT U189 ( .A1(n88), .A2(\partialAcc[0][9] ), .B1(n87), .B2(
        \partialAcc[2][9] ), .ZN(n85) );
  AO21D0HVT U190 ( .A1(n86), .A2(n85), .B(n84), .Z(n91) );
  AOI22D0HVT U191 ( .A1(n88), .A2(\partialAcc[4][9] ), .B1(n87), .B2(
        \partialAcc[6][9] ), .ZN(n90) );
  AOI32D0HVT U192 ( .A1(n92), .A2(n91), .A3(n90), .B1(n89), .B2(n91), .ZN(
        data_B[9]) );
endmodule


module ADDER ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [9:0] ADD_OP_A;
  input [9:0] ADD_OP_B;
  output [9:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_0/A[7] , \intadd_0/A[6] , \intadd_0/A[5] , \intadd_0/A[4] ,
         \intadd_0/A[3] , \intadd_0/A[2] , \intadd_0/A[1] , \intadd_0/A[0] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 ,
         \intadd_0/n5 , \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 ,
         \intadd_0/n1 , n1, n2, n3, n4;

  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[7] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n8 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(ADD_RESULT[7]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_0/A[2] ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_0/CI ) );
  AN3D0HVT U4 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_0/B[0] ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_0/A[0] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_0/B[1] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_0/A[1] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_0/B[3] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_0/A[3] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_0/A[4] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_0/A[5] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_0/A[6] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_0/B[7] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_0/A[7] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_0/B[2] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_0/B[4] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_0/B[5] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_0/B[6] ) );
  INVD0HVT U19 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U20 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U21 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U22 ( .A1(ADD_OP_B[8]), .A2(ADD_OP_A[9]), .ZN(n3) );
  OAI211D0HVT U23 ( .A1(ADD_OP_B[8]), .A2(ADD_OP_A[9]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U24 ( .A1(\intadd_0/n1 ), .A2(n4), .ZN(ADD_RESULT[9]) );
endmodule


module MULTIPLIER ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [9:0] MUL_OP_A;
  input [3:0] MUL_OP_B;
  output [13:0] MUL_RESULT;
  input MUL_EN;
  wire   \intadd_1/A[9] , \intadd_1/A[8] , \intadd_1/A[7] , \intadd_1/A[6] ,
         \intadd_1/A[5] , \intadd_1/A[4] , \intadd_1/A[3] , \intadd_1/A[2] ,
         \intadd_1/A[1] , \intadd_1/A[0] , \intadd_1/B[9] , \intadd_1/B[8] ,
         \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] , \intadd_1/B[4] ,
         \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] , \intadd_1/B[0] ,
         \intadd_1/CI , \intadd_1/SUM[9] , \intadd_1/SUM[8] ,
         \intadd_1/SUM[7] , \intadd_1/SUM[6] , \intadd_1/SUM[5] ,
         \intadd_1/SUM[4] , \intadd_1/SUM[3] , \intadd_1/SUM[2] ,
         \intadd_1/SUM[1] , \intadd_1/SUM[0] , \intadd_1/n10 , \intadd_1/n9 ,
         \intadd_1/n8 , \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 ,
         \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67;
  assign MUL_RESULT[13] = \intadd_1/n1 ;

  FA1D0HVT \intadd_1/U11  ( .A(\intadd_1/A[0] ), .B(\intadd_1/B[0] ), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n10 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U10  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\intadd_1/SUM[1] ) );
  FA1D0HVT \intadd_1/U9  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\intadd_1/SUM[2] ) );
  FA1D0HVT \intadd_1/U8  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[3] ) );
  FA1D0HVT \intadd_1/U7  ( .A(\intadd_1/A[4] ), .B(\intadd_1/B[4] ), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[4] ) );
  FA1D0HVT \intadd_1/U6  ( .A(\intadd_1/A[5] ), .B(\intadd_1/B[5] ), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[5] ) );
  FA1D0HVT \intadd_1/U5  ( .A(\intadd_1/A[6] ), .B(\intadd_1/B[6] ), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[6] ) );
  FA1D0HVT \intadd_1/U4  ( .A(\intadd_1/A[7] ), .B(\intadd_1/B[7] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[7] ) );
  FA1D0HVT \intadd_1/U3  ( .A(\intadd_1/A[8] ), .B(\intadd_1/B[8] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[8] ) );
  FA1D0HVT \intadd_1/U2  ( .A(\intadd_1/A[9] ), .B(\intadd_1/B[9] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[9] ) );
  CKAN2D0HVT U2 ( .A1(n34), .A2(n52), .Z(n1) );
  INVD0HVT U3 ( .I(MUL_OP_A[5]), .ZN(n20) );
  OAI22D0HVT U4 ( .A1(n58), .A2(n24), .B1(n59), .B2(n27), .ZN(n47) );
  CKND2D0HVT U5 ( .A1(n41), .A2(n42), .ZN(\intadd_1/B[3] ) );
  CKND2D0HVT U6 ( .A1(n35), .A2(n36), .ZN(\intadd_1/CI ) );
  INVD0HVT U7 ( .I(MUL_OP_A[0]), .ZN(n33) );
  INVD0HVT U8 ( .I(\intadd_1/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U9 ( .I(\intadd_1/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U10 ( .I(\intadd_1/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U11 ( .I(\intadd_1/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U12 ( .I(\intadd_1/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U13 ( .I(\intadd_1/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U14 ( .I(\intadd_1/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U15 ( .I(\intadd_1/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U16 ( .I(\intadd_1/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U17 ( .I(\intadd_1/SUM[9] ), .ZN(MUL_RESULT[12]) );
  ND3D0HVT U18 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .A3(MUL_OP_B[1]), .ZN(n60) );
  INVD0HVT U19 ( .I(MUL_OP_A[2]), .ZN(n11) );
  CKND2D0HVT U20 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n34) );
  CKND2D0HVT U21 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n66) );
  INVD0HVT U22 ( .I(n66), .ZN(n52) );
  NR2D0HVT U23 ( .A1(n34), .A2(n52), .ZN(n61) );
  INVD0HVT U24 ( .I(n61), .ZN(n29) );
  INVD0HVT U25 ( .I(MUL_OP_A[1]), .ZN(n63) );
  CKND2D0HVT U26 ( .A1(n1), .A2(n63), .ZN(n2) );
  OAI221D0HVT U27 ( .A1(MUL_OP_A[2]), .A2(n60), .B1(n11), .B2(n29), .C(n2), 
        .ZN(n35) );
  CKND2D0HVT U28 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n7) );
  NR2D0HVT U29 ( .A1(n52), .A2(n7), .ZN(n4) );
  INVD0HVT U30 ( .I(n7), .ZN(n8) );
  NR2D0HVT U31 ( .A1(n8), .A2(n66), .ZN(n3) );
  NR2D0HVT U32 ( .A1(n4), .A2(n3), .ZN(n59) );
  OAI211D0HVT U33 ( .A1(n34), .A2(n63), .B(n52), .C(n33), .ZN(n64) );
  OAI21D0HVT U34 ( .A1(n59), .A2(n33), .B(n64), .ZN(n36) );
  CKND2D0HVT U35 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n32) );
  INVD0HVT U36 ( .I(n32), .ZN(n31) );
  INVD0HVT U37 ( .I(n59), .ZN(n6) );
  NR3D0HVT U38 ( .A1(n52), .A2(n8), .A3(n32), .ZN(n5) );
  AOI31D0HVT U39 ( .A1(n31), .A2(n33), .A3(n6), .B(n5), .ZN(\intadd_1/B[0] )
         );
  AOI33D0HVT U40 ( .A1(n52), .A2(n8), .A3(n32), .B1(n31), .B2(n7), .B3(n66), 
        .ZN(n58) );
  AOI22D0HVT U41 ( .A1(MUL_OP_A[0]), .A2(n32), .B1(n31), .B2(n33), .ZN(n9) );
  AOI22D0HVT U42 ( .A1(MUL_OP_A[1]), .A2(n32), .B1(n31), .B2(n63), .ZN(n12) );
  OAI22D0HVT U43 ( .A1(n58), .A2(n9), .B1(n59), .B2(n12), .ZN(n37) );
  INVD0HVT U44 ( .I(MUL_OP_A[3]), .ZN(n14) );
  CKND2D0HVT U45 ( .A1(n1), .A2(n11), .ZN(n10) );
  OAI221D0HVT U46 ( .A1(MUL_OP_A[3]), .A2(n60), .B1(n14), .B2(n29), .C(n10), 
        .ZN(n38) );
  CKND2D0HVT U47 ( .A1(n37), .A2(n38), .ZN(\intadd_1/B[1] ) );
  AOI22D0HVT U48 ( .A1(MUL_OP_A[2]), .A2(n32), .B1(n31), .B2(n11), .ZN(n15) );
  OAI22D0HVT U49 ( .A1(n58), .A2(n12), .B1(n59), .B2(n15), .ZN(n39) );
  INVD0HVT U50 ( .I(MUL_OP_A[4]), .ZN(n17) );
  CKND2D0HVT U51 ( .A1(n1), .A2(n14), .ZN(n13) );
  OAI221D0HVT U52 ( .A1(MUL_OP_A[4]), .A2(n60), .B1(n17), .B2(n29), .C(n13), 
        .ZN(n40) );
  CKND2D0HVT U53 ( .A1(n39), .A2(n40), .ZN(\intadd_1/B[2] ) );
  AOI22D0HVT U54 ( .A1(n31), .A2(n14), .B1(MUL_OP_A[3]), .B2(n32), .ZN(n18) );
  OAI22D0HVT U55 ( .A1(n58), .A2(n15), .B1(n59), .B2(n18), .ZN(n41) );
  CKND2D0HVT U56 ( .A1(n1), .A2(n17), .ZN(n16) );
  OAI221D0HVT U57 ( .A1(MUL_OP_A[5]), .A2(n60), .B1(n20), .B2(n29), .C(n16), 
        .ZN(n42) );
  AOI22D0HVT U58 ( .A1(n31), .A2(n17), .B1(MUL_OP_A[4]), .B2(n32), .ZN(n21) );
  OAI22D0HVT U59 ( .A1(n58), .A2(n18), .B1(n59), .B2(n21), .ZN(n43) );
  INVD0HVT U60 ( .I(MUL_OP_A[6]), .ZN(n23) );
  CKND2D0HVT U61 ( .A1(n1), .A2(n20), .ZN(n19) );
  OAI221D0HVT U62 ( .A1(MUL_OP_A[6]), .A2(n60), .B1(n23), .B2(n29), .C(n19), 
        .ZN(n44) );
  CKND2D0HVT U63 ( .A1(n43), .A2(n44), .ZN(\intadd_1/B[4] ) );
  AOI22D0HVT U64 ( .A1(n31), .A2(n20), .B1(MUL_OP_A[5]), .B2(n32), .ZN(n24) );
  OAI22D0HVT U65 ( .A1(n58), .A2(n21), .B1(n59), .B2(n24), .ZN(n45) );
  INVD0HVT U66 ( .I(MUL_OP_A[7]), .ZN(n26) );
  CKND2D0HVT U67 ( .A1(n1), .A2(n23), .ZN(n22) );
  OAI221D0HVT U68 ( .A1(MUL_OP_A[7]), .A2(n60), .B1(n26), .B2(n29), .C(n22), 
        .ZN(n46) );
  CKND2D0HVT U69 ( .A1(n45), .A2(n46), .ZN(\intadd_1/B[5] ) );
  AOI22D0HVT U70 ( .A1(n31), .A2(n23), .B1(MUL_OP_A[6]), .B2(n32), .ZN(n27) );
  INVD0HVT U71 ( .I(MUL_OP_A[8]), .ZN(n30) );
  CKND2D0HVT U72 ( .A1(n1), .A2(n26), .ZN(n25) );
  OAI221D0HVT U73 ( .A1(MUL_OP_A[8]), .A2(n60), .B1(n30), .B2(n29), .C(n25), 
        .ZN(n48) );
  CKND2D0HVT U74 ( .A1(n47), .A2(n48), .ZN(\intadd_1/B[6] ) );
  AOI22D0HVT U75 ( .A1(n31), .A2(n26), .B1(MUL_OP_A[7]), .B2(n32), .ZN(n54) );
  OAI22D0HVT U76 ( .A1(n58), .A2(n27), .B1(n59), .B2(n54), .ZN(n49) );
  INVD0HVT U77 ( .I(MUL_OP_A[9]), .ZN(n51) );
  CKND2D0HVT U78 ( .A1(n1), .A2(n30), .ZN(n28) );
  OAI221D0HVT U79 ( .A1(MUL_OP_A[9]), .A2(n60), .B1(n51), .B2(n29), .C(n28), 
        .ZN(n50) );
  CKND2D0HVT U80 ( .A1(n49), .A2(n50), .ZN(\intadd_1/B[7] ) );
  AOI22D0HVT U81 ( .A1(n31), .A2(n30), .B1(MUL_OP_A[8]), .B2(n32), .ZN(n53) );
  AOI22D0HVT U82 ( .A1(MUL_OP_A[9]), .A2(n32), .B1(n31), .B2(n51), .ZN(n57) );
  OAI22D0HVT U83 ( .A1(n58), .A2(n53), .B1(n59), .B2(n57), .ZN(\intadd_1/A[8] ) );
  INVD0HVT U84 ( .I(\intadd_1/A[8] ), .ZN(\intadd_1/B[9] ) );
  NR2D0HVT U85 ( .A1(n34), .A2(n33), .ZN(MUL_RESULT[0]) );
  OA21D0HVT U86 ( .A1(n36), .A2(n35), .B(\intadd_1/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U87 ( .A1(n38), .A2(n37), .B(\intadd_1/B[1] ), .ZN(
        \intadd_1/A[0] ) );
  OAI21D0HVT U88 ( .A1(n40), .A2(n39), .B(\intadd_1/B[2] ), .ZN(
        \intadd_1/A[1] ) );
  OAI21D0HVT U89 ( .A1(n42), .A2(n41), .B(\intadd_1/B[3] ), .ZN(
        \intadd_1/A[2] ) );
  OAI21D0HVT U90 ( .A1(n44), .A2(n43), .B(\intadd_1/B[4] ), .ZN(
        \intadd_1/A[3] ) );
  OAI21D0HVT U91 ( .A1(n46), .A2(n45), .B(\intadd_1/B[5] ), .ZN(
        \intadd_1/A[4] ) );
  OAI21D0HVT U92 ( .A1(n48), .A2(n47), .B(\intadd_1/B[6] ), .ZN(
        \intadd_1/A[5] ) );
  OAI21D0HVT U93 ( .A1(n50), .A2(n49), .B(\intadd_1/B[7] ), .ZN(
        \intadd_1/A[6] ) );
  AOI22D0HVT U94 ( .A1(MUL_OP_A[9]), .A2(n61), .B1(n52), .B2(n51), .ZN(n56) );
  OAI22D0HVT U95 ( .A1(n58), .A2(n54), .B1(n59), .B2(n53), .ZN(n55) );
  NR2D0HVT U96 ( .A1(n56), .A2(n55), .ZN(\intadd_1/B[8] ) );
  AOI21D0HVT U97 ( .A1(n56), .A2(n55), .B(\intadd_1/B[8] ), .ZN(
        \intadd_1/A[7] ) );
  AOI21D0HVT U98 ( .A1(n59), .A2(n58), .B(n57), .ZN(\intadd_1/A[9] ) );
  INVD0HVT U99 ( .I(n60), .ZN(n62) );
  AOI22D0HVT U100 ( .A1(n63), .A2(n62), .B1(MUL_OP_A[1]), .B2(n61), .ZN(n67)
         );
  INVD0HVT U101 ( .I(n64), .ZN(n65) );
  AOI221D0HVT U102 ( .A1(MUL_RESULT[0]), .A2(n67), .B1(n66), .B2(n67), .C(n65), 
        .ZN(MUL_RESULT[1]) );
endmodule


module ADDER_v2 ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [16:0] ADD_OP_A;
  input [16:0] ADD_OP_B;
  output [16:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_2/A[12] , \intadd_2/A[11] , \intadd_2/A[10] , \intadd_2/A[9] ,
         \intadd_2/A[8] , \intadd_2/A[7] , \intadd_2/A[6] , \intadd_2/A[5] ,
         \intadd_2/A[4] , \intadd_2/A[3] , \intadd_2/A[2] , \intadd_2/A[1] ,
         \intadd_2/A[0] , \intadd_2/B[14] , \intadd_2/B[13] , \intadd_2/B[12] ,
         \intadd_2/B[11] , \intadd_2/B[10] , \intadd_2/B[9] , \intadd_2/B[8] ,
         \intadd_2/B[7] , \intadd_2/B[6] , \intadd_2/B[5] , \intadd_2/B[4] ,
         \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] ,
         \intadd_2/CI , \intadd_2/n15 , \intadd_2/n14 , \intadd_2/n13 ,
         \intadd_2/n12 , \intadd_2/n11 , \intadd_2/n10 , \intadd_2/n9 ,
         \intadd_2/n8 , \intadd_2/n7 , \intadd_2/n6 , \intadd_2/n5 ,
         \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 , n1, n2,
         n3, n4;

  FA1D0HVT \intadd_2/U16  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n15 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_2/U15  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n15 ), .CO(\intadd_2/n14 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_2/U14  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n14 ), .CO(\intadd_2/n13 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_2/U13  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n13 ), .CO(\intadd_2/n12 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_2/U12  ( .A(\intadd_2/A[4] ), .B(\intadd_2/B[4] ), .CI(
        \intadd_2/n12 ), .CO(\intadd_2/n11 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_2/U11  ( .A(\intadd_2/A[5] ), .B(\intadd_2/B[5] ), .CI(
        \intadd_2/n11 ), .CO(\intadd_2/n10 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_2/U10  ( .A(\intadd_2/A[6] ), .B(\intadd_2/B[6] ), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_2/U9  ( .A(\intadd_2/A[7] ), .B(\intadd_2/B[7] ), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_2/U8  ( .A(\intadd_2/A[8] ), .B(\intadd_2/B[8] ), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_2/U7  ( .A(\intadd_2/A[9] ), .B(\intadd_2/B[9] ), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_2/U6  ( .A(\intadd_2/A[10] ), .B(\intadd_2/B[10] ), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_2/U5  ( .A(\intadd_2/A[11] ), .B(\intadd_2/B[11] ), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(ADD_RESULT[12]) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[12] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(ADD_RESULT[13]) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[13] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(ADD_RESULT[14]) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[14] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(ADD_RESULT[15]) );
  AN3D0HVT U2 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_2/B[0] ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_2/A[7] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_2/CI ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_2/A[0] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_2/B[1] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_2/A[1] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_2/B[2] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_2/A[2] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_2/B[3] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_2/A[3] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_2/B[4] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_2/A[4] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_2/B[5] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_2/A[5] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_2/B[6] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_2/A[6] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_2/B[7] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_B[9]), .A2(ADD_EN), .Z(\intadd_2/B[8] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_2/A[8] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_B[10]), .A2(ADD_EN), .Z(\intadd_2/B[9] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_2/A[9] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_B[11]), .A2(ADD_EN), .Z(\intadd_2/B[10] ) );
  CKAN2D0HVT U24 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_2/A[10] ) );
  CKAN2D0HVT U25 ( .A1(ADD_OP_B[12]), .A2(ADD_EN), .Z(\intadd_2/B[11] ) );
  CKAN2D0HVT U26 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_2/A[11] ) );
  CKAN2D0HVT U27 ( .A1(ADD_OP_B[13]), .A2(ADD_EN), .Z(\intadd_2/B[12] ) );
  CKAN2D0HVT U28 ( .A1(ADD_OP_B[14]), .A2(ADD_EN), .Z(\intadd_2/B[13] ) );
  CKAN2D0HVT U29 ( .A1(ADD_OP_B[15]), .A2(ADD_EN), .Z(\intadd_2/B[14] ) );
  CKAN2D0HVT U30 ( .A1(ADD_OP_A[13]), .A2(ADD_EN), .Z(\intadd_2/A[12] ) );
  INVD0HVT U31 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U32 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U33 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U34 ( .A1(ADD_OP_A[13]), .A2(ADD_OP_B[16]), .ZN(n3) );
  OAI211D0HVT U35 ( .A1(ADD_OP_A[13]), .A2(ADD_OP_B[16]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U36 ( .A1(\intadd_2/n1 ), .A2(n4), .ZN(ADD_RESULT[16]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module newMAC_v3 ( clk, rst_n, en, data_valid, weight, activation, reset, acc, 
        output_valid, output_result );
  input [3:0] weight;
  input [7:0] activation;
  output [16:0] output_result;
  input clk, rst_n, en, data_valid, reset, acc;
  output output_valid;
  wire   zero_flag, update_Flag, N74, inACC, N136, N137, N138, N139, N140,
         N141, N142, N143, N144, N145, N146, N147, N148, N149, N150, N151,
         N152, N153, ren_IS, net330, n35, n36, n37, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72;
  wire   [2:0] index;
  wire   [9:0] ADD_OP_A;
  wire   [9:0] ADD_OP_B;
  wire   [9:0] data_A_READ_DATA;
  wire   [2:0] MUL_CNT;
  wire   [3:0] MUL_CNT_PLUS_1;
  wire   [13:0] MUL_RESULT;
  wire   [16:0] MUL_ADD_OPA;
  wire   [16:0] MUL_ADD_OPB;
  wire   [16:0] ADD_RESULT_V2;
  wire   [2:0] addr_B_IS;
  assign N74 = activation[0];

  indexGen u_indexGen ( .data_valid(data_valid), .weight(weight), .activation(
        {activation[7:1], N74}), .index(index), .zero(zero_flag) );
  internalStorage u_internalStorage ( .clk(clk), .rst_n(rst_n), .en(1'b0), 
        .reset(reset), .wen(update_Flag), .addr_A(index), .data_A(
        data_A_READ_DATA), .ren(ren_IS), .addr_B(addr_B_IS), .data_B(ADD_OP_A)
         );
  ADDER u_ADDER ( .ADD_EN(update_Flag), .ADD_OP_A(ADD_OP_A), .ADD_OP_B({1'b0, 
        ADD_OP_B[9], ADD_OP_B[7:0]}), .ADD_RESULT(data_A_READ_DATA) );
  MULTIPLIER u_MULTIPLIER ( .MUL_EN(inACC), .MUL_OP_A(ADD_OP_A), .MUL_OP_B(
        MUL_CNT_PLUS_1), .MUL_RESULT(MUL_RESULT) );
  ADDER_v2 u_ADDER_v2 ( .ADD_EN(inACC), .ADD_OP_A({1'b0, 1'b0, 1'b0, 
        MUL_ADD_OPA[16], MUL_ADD_OPA[12:0]}), .ADD_OP_B(MUL_ADD_OPB), 
        .ADD_RESULT(ADD_RESULT_V2) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v3 clk_gate_output_valid_reg ( .CLK(clk), .EN(
        N153), .ENCLK(net330), .TE(n39) );
  DFCNQD1HVT \MUL_CNT_reg[0]  ( .D(n37), .CP(clk), .CDN(rst_n), .Q(MUL_CNT[0])
         );
  DFCNQD1HVT \MUL_CNT_reg[1]  ( .D(n35), .CP(net330), .CDN(rst_n), .Q(
        MUL_CNT[1]) );
  DFCNQD1HVT \MUL_CNT_reg[2]  ( .D(n36), .CP(net330), .CDN(rst_n), .Q(
        MUL_CNT[2]) );
  DFCNQD1HVT output_valid_reg ( .D(MUL_CNT_PLUS_1[3]), .CP(net330), .CDN(rst_n), .Q(output_valid) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N149), .CP(net330), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N150), .CP(net330), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N151), .CP(net330), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N152), .CP(net330), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N148), .CP(net330), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N147), .CP(net330), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N146), .CP(net330), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N145), .CP(net330), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N144), .CP(net330), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N143), .CP(net330), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N142), .CP(net330), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N141), .CP(net330), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N140), .CP(net330), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N139), .CP(net330), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N138), .CP(net330), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N137), .CP(net330), .CDN(rst_n), .Q(
        output_result[1]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N136), .CP(net330), .CDN(rst_n), .Q(
        output_result[0]) );
  TIELHVT U108 ( .ZN(n39) );
  INVD0HVT U109 ( .I(weight[3]), .ZN(n41) );
  CKAN2D0HVT U110 ( .A1(MUL_RESULT[1]), .A2(inACC), .Z(MUL_ADD_OPA[1]) );
  CKAN2D0HVT U111 ( .A1(ADD_RESULT_V2[8]), .A2(inACC), .Z(N144) );
  IND2D0HVT U112 ( .A1(zero_flag), .B1(data_valid), .ZN(n67) );
  INVD0HVT U113 ( .I(n67), .ZN(update_Flag) );
  NR4D1HVT U114 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[2]), .A3(MUL_CNT[1]), .A4(acc), 
        .ZN(n63) );
  INVD1HVT U115 ( .I(n63), .ZN(inACC) );
  CKND2D0HVT U116 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .ZN(n64) );
  IND2D0HVT U117 ( .A1(n64), .B1(en), .ZN(n71) );
  OA221D0HVT U118 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .B1(en), .B2(MUL_CNT[1]), 
        .C(n71), .Z(n35) );
  NR3D0HVT U119 ( .A1(weight[0]), .A2(weight[2]), .A3(weight[1]), .ZN(n40) );
  MUX2ND0HVT U120 ( .I0(n41), .I1(weight[3]), .S(n40), .ZN(n42) );
  CKND2D0HVT U121 ( .A1(update_Flag), .A2(n42), .ZN(n58) );
  NR3D0HVT U122 ( .A1(activation[2]), .A2(N74), .A3(activation[1]), .ZN(n53)
         );
  OR2D0HVT U123 ( .A1(n58), .A2(n53), .Z(n45) );
  INVD0HVT U124 ( .I(N74), .ZN(n65) );
  INVD0HVT U125 ( .I(activation[1]), .ZN(n69) );
  CKND2D0HVT U126 ( .A1(n65), .A2(n69), .ZN(n44) );
  INVD0HVT U127 ( .I(n42), .ZN(n66) );
  CKND2D0HVT U128 ( .A1(update_Flag), .A2(n66), .ZN(n57) );
  INVD0HVT U129 ( .I(activation[2]), .ZN(n43) );
  OAI222D0HVT U130 ( .A1(n45), .A2(n44), .B1(n45), .B2(activation[2]), .C1(n57), .C2(n43), .ZN(ADD_OP_B[2]) );
  INVD0HVT U131 ( .I(activation[3]), .ZN(n51) );
  CKND2D0HVT U132 ( .A1(n53), .A2(n51), .ZN(n47) );
  NR2D0HVT U133 ( .A1(activation[4]), .A2(n47), .ZN(n56) );
  OR2D0HVT U134 ( .A1(n56), .A2(n58), .Z(n48) );
  INVD0HVT U135 ( .I(activation[4]), .ZN(n46) );
  OAI222D0HVT U136 ( .A1(n48), .A2(n47), .B1(n48), .B2(activation[4]), .C1(n57), .C2(n46), .ZN(ADD_OP_B[4]) );
  CKND2D0HVT U137 ( .A1(n63), .A2(n67), .ZN(ren_IS) );
  CKAN2D0HVT U138 ( .A1(ADD_RESULT_V2[0]), .A2(inACC), .Z(N136) );
  CKAN2D0HVT U139 ( .A1(ADD_RESULT_V2[1]), .A2(inACC), .Z(N137) );
  CKAN2D0HVT U140 ( .A1(ADD_RESULT_V2[2]), .A2(inACC), .Z(N138) );
  CKAN2D0HVT U141 ( .A1(ADD_RESULT_V2[3]), .A2(inACC), .Z(N139) );
  CKAN2D0HVT U142 ( .A1(ADD_RESULT_V2[4]), .A2(inACC), .Z(N140) );
  INVD0HVT U143 ( .I(activation[7]), .ZN(n50) );
  INVD0HVT U144 ( .I(activation[5]), .ZN(n54) );
  CKND2D0HVT U145 ( .A1(n56), .A2(n54), .ZN(n60) );
  NR2D0HVT U146 ( .A1(activation[6]), .A2(n60), .ZN(n59) );
  XNR2D0HVT U147 ( .A1(n50), .A2(n59), .ZN(n49) );
  OAI22D0HVT U148 ( .A1(n49), .A2(n58), .B1(n50), .B2(n57), .ZN(ADD_OP_B[7])
         );
  AOI22D0HVT U149 ( .A1(activation[7]), .A2(n57), .B1(n58), .B2(n50), .ZN(
        ADD_OP_B[9]) );
  CKAN2D0HVT U150 ( .A1(ADD_RESULT_V2[5]), .A2(inACC), .Z(N141) );
  CKAN2D0HVT U151 ( .A1(ADD_RESULT_V2[6]), .A2(inACC), .Z(N142) );
  CKAN2D0HVT U152 ( .A1(ADD_RESULT_V2[7]), .A2(inACC), .Z(N143) );
  CKAN2D0HVT U153 ( .A1(ADD_RESULT_V2[9]), .A2(inACC), .Z(N145) );
  CKAN2D0HVT U154 ( .A1(ADD_RESULT_V2[10]), .A2(inACC), .Z(N146) );
  CKAN2D0HVT U155 ( .A1(ADD_RESULT_V2[11]), .A2(inACC), .Z(N147) );
  CKAN2D0HVT U156 ( .A1(ADD_RESULT_V2[12]), .A2(inACC), .Z(N148) );
  CKAN2D0HVT U157 ( .A1(ADD_RESULT_V2[13]), .A2(inACC), .Z(N149) );
  CKAN2D0HVT U158 ( .A1(ADD_RESULT_V2[14]), .A2(inACC), .Z(N150) );
  CKAN2D0HVT U159 ( .A1(ADD_RESULT_V2[15]), .A2(inACC), .Z(N151) );
  CKAN2D0HVT U160 ( .A1(ADD_RESULT_V2[16]), .A2(inACC), .Z(N152) );
  CKAN2D0HVT U161 ( .A1(MUL_RESULT[0]), .A2(inACC), .Z(MUL_ADD_OPA[0]) );
  CKAN2D0HVT U162 ( .A1(MUL_RESULT[2]), .A2(inACC), .Z(MUL_ADD_OPA[2]) );
  CKAN2D0HVT U163 ( .A1(MUL_RESULT[3]), .A2(inACC), .Z(MUL_ADD_OPA[3]) );
  CKAN2D0HVT U164 ( .A1(MUL_RESULT[4]), .A2(inACC), .Z(MUL_ADD_OPA[4]) );
  CKAN2D0HVT U165 ( .A1(MUL_RESULT[5]), .A2(inACC), .Z(MUL_ADD_OPA[5]) );
  CKAN2D0HVT U166 ( .A1(MUL_RESULT[6]), .A2(inACC), .Z(MUL_ADD_OPA[6]) );
  CKAN2D0HVT U167 ( .A1(MUL_RESULT[7]), .A2(inACC), .Z(MUL_ADD_OPA[7]) );
  CKAN2D0HVT U168 ( .A1(MUL_RESULT[8]), .A2(inACC), .Z(MUL_ADD_OPA[8]) );
  CKAN2D0HVT U169 ( .A1(MUL_RESULT[9]), .A2(inACC), .Z(MUL_ADD_OPA[9]) );
  CKAN2D0HVT U170 ( .A1(MUL_RESULT[10]), .A2(inACC), .Z(MUL_ADD_OPA[10]) );
  CKAN2D0HVT U171 ( .A1(MUL_RESULT[11]), .A2(inACC), .Z(MUL_ADD_OPA[11]) );
  CKAN2D0HVT U172 ( .A1(MUL_RESULT[12]), .A2(inACC), .Z(MUL_ADD_OPA[12]) );
  CKAN2D0HVT U173 ( .A1(MUL_RESULT[13]), .A2(inACC), .Z(MUL_ADD_OPA[16]) );
  OA21D0HVT U174 ( .A1(reset), .A2(inACC), .B(en), .Z(N153) );
  NR2D0HVT U175 ( .A1(n67), .A2(n65), .ZN(ADD_OP_B[0]) );
  OAI21D0HVT U176 ( .A1(n53), .A2(n66), .B(update_Flag), .ZN(n52) );
  OAI32D0HVT U177 ( .A1(activation[3]), .A2(n53), .A3(n58), .B1(n52), .B2(n51), 
        .ZN(ADD_OP_B[3]) );
  OAI21D0HVT U178 ( .A1(n56), .A2(n66), .B(update_Flag), .ZN(n55) );
  OAI32D0HVT U179 ( .A1(activation[5]), .A2(n56), .A3(n58), .B1(n55), .B2(n54), 
        .ZN(ADD_OP_B[5]) );
  INVD0HVT U180 ( .I(n57), .ZN(n62) );
  AOI211D0HVT U181 ( .A1(activation[6]), .A2(n60), .B(n59), .C(n58), .ZN(n61)
         );
  AO21D0HVT U182 ( .A1(n62), .A2(activation[6]), .B(n61), .Z(ADD_OP_B[6]) );
  INR2D0HVT U183 ( .A1(output_result[16]), .B1(n63), .ZN(MUL_ADD_OPB[16]) );
  INR2D0HVT U184 ( .A1(output_result[1]), .B1(n63), .ZN(MUL_ADD_OPB[1]) );
  INR2D0HVT U185 ( .A1(output_result[0]), .B1(n63), .ZN(MUL_ADD_OPB[0]) );
  INR2D0HVT U186 ( .A1(output_result[2]), .B1(n63), .ZN(MUL_ADD_OPB[2]) );
  INR2D0HVT U187 ( .A1(output_result[3]), .B1(n63), .ZN(MUL_ADD_OPB[3]) );
  INR2D0HVT U188 ( .A1(output_result[4]), .B1(n63), .ZN(MUL_ADD_OPB[4]) );
  INR2D0HVT U189 ( .A1(output_result[5]), .B1(n63), .ZN(MUL_ADD_OPB[5]) );
  INR2D0HVT U190 ( .A1(output_result[6]), .B1(n63), .ZN(MUL_ADD_OPB[6]) );
  INR2D0HVT U191 ( .A1(output_result[7]), .B1(n63), .ZN(MUL_ADD_OPB[7]) );
  INR2D0HVT U192 ( .A1(output_result[8]), .B1(n63), .ZN(MUL_ADD_OPB[8]) );
  INR2D0HVT U193 ( .A1(output_result[9]), .B1(n63), .ZN(MUL_ADD_OPB[9]) );
  INR2D0HVT U194 ( .A1(output_result[10]), .B1(n63), .ZN(MUL_ADD_OPB[10]) );
  INR2D0HVT U195 ( .A1(output_result[11]), .B1(n63), .ZN(MUL_ADD_OPB[11]) );
  INR2D0HVT U196 ( .A1(output_result[12]), .B1(n63), .ZN(MUL_ADD_OPB[12]) );
  INR2D0HVT U197 ( .A1(output_result[13]), .B1(n63), .ZN(MUL_ADD_OPB[13]) );
  INR2D0HVT U198 ( .A1(output_result[14]), .B1(n63), .ZN(MUL_ADD_OPB[14]) );
  INR2D0HVT U199 ( .A1(output_result[15]), .B1(n63), .ZN(MUL_ADD_OPB[15]) );
  NR2D0HVT U200 ( .A1(MUL_CNT[0]), .A2(n63), .ZN(MUL_CNT_PLUS_1[0]) );
  AO21D0HVT U201 ( .A1(n63), .A2(index[2]), .B(MUL_CNT[2]), .Z(addr_B_IS[2])
         );
  AO21D0HVT U202 ( .A1(n63), .A2(index[0]), .B(MUL_CNT[0]), .Z(addr_B_IS[0])
         );
  AO21D0HVT U203 ( .A1(n63), .A2(index[1]), .B(MUL_CNT[1]), .Z(addr_B_IS[1])
         );
  INVD0HVT U204 ( .I(MUL_CNT[2]), .ZN(n72) );
  NR2D0HVT U205 ( .A1(n72), .A2(n64), .ZN(MUL_CNT_PLUS_1[3]) );
  AOI21D0HVT U206 ( .A1(n72), .A2(n64), .B(MUL_CNT_PLUS_1[3]), .ZN(
        MUL_CNT_PLUS_1[2]) );
  OA21D0HVT U207 ( .A1(MUL_CNT[0]), .A2(MUL_CNT[1]), .B(n64), .Z(
        MUL_CNT_PLUS_1[1]) );
  NR2D0HVT U208 ( .A1(n66), .A2(n65), .ZN(n70) );
  INVD0HVT U209 ( .I(n70), .ZN(n68) );
  AOI221D0HVT U210 ( .A1(activation[1]), .A2(n70), .B1(n69), .B2(n68), .C(n67), 
        .ZN(ADD_OP_B[1]) );
  MUX2D0HVT U211 ( .I0(MUL_CNT[0]), .I1(MUL_CNT_PLUS_1[0]), .S(en), .Z(n37) );
  MUX2ND0HVT U212 ( .I0(MUL_CNT[2]), .I1(n72), .S(n71), .ZN(n36) );
endmodule

