/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jan 30 12:09:07 2026
/////////////////////////////////////////////////////////////


module inputGen ( en, data_valid, weight, activation, data_valid_out, 
        weight_check, compute_check, weight_idx, activation_out );
  input [7:0] weight;
  input [7:0] activation;
  output [7:0] weight_idx;
  output [13:0] activation_out;
  input en, data_valid;
  output data_valid_out, weight_check, compute_check;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45;
  assign activation_out[0] = activation[0];

  INVD0HVT U3 ( .I(activation[7]), .ZN(n40) );
  INVD0HVT U4 ( .I(activation[4]), .ZN(n30) );
  NR3D0HVT U5 ( .A1(weight[2]), .A2(weight[0]), .A3(weight[1]), .ZN(n5) );
  NR4D0HVT U6 ( .A1(weight[6]), .A2(weight[3]), .A3(weight[4]), .A4(weight[5]), 
        .ZN(n1) );
  CKND2D0HVT U7 ( .A1(n5), .A2(n1), .ZN(n25) );
  OAI21D0HVT U8 ( .A1(weight[7]), .A2(n25), .B(data_valid), .ZN(n19) );
  INVD0HVT U9 ( .I(n19), .ZN(weight_check) );
  CKND2D0HVT U10 ( .A1(weight[7]), .A2(data_valid), .ZN(n24) );
  INVD0HVT U11 ( .I(n24), .ZN(n6) );
  CKND2D0HVT U12 ( .A1(n6), .A2(n25), .ZN(n41) );
  NR2D0HVT U13 ( .A1(weight[0]), .A2(weight[1]), .ZN(n2) );
  NR2D0HVT U14 ( .A1(n41), .A2(n2), .ZN(n4) );
  CKND2D0HVT U15 ( .A1(data_valid), .A2(weight[2]), .ZN(n3) );
  XNR2D0HVT U16 ( .A1(n4), .A2(n3), .ZN(weight_idx[2]) );
  CKND2D0HVT U17 ( .A1(weight[3]), .A2(data_valid), .ZN(n8) );
  INVD0HVT U18 ( .I(n5), .ZN(n9) );
  CKND2D0HVT U19 ( .A1(n6), .A2(n9), .ZN(n7) );
  CKXOR2D0HVT U20 ( .A1(n8), .A2(n7), .Z(weight_idx[3]) );
  CKND2D0HVT U21 ( .A1(weight[5]), .A2(data_valid), .ZN(n11) );
  INVD0HVT U22 ( .I(n41), .ZN(n35) );
  NR2D0HVT U23 ( .A1(weight[3]), .A2(n9), .ZN(n42) );
  CKND2D0HVT U24 ( .A1(weight[4]), .A2(data_valid), .ZN(n45) );
  CKND2D0HVT U25 ( .A1(n42), .A2(n45), .ZN(n12) );
  CKND2D0HVT U26 ( .A1(n35), .A2(n12), .ZN(n10) );
  CKXOR2D0HVT U27 ( .A1(n11), .A2(n10), .Z(weight_idx[5]) );
  OAI21D0HVT U28 ( .A1(weight[5]), .A2(n12), .B(n35), .ZN(n14) );
  NR2D0HVT U29 ( .A1(weight[6]), .A2(n14), .ZN(n13) );
  AO31D0HVT U30 ( .A1(weight[6]), .A2(n14), .A3(data_valid), .B(n13), .Z(
        weight_idx[6]) );
  NR2D0HVT U31 ( .A1(activation[0]), .A2(activation[1]), .ZN(n16) );
  OAI21D0HVT U32 ( .A1(n16), .A2(n41), .B(activation[2]), .ZN(n15) );
  OAI31D0HVT U33 ( .A1(activation[2]), .A2(n16), .A3(n41), .B(n15), .ZN(
        activation_out[2]) );
  NR3D0HVT U34 ( .A1(activation[2]), .A2(activation[0]), .A3(activation[1]), 
        .ZN(n18) );
  OAI21D0HVT U35 ( .A1(n18), .A2(n41), .B(activation[3]), .ZN(n17) );
  OAI31D0HVT U36 ( .A1(activation[3]), .A2(n18), .A3(n41), .B(n17), .ZN(
        activation_out[3]) );
  OR4D0HVT U37 ( .A1(activation[3]), .A2(activation[2]), .A3(activation[0]), 
        .A4(activation[1]), .Z(n28) );
  NR2D0HVT U38 ( .A1(activation[4]), .A2(n28), .ZN(n31) );
  INVD0HVT U39 ( .I(activation[5]), .ZN(n33) );
  CKND2D0HVT U40 ( .A1(n31), .A2(n33), .ZN(n34) );
  NR2D0HVT U41 ( .A1(activation[6]), .A2(n34), .ZN(n38) );
  OAI32D0HVT U42 ( .A1(activation[7]), .A2(n38), .A3(n41), .B1(n35), .B2(n40), 
        .ZN(activation_out[8]) );
  AOI21D0HVT U43 ( .A1(n38), .A2(n40), .B(n19), .ZN(compute_check) );
  INVD0HVT U44 ( .I(weight[0]), .ZN(n20) );
  INVD0HVT U45 ( .I(data_valid), .ZN(n22) );
  NR2D0HVT U46 ( .A1(n20), .A2(n22), .ZN(weight_idx[0]) );
  NR2D0HVT U47 ( .A1(n20), .A2(n41), .ZN(n23) );
  NR2D0HVT U48 ( .A1(weight[1]), .A2(n23), .ZN(n21) );
  AOI211D0HVT U49 ( .A1(weight[1]), .A2(n23), .B(n22), .C(n21), .ZN(
        weight_idx[1]) );
  NR2D0HVT U50 ( .A1(n25), .A2(n24), .ZN(weight_idx[7]) );
  INVD0HVT U51 ( .I(activation[1]), .ZN(n27) );
  CKND2D0HVT U52 ( .A1(n35), .A2(activation[0]), .ZN(n26) );
  MUX2ND0HVT U53 ( .I0(activation[1]), .I1(n27), .S(n26), .ZN(
        activation_out[1]) );
  CKND2D0HVT U54 ( .A1(n35), .A2(n28), .ZN(n29) );
  MUX2ND0HVT U55 ( .I0(activation[4]), .I1(n30), .S(n29), .ZN(
        activation_out[4]) );
  NR2D0HVT U56 ( .A1(n31), .A2(n41), .ZN(n32) );
  MUX2ND0HVT U57 ( .I0(n33), .I1(activation[5]), .S(n32), .ZN(
        activation_out[5]) );
  INVD0HVT U58 ( .I(activation[6]), .ZN(n37) );
  CKND2D0HVT U59 ( .A1(n35), .A2(n34), .ZN(n36) );
  MUX2ND0HVT U60 ( .I0(activation[6]), .I1(n37), .S(n36), .ZN(
        activation_out[6]) );
  NR2D0HVT U61 ( .A1(n38), .A2(n41), .ZN(n39) );
  MUX2ND0HVT U62 ( .I0(n40), .I1(activation[7]), .S(n39), .ZN(
        activation_out[7]) );
  INVD0HVT U63 ( .I(n45), .ZN(n44) );
  NR2D0HVT U64 ( .A1(n42), .A2(n41), .ZN(n43) );
  MUX2ND0HVT U65 ( .I0(n45), .I1(n44), .S(n43), .ZN(weight_idx[4]) );
endmodule


module action_arbiter ( data_valid_out, acc, compute_check, weight, 
        weight_last, ACC, MUL );
  input [7:0] weight;
  input [7:0] weight_last;
  input data_valid_out, acc, compute_check;
  output ACC, MUL;
  wire   compute_check, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20;
  assign ACC = compute_check;

  OAI22D0HVT U1 ( .A1(weight_last[0]), .A2(n11), .B1(weight_last[1]), .B2(n12), 
        .ZN(n10) );
  OAI22D0HVT U2 ( .A1(weight_last[2]), .A2(n8), .B1(weight_last[3]), .B2(n9), 
        .ZN(n7) );
  CKND2D0HVT U3 ( .A1(n18), .A2(n17), .ZN(n19) );
  INVD0HVT U4 ( .I(weight[7]), .ZN(n3) );
  INVD0HVT U5 ( .I(weight[6]), .ZN(n2) );
  OAI22D0HVT U6 ( .A1(weight_last[6]), .A2(n2), .B1(weight_last[7]), .B2(n3), 
        .ZN(n1) );
  AOI221D0HVT U7 ( .A1(n3), .A2(weight_last[7]), .B1(n2), .B2(weight_last[6]), 
        .C(n1), .ZN(n16) );
  INVD0HVT U8 ( .I(weight[5]), .ZN(n6) );
  INVD0HVT U9 ( .I(weight[4]), .ZN(n5) );
  OAI22D0HVT U10 ( .A1(weight_last[4]), .A2(n5), .B1(weight_last[5]), .B2(n6), 
        .ZN(n4) );
  AOI221D0HVT U11 ( .A1(n6), .A2(weight_last[5]), .B1(n5), .B2(weight_last[4]), 
        .C(n4), .ZN(n15) );
  INVD0HVT U12 ( .I(weight[3]), .ZN(n9) );
  INVD0HVT U13 ( .I(weight[2]), .ZN(n8) );
  AOI221D0HVT U14 ( .A1(n9), .A2(weight_last[3]), .B1(n8), .B2(weight_last[2]), 
        .C(n7), .ZN(n14) );
  INVD0HVT U15 ( .I(weight[1]), .ZN(n12) );
  INVD0HVT U16 ( .I(weight[0]), .ZN(n11) );
  AOI221D0HVT U17 ( .A1(n12), .A2(weight_last[1]), .B1(n11), .B2(
        weight_last[0]), .C(n10), .ZN(n13) );
  ND4D0HVT U18 ( .A1(n16), .A2(n15), .A3(n14), .A4(n13), .ZN(n20) );
  NR4D0HVT U19 ( .A1(weight[3]), .A2(weight[2]), .A3(weight[1]), .A4(weight[0]), .ZN(n18) );
  NR4D0HVT U20 ( .A1(weight[7]), .A2(weight[6]), .A3(weight[5]), .A4(weight[4]), .ZN(n17) );
  AO21D0HVT U21 ( .A1(n20), .A2(n19), .B(acc), .Z(MUL) );
endmodule


module ADDER ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [13:0] ADD_OP_A;
  input [13:0] ADD_OP_B;
  output [13:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_0/A[11] , \intadd_0/A[6] , \intadd_0/A[5] , \intadd_0/A[4] ,
         \intadd_0/A[3] , \intadd_0/A[2] , \intadd_0/A[1] , \intadd_0/A[0] ,
         \intadd_0/B[11] , \intadd_0/B[10] , \intadd_0/B[9] , \intadd_0/B[8] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/n12 , \intadd_0/n11 , \intadd_0/n10 ,
         \intadd_0/n9 , \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 ,
         \intadd_0/n5 , \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 ,
         \intadd_0/n1 , n1, n2, n3, n4;

  FA1D0HVT \intadd_0/U13  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n12 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_0/U12  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n12 ), .CO(\intadd_0/n11 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_0/U11  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n11 ), .CO(\intadd_0/n10 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_0/U10  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n10 ), .CO(\intadd_0/n9 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/B[11] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/B[11] ), .B(\intadd_0/B[8] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/B[11] ), .B(\intadd_0/B[9] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/B[11] ), .B(\intadd_0/B[10] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[11] ), .B(\intadd_0/B[11] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(ADD_RESULT[12]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_0/A[0] ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_0/A[1] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_0/A[2] ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_0/A[3] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_0/A[4] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_0/A[5] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_0/A[6] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_0/B[7] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_0/B[8] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_0/B[9] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_0/B[10] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_0/A[11] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_0/CI ) );
  AN3D0HVT U15 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_0/B[0] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_0/B[1] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_0/B[2] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_0/B[3] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_0/B[4] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_0/B[5] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_0/B[6] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_0/B[11] ) );
  INVD0HVT U23 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U24 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U25 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U26 ( .A1(ADD_OP_B[8]), .A2(ADD_OP_A[13]), .ZN(n3) );
  OAI211D0HVT U27 ( .A1(ADD_OP_B[8]), .A2(ADD_OP_A[13]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U28 ( .A1(\intadd_0/n1 ), .A2(n4), .ZN(ADD_RESULT[13]) );
endmodule


module MULTIPLIER_V1 ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [13:0] MUL_OP_A;
  input [7:0] MUL_OP_B;
  output [21:0] MUL_RESULT;
  input MUL_EN;
  wire   \mult_x_3/n142 , \mult_x_3/n134 , \mult_x_3/n129 , \mult_x_3/n128 ,
         \mult_x_3/n127 , \mult_x_3/n126 , \mult_x_3/n125 , \mult_x_3/n124 ,
         \mult_x_3/n123 , \mult_x_3/n122 , \mult_x_3/n120 , \mult_x_3/n117 ,
         \mult_x_3/n116 , \mult_x_3/n115 , \mult_x_3/n114 , \mult_x_3/n113 ,
         \mult_x_3/n112 , \mult_x_3/n111 , \mult_x_3/n110 , \mult_x_3/n109 ,
         \mult_x_3/n108 , \mult_x_3/n107 , \mult_x_3/n105 , \mult_x_3/n104 ,
         \mult_x_3/n96 , \mult_x_3/n95 , \mult_x_3/n82 , \mult_x_3/n79 ,
         \mult_x_3/n78 , \mult_x_3/n77 , \mult_x_3/n76 , \mult_x_3/n75 ,
         \mult_x_3/n74 , \mult_x_3/n73 , \mult_x_3/n72 , \mult_x_3/n71 ,
         \mult_x_3/n70 , \mult_x_3/n69 , \mult_x_3/n68 , \mult_x_3/n67 ,
         \mult_x_3/n66 , \mult_x_3/n65 , \mult_x_3/n64 , \mult_x_3/n63 ,
         \mult_x_3/n62 , \mult_x_3/n61 , \mult_x_3/n60 , \mult_x_3/n59 ,
         \mult_x_3/n58 , \mult_x_3/n57 , \mult_x_3/n56 , \mult_x_3/n55 ,
         \mult_x_3/n54 , \mult_x_3/n53 , \mult_x_3/n52 , \mult_x_3/n51 ,
         \mult_x_3/n50 , \mult_x_3/n49 , \mult_x_3/n48 , \mult_x_3/n47 ,
         \mult_x_3/n46 , \mult_x_3/n45 , \mult_x_3/n44 , \mult_x_3/n43 ,
         \mult_x_3/n42 , \mult_x_3/n41 , \mult_x_3/n40 , \mult_x_3/n39 ,
         \mult_x_3/n38 , \mult_x_3/n37 , \mult_x_3/n36 , \mult_x_3/n35 ,
         \mult_x_3/n34 , \mult_x_3/n33 , \mult_x_3/n32 , \mult_x_3/n31 ,
         \mult_x_3/n30 , \mult_x_3/n29 , \intadd_1/A[14] , \intadd_1/A[13] ,
         \intadd_1/A[12] , \intadd_1/A[11] , \intadd_1/A[10] , \intadd_1/A[9] ,
         \intadd_1/A[8] , \intadd_1/A[7] , \intadd_1/A[6] , \intadd_1/A[5] ,
         \intadd_1/A[4] , \intadd_1/A[3] , \intadd_1/A[2] , \intadd_1/A[1] ,
         \intadd_1/A[0] , \intadd_1/B[14] , \intadd_1/B[13] , \intadd_1/B[12] ,
         \intadd_1/B[11] , \intadd_1/B[10] , \intadd_1/B[9] , \intadd_1/B[8] ,
         \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] , \intadd_1/B[4] ,
         \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] , \intadd_1/B[0] ,
         \intadd_1/CI , \intadd_1/SUM[14] , \intadd_1/SUM[13] ,
         \intadd_1/SUM[12] , \intadd_1/SUM[11] , \intadd_1/SUM[10] ,
         \intadd_1/SUM[9] , \intadd_1/SUM[8] , \intadd_1/SUM[7] ,
         \intadd_1/SUM[6] , \intadd_1/SUM[5] , \intadd_1/SUM[4] ,
         \intadd_1/SUM[3] , \intadd_1/SUM[2] , \intadd_1/SUM[1] ,
         \intadd_1/SUM[0] , \intadd_1/n15 , \intadd_1/n14 , \intadd_1/n13 ,
         \intadd_1/n12 , \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 ,
         \intadd_1/n8 , \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 ,
         \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 ,
         \intadd_2/A[3] , \intadd_2/A[2] , \intadd_2/A[1] , \intadd_2/B[3] ,
         \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] , \intadd_2/CI ,
         \intadd_2/SUM[0] , \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 ,
         \intadd_2/n1 , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155;

  CMPE42D1HVT \mult_x_3/U46  ( .A(\mult_x_3/n142 ), .B(\mult_x_3/n105 ), .C(
        \mult_x_3/n117 ), .CIX(\mult_x_3/n82 ), .D(\mult_x_3/n129 ), .CO(
        \mult_x_3/n78 ), .COX(\mult_x_3/n77 ), .S(\mult_x_3/n79 ) );
  CMPE42D1HVT \mult_x_3/U44  ( .A(\mult_x_3/n104 ), .B(\mult_x_3/n128 ), .C(
        \mult_x_3/n116 ), .CIX(\mult_x_3/n77 ), .D(\mult_x_3/n76 ), .CO(
        \mult_x_3/n73 ), .COX(\mult_x_3/n72 ), .S(\mult_x_3/n74 ) );
  CMPE42D1HVT \mult_x_3/U42  ( .A(\mult_x_3/n115 ), .B(\mult_x_3/n127 ), .C(
        \mult_x_3/n75 ), .CIX(\mult_x_3/n72 ), .D(\mult_x_3/n71 ), .CO(
        \mult_x_3/n68 ), .COX(\mult_x_3/n67 ), .S(\mult_x_3/n69 ) );
  CMPE42D1HVT \mult_x_3/U40  ( .A(\mult_x_3/n114 ), .B(\mult_x_3/n126 ), .C(
        \mult_x_3/n70 ), .CIX(\mult_x_3/n67 ), .D(\mult_x_3/n66 ), .CO(
        \mult_x_3/n63 ), .COX(\mult_x_3/n62 ), .S(\mult_x_3/n64 ) );
  CMPE42D1HVT \mult_x_3/U38  ( .A(\mult_x_3/n113 ), .B(\mult_x_3/n125 ), .C(
        \mult_x_3/n65 ), .CIX(\mult_x_3/n62 ), .D(\mult_x_3/n61 ), .CO(
        \mult_x_3/n58 ), .COX(\mult_x_3/n57 ), .S(\mult_x_3/n59 ) );
  CMPE42D1HVT \mult_x_3/U36  ( .A(\mult_x_3/n112 ), .B(\mult_x_3/n124 ), .C(
        \mult_x_3/n60 ), .CIX(\mult_x_3/n57 ), .D(\mult_x_3/n56 ), .CO(
        \mult_x_3/n53 ), .COX(\mult_x_3/n52 ), .S(\mult_x_3/n54 ) );
  CMPE42D1HVT \mult_x_3/U34  ( .A(\mult_x_3/n111 ), .B(\mult_x_3/n123 ), .C(
        \mult_x_3/n55 ), .CIX(\mult_x_3/n52 ), .D(\mult_x_3/n51 ), .CO(
        \mult_x_3/n48 ), .COX(\mult_x_3/n47 ), .S(\mult_x_3/n49 ) );
  CMPE42D1HVT \mult_x_3/U32  ( .A(\mult_x_3/n110 ), .B(\mult_x_3/n122 ), .C(
        \mult_x_3/n50 ), .CIX(\mult_x_3/n47 ), .D(\mult_x_3/n46 ), .CO(
        \mult_x_3/n43 ), .COX(\mult_x_3/n42 ), .S(\mult_x_3/n44 ) );
  CMPE42D1HVT \mult_x_3/U29  ( .A(\mult_x_3/n134 ), .B(\mult_x_3/n109 ), .C(
        \mult_x_3/n45 ), .CIX(\mult_x_3/n42 ), .D(\mult_x_3/n41 ), .CO(
        \mult_x_3/n38 ), .COX(\mult_x_3/n37 ), .S(\mult_x_3/n39 ) );
  CMPE42D1HVT \mult_x_3/U27  ( .A(\mult_x_3/n96 ), .B(\mult_x_3/n108 ), .C(
        \mult_x_3/n36 ), .CIX(\mult_x_3/n37 ), .D(\mult_x_3/n40 ), .CO(
        \mult_x_3/n33 ), .COX(\mult_x_3/n32 ), .S(\mult_x_3/n34 ) );
  CMPE42D1HVT \mult_x_3/U26  ( .A(\mult_x_3/n107 ), .B(\mult_x_3/n35 ), .C(
        \mult_x_3/n95 ), .CIX(\mult_x_3/n32 ), .D(\mult_x_3/n120 ), .CO(
        \mult_x_3/n30 ), .COX(\mult_x_3/n29 ), .S(\mult_x_3/n31 ) );
  FA1D0HVT \intadd_1/U16  ( .A(\intadd_1/A[0] ), .B(\intadd_1/B[0] ), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n15 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U15  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n15 ), .CO(\intadd_1/n14 ), .S(\intadd_1/SUM[1] ) );
  FA1D0HVT \intadd_1/U14  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n14 ), .CO(\intadd_1/n13 ), .S(\intadd_1/SUM[2] ) );
  FA1D0HVT \intadd_1/U13  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n13 ), .CO(\intadd_1/n12 ), .S(\intadd_1/SUM[3] ) );
  FA1D0HVT \intadd_1/U12  ( .A(\intadd_1/A[4] ), .B(\intadd_1/B[4] ), .CI(
        \intadd_1/n12 ), .CO(\intadd_1/n11 ), .S(\intadd_1/SUM[4] ) );
  FA1D0HVT \intadd_1/U11  ( .A(\intadd_1/A[5] ), .B(\intadd_1/B[5] ), .CI(
        \intadd_1/n11 ), .CO(\intadd_1/n10 ), .S(\intadd_1/SUM[5] ) );
  FA1D0HVT \intadd_1/U10  ( .A(\intadd_1/A[6] ), .B(\intadd_1/B[6] ), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\intadd_1/SUM[6] ) );
  FA1D0HVT \intadd_1/U9  ( .A(\intadd_1/A[7] ), .B(\intadd_1/B[7] ), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\intadd_1/SUM[7] ) );
  FA1D0HVT \intadd_1/U8  ( .A(\intadd_1/A[8] ), .B(\intadd_1/B[8] ), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[8] ) );
  FA1D0HVT \intadd_1/U7  ( .A(\intadd_1/A[9] ), .B(\intadd_1/B[9] ), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[9] ) );
  FA1D0HVT \intadd_1/U6  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[10] ), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[10] ) );
  FA1D0HVT \intadd_1/U5  ( .A(\intadd_1/A[11] ), .B(\intadd_1/B[11] ), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[11] ) );
  FA1D0HVT \intadd_1/U4  ( .A(\intadd_1/A[12] ), .B(\intadd_1/B[12] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[12] ) );
  FA1D0HVT \intadd_1/U3  ( .A(\intadd_1/A[13] ), .B(\intadd_1/B[13] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[13] ) );
  FA1D0HVT \intadd_1/U2  ( .A(\intadd_1/A[14] ), .B(\intadd_1/B[14] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[14] ) );
  FA1D0HVT \intadd_2/U5  ( .A(\mult_x_3/n29 ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n4 ), .S(\intadd_2/SUM[0] ) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(MUL_RESULT[18]) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(MUL_RESULT[19]) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(MUL_RESULT[20]) );
  INVD0HVT U2 ( .I(n51), .ZN(n136) );
  AOI22D0HVT U3 ( .A1(n145), .A2(n113), .B1(n112), .B2(n120), .ZN(n15) );
  AOI22D0HVT U4 ( .A1(n87), .A2(n154), .B1(n152), .B2(n86), .ZN(n22) );
  AOI22D0HVT U5 ( .A1(n119), .A2(n154), .B1(n152), .B2(n117), .ZN(n28) );
  CKND2D0HVT U6 ( .A1(n51), .A2(n128), .ZN(n36) );
  AOI22D0HVT U7 ( .A1(n137), .A2(n154), .B1(n152), .B2(n76), .ZN(n130) );
  CKND2D0HVT U8 ( .A1(MUL_EN), .A2(MUL_OP_A[13]), .ZN(n153) );
  AOI22D0HVT U9 ( .A1(n114), .A2(n113), .B1(n112), .B2(n111), .ZN(n115) );
  CKND2D0HVT U10 ( .A1(MUL_EN), .A2(MUL_OP_A[2]), .ZN(n128) );
  INVD0HVT U11 ( .I(\mult_x_3/n68 ), .ZN(\intadd_1/B[6] ) );
  INVD0HVT U12 ( .I(\mult_x_3/n31 ), .ZN(\intadd_1/A[13] ) );
  INVD0HVT U13 ( .I(\intadd_2/A[2] ), .ZN(\intadd_2/B[3] ) );
  INVD0HVT U14 ( .I(\intadd_1/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U15 ( .I(\intadd_2/n1 ), .ZN(MUL_RESULT[21]) );
  CKND2D0HVT U16 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n152) );
  INVD0HVT U17 ( .I(MUL_OP_B[4]), .ZN(n40) );
  CKND2D0HVT U18 ( .A1(MUL_EN), .A2(MUL_OP_B[5]), .ZN(n39) );
  INVD0HVT U19 ( .I(n39), .ZN(n38) );
  NR3D0HVT U20 ( .A1(n152), .A2(n40), .A3(n38), .ZN(n5) );
  CKND2D0HVT U21 ( .A1(MUL_EN), .A2(MUL_OP_A[12]), .ZN(n58) );
  INVD0HVT U22 ( .I(n58), .ZN(n59) );
  ND3D0HVT U23 ( .A1(n152), .A2(n40), .A3(n38), .ZN(n121) );
  INVD0HVT U24 ( .I(n121), .ZN(n104) );
  INVD0HVT U25 ( .I(n152), .ZN(n154) );
  MUX2ND0HVT U26 ( .I0(n152), .I1(n154), .S(n40), .ZN(n146) );
  INVD0HVT U27 ( .I(n153), .ZN(n155) );
  AOI22D0HVT U28 ( .A1(n38), .A2(n153), .B1(n155), .B2(n39), .ZN(n41) );
  NR2D0HVT U29 ( .A1(n146), .A2(n41), .ZN(n1) );
  AOI221D0HVT U30 ( .A1(n5), .A2(n59), .B1(n104), .B2(n58), .C(n1), .ZN(
        \intadd_2/B[0] ) );
  CKND2D0HVT U31 ( .A1(MUL_EN), .A2(MUL_OP_B[7]), .ZN(n30) );
  NR3D0HVT U32 ( .A1(MUL_OP_B[6]), .A2(n38), .A3(n30), .ZN(n112) );
  INVD0HVT U33 ( .I(n30), .ZN(n31) );
  MAOI22D0HVT U34 ( .A1(MUL_OP_B[6]), .A2(n38), .B1(n38), .B2(MUL_OP_B[6]), 
        .ZN(n110) );
  AOI21D0HVT U35 ( .A1(MUL_OP_B[6]), .A2(n31), .B(n110), .ZN(n2) );
  OAI21D0HVT U36 ( .A1(n31), .A2(MUL_OP_B[6]), .B(n2), .ZN(n32) );
  NR2D0HVT U37 ( .A1(n31), .A2(n32), .ZN(n113) );
  AOI22D0HVT U38 ( .A1(n31), .A2(n155), .B1(n153), .B2(n30), .ZN(n108) );
  INVD0HVT U39 ( .I(n110), .ZN(n71) );
  INR2D0HVT U40 ( .A1(n108), .B1(n71), .ZN(n3) );
  AOI221D0HVT U41 ( .A1(n58), .A2(n112), .B1(n59), .B2(n113), .C(n3), .ZN(
        \intadd_2/A[2] ) );
  CKND2D0HVT U42 ( .A1(MUL_EN), .A2(MUL_OP_A[10]), .ZN(n111) );
  INVD0HVT U43 ( .I(n111), .ZN(n114) );
  CKND2D0HVT U44 ( .A1(n31), .A2(n110), .ZN(n118) );
  CKND2D0HVT U45 ( .A1(n110), .A2(n30), .ZN(n116) );
  CKND2D0HVT U46 ( .A1(MUL_EN), .A2(MUL_OP_A[9]), .ZN(n79) );
  INVD0HVT U47 ( .I(n79), .ZN(n80) );
  AOI22D0HVT U48 ( .A1(n80), .A2(n113), .B1(n112), .B2(n79), .ZN(n4) );
  OAI221D0HVT U49 ( .A1(n114), .A2(n118), .B1(n111), .B2(n116), .C(n4), .ZN(
        \mult_x_3/n95 ) );
  CKND2D0HVT U50 ( .A1(MUL_EN), .A2(MUL_OP_A[8]), .ZN(n86) );
  INVD0HVT U51 ( .I(n86), .ZN(n87) );
  INVD0HVT U52 ( .I(n5), .ZN(n122) );
  NR2D0HVT U53 ( .A1(n38), .A2(n146), .ZN(n127) );
  NR2D0HVT U54 ( .A1(n39), .A2(n146), .ZN(n125) );
  AOI22D0HVT U55 ( .A1(n80), .A2(n127), .B1(n125), .B2(n79), .ZN(n6) );
  OAI221D0HVT U56 ( .A1(n87), .A2(n121), .B1(n86), .B2(n122), .C(n6), .ZN(
        \mult_x_3/n110 ) );
  CKND2D0HVT U57 ( .A1(MUL_EN), .A2(MUL_OP_A[7]), .ZN(n68) );
  INVD0HVT U58 ( .I(n68), .ZN(n84) );
  AOI22D0HVT U59 ( .A1(n87), .A2(n127), .B1(n125), .B2(n86), .ZN(n7) );
  OAI221D0HVT U60 ( .A1(n84), .A2(n121), .B1(n68), .B2(n122), .C(n7), .ZN(
        \mult_x_3/n111 ) );
  CKND2D0HVT U61 ( .A1(MUL_EN), .A2(MUL_OP_A[6]), .ZN(n55) );
  INVD0HVT U62 ( .I(n55), .ZN(n66) );
  AOI22D0HVT U63 ( .A1(n84), .A2(n127), .B1(n125), .B2(n68), .ZN(n8) );
  OAI221D0HVT U64 ( .A1(n66), .A2(n121), .B1(n55), .B2(n122), .C(n8), .ZN(
        \mult_x_3/n112 ) );
  CKND2D0HVT U65 ( .A1(MUL_EN), .A2(MUL_OP_A[5]), .ZN(n106) );
  INVD0HVT U66 ( .I(n106), .ZN(n107) );
  AOI22D0HVT U67 ( .A1(n66), .A2(n127), .B1(n125), .B2(n55), .ZN(n9) );
  OAI221D0HVT U68 ( .A1(n107), .A2(n121), .B1(n106), .B2(n122), .C(n9), .ZN(
        \mult_x_3/n113 ) );
  CKND2D0HVT U69 ( .A1(MUL_EN), .A2(MUL_OP_A[4]), .ZN(n139) );
  INVD0HVT U70 ( .I(n139), .ZN(n141) );
  AOI22D0HVT U71 ( .A1(n107), .A2(n127), .B1(n125), .B2(n106), .ZN(n10) );
  OAI221D0HVT U72 ( .A1(n141), .A2(n121), .B1(n139), .B2(n122), .C(n10), .ZN(
        \mult_x_3/n114 ) );
  CKND2D0HVT U73 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n91) );
  INVD0HVT U74 ( .I(n91), .ZN(n99) );
  CKND2D0HVT U75 ( .A1(MUL_OP_B[0]), .A2(n99), .ZN(n92) );
  CKND2D0HVT U76 ( .A1(n91), .A2(MUL_OP_B[0]), .ZN(n93) );
  NR2D0HVT U77 ( .A1(n91), .A2(MUL_OP_B[0]), .ZN(n51) );
  CKND2D0HVT U78 ( .A1(n51), .A2(n106), .ZN(n11) );
  OAI221D0HVT U79 ( .A1(n66), .A2(n92), .B1(n55), .B2(n93), .C(n11), .ZN(
        \mult_x_3/n142 ) );
  CKND2D0HVT U80 ( .A1(MUL_EN), .A2(MUL_OP_A[3]), .ZN(n76) );
  INVD0HVT U81 ( .I(n76), .ZN(n137) );
  AOI22D0HVT U82 ( .A1(n141), .A2(n127), .B1(n125), .B2(n139), .ZN(n12) );
  OAI221D0HVT U83 ( .A1(n137), .A2(n121), .B1(n76), .B2(n122), .C(n12), .ZN(
        \mult_x_3/n115 ) );
  INVD0HVT U84 ( .I(n128), .ZN(n129) );
  AOI22D0HVT U85 ( .A1(n137), .A2(n127), .B1(n125), .B2(n76), .ZN(n13) );
  OAI221D0HVT U86 ( .A1(n129), .A2(n121), .B1(n128), .B2(n122), .C(n13), .ZN(
        \mult_x_3/n116 ) );
  CKND2D0HVT U87 ( .A1(MUL_EN), .A2(MUL_OP_A[1]), .ZN(n124) );
  INVD0HVT U88 ( .I(n124), .ZN(n126) );
  AOI22D0HVT U89 ( .A1(n129), .A2(n127), .B1(n125), .B2(n128), .ZN(n14) );
  OAI221D0HVT U90 ( .A1(n126), .A2(n121), .B1(n124), .B2(n122), .C(n14), .ZN(
        \mult_x_3/n117 ) );
  CKND2D0HVT U91 ( .A1(MUL_EN), .A2(MUL_OP_A[0]), .ZN(n120) );
  INVD0HVT U92 ( .I(n120), .ZN(n145) );
  OAI221D0HVT U93 ( .A1(n126), .A2(n118), .B1(n124), .B2(n116), .C(n15), .ZN(
        \mult_x_3/n104 ) );
  CKND2D0HVT U94 ( .A1(MUL_EN), .A2(MUL_OP_A[11]), .ZN(n117) );
  INVD0HVT U95 ( .I(n117), .ZN(n119) );
  AOI22D0HVT U96 ( .A1(n59), .A2(n127), .B1(n125), .B2(n58), .ZN(n16) );
  OAI221D0HVT U97 ( .A1(n119), .A2(n121), .B1(n117), .B2(n122), .C(n16), .ZN(
        \mult_x_3/n107 ) );
  AOI22D0HVT U98 ( .A1(n119), .A2(n127), .B1(n125), .B2(n117), .ZN(n17) );
  OAI221D0HVT U99 ( .A1(n114), .A2(n121), .B1(n111), .B2(n122), .C(n17), .ZN(
        \mult_x_3/n108 ) );
  INVD0HVT U100 ( .I(n32), .ZN(n109) );
  AOI22D0HVT U101 ( .A1(n31), .A2(n87), .B1(n86), .B2(n30), .ZN(n33) );
  CKND2D0HVT U102 ( .A1(n109), .A2(n33), .ZN(n18) );
  OAI221D0HVT U103 ( .A1(n80), .A2(n118), .B1(n79), .B2(n116), .C(n18), .ZN(
        \mult_x_3/n96 ) );
  AOI22D0HVT U104 ( .A1(n114), .A2(n127), .B1(n125), .B2(n111), .ZN(n19) );
  OAI221D0HVT U105 ( .A1(n80), .A2(n121), .B1(n79), .B2(n122), .C(n19), .ZN(
        \mult_x_3/n109 ) );
  MUX2ND0HVT U106 ( .I0(n91), .I1(n99), .S(MUL_OP_B[2]), .ZN(n151) );
  AOI22D0HVT U107 ( .A1(n114), .A2(n154), .B1(n152), .B2(n111), .ZN(n20) );
  CKND2D0HVT U108 ( .A1(n99), .A2(MUL_OP_B[2]), .ZN(n101) );
  OAI32D1HVT U109 ( .A1(n152), .A2(n99), .A3(MUL_OP_B[2]), .B1(n154), .B2(n101), .ZN(n150) );
  AO22D0HVT U110 ( .A1(n151), .A2(n28), .B1(n20), .B2(n150), .Z(
        \mult_x_3/n122 ) );
  AOI22D0HVT U111 ( .A1(n80), .A2(n154), .B1(n152), .B2(n79), .ZN(n21) );
  AO22D0HVT U112 ( .A1(n151), .A2(n20), .B1(n21), .B2(n150), .Z(
        \mult_x_3/n123 ) );
  AO22D0HVT U113 ( .A1(n151), .A2(n21), .B1(n22), .B2(n150), .Z(
        \mult_x_3/n124 ) );
  AOI22D0HVT U114 ( .A1(n84), .A2(n154), .B1(n152), .B2(n68), .ZN(n23) );
  AO22D0HVT U115 ( .A1(n151), .A2(n22), .B1(n23), .B2(n150), .Z(
        \mult_x_3/n125 ) );
  AOI22D0HVT U116 ( .A1(n66), .A2(n154), .B1(n152), .B2(n55), .ZN(n24) );
  AO22D0HVT U117 ( .A1(n151), .A2(n23), .B1(n24), .B2(n150), .Z(
        \mult_x_3/n126 ) );
  AOI22D0HVT U118 ( .A1(n107), .A2(n154), .B1(n152), .B2(n106), .ZN(n26) );
  AO22D0HVT U119 ( .A1(n151), .A2(n24), .B1(n26), .B2(n150), .Z(
        \mult_x_3/n127 ) );
  AOI22D0HVT U120 ( .A1(n141), .A2(n154), .B1(n152), .B2(n139), .ZN(n25) );
  AO22D0HVT U121 ( .A1(n151), .A2(n25), .B1(n130), .B2(n150), .Z(
        \mult_x_3/n129 ) );
  AO22D0HVT U122 ( .A1(n151), .A2(n26), .B1(n25), .B2(n150), .Z(
        \mult_x_3/n128 ) );
  AOI22D0HVT U123 ( .A1(n155), .A2(n154), .B1(n152), .B2(n153), .ZN(n27) );
  AOI22D0HVT U124 ( .A1(n59), .A2(n154), .B1(n152), .B2(n58), .ZN(n29) );
  AOI22D0HVT U125 ( .A1(n151), .A2(n27), .B1(n29), .B2(n150), .ZN(
        \mult_x_3/n36 ) );
  INVD0HVT U126 ( .I(\mult_x_3/n36 ), .ZN(\mult_x_3/n35 ) );
  AOI22D0HVT U127 ( .A1(n151), .A2(n29), .B1(n28), .B2(n150), .ZN(n48) );
  AOI22D0HVT U128 ( .A1(n31), .A2(n68), .B1(n84), .B2(n30), .ZN(n49) );
  MAOI22D0HVT U129 ( .A1(n110), .A2(n33), .B1(n32), .B2(n49), .ZN(n47) );
  CKND2D0HVT U130 ( .A1(n48), .A2(n47), .ZN(\mult_x_3/n40 ) );
  INVD0HVT U131 ( .I(\intadd_1/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U132 ( .I(\intadd_1/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U133 ( .I(\intadd_1/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U134 ( .I(\intadd_1/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U135 ( .I(\intadd_1/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U136 ( .I(\intadd_1/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U137 ( .I(\intadd_1/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U138 ( .I(\intadd_1/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U139 ( .I(\intadd_1/SUM[9] ), .ZN(MUL_RESULT[12]) );
  INVD0HVT U140 ( .I(\intadd_1/SUM[10] ), .ZN(MUL_RESULT[13]) );
  INVD0HVT U141 ( .I(\intadd_1/SUM[11] ), .ZN(MUL_RESULT[14]) );
  INVD0HVT U142 ( .I(\intadd_1/SUM[12] ), .ZN(MUL_RESULT[15]) );
  INVD0HVT U143 ( .I(\intadd_1/SUM[13] ), .ZN(MUL_RESULT[16]) );
  INVD0HVT U144 ( .I(\intadd_1/SUM[14] ), .ZN(MUL_RESULT[17]) );
  INVD0HVT U145 ( .I(\intadd_1/n1 ), .ZN(\intadd_2/B[1] ) );
  CKND2D0HVT U146 ( .A1(n51), .A2(n124), .ZN(n34) );
  OAI221D0HVT U147 ( .A1(n129), .A2(n92), .B1(n128), .B2(n93), .C(n34), .ZN(
        n97) );
  INVD0HVT U148 ( .I(MUL_OP_B[0]), .ZN(n90) );
  OAI211D0HVT U149 ( .A1(n90), .A2(n124), .B(n99), .C(n120), .ZN(n94) );
  IOA21D0HVT U150 ( .A1(n145), .A2(n151), .B(n94), .ZN(n98) );
  CKND2D0HVT U151 ( .A1(n97), .A2(n98), .ZN(\intadd_1/CI ) );
  OAI22D0HVT U152 ( .A1(n124), .A2(n154), .B1(n152), .B2(n126), .ZN(n143) );
  OAI221D0HVT U153 ( .A1(n154), .A2(n145), .B1(n152), .B2(n120), .C(n150), 
        .ZN(n35) );
  IOA21D0HVT U154 ( .A1(n151), .A2(n143), .B(n35), .ZN(n102) );
  OAI221D0HVT U155 ( .A1(n137), .A2(n92), .B1(n76), .B2(n93), .C(n36), .ZN(
        n103) );
  CKND2D0HVT U156 ( .A1(n102), .A2(n103), .ZN(\intadd_1/A[1] ) );
  INVD0HVT U157 ( .I(\mult_x_3/n79 ), .ZN(\intadd_1/A[3] ) );
  INVD0HVT U158 ( .I(\mult_x_3/n78 ), .ZN(\intadd_1/B[4] ) );
  INVD0HVT U159 ( .I(\mult_x_3/n74 ), .ZN(\intadd_1/A[4] ) );
  INVD0HVT U160 ( .I(\mult_x_3/n69 ), .ZN(\intadd_1/B[5] ) );
  INVD0HVT U161 ( .I(\mult_x_3/n73 ), .ZN(\intadd_1/A[5] ) );
  INVD0HVT U162 ( .I(\mult_x_3/n64 ), .ZN(\intadd_1/A[6] ) );
  INVD0HVT U163 ( .I(\mult_x_3/n63 ), .ZN(\intadd_1/B[7] ) );
  INVD0HVT U164 ( .I(\mult_x_3/n59 ), .ZN(\intadd_1/A[7] ) );
  INVD0HVT U165 ( .I(\mult_x_3/n58 ), .ZN(\intadd_1/B[8] ) );
  INVD0HVT U166 ( .I(\mult_x_3/n54 ), .ZN(\intadd_1/A[8] ) );
  INVD0HVT U167 ( .I(\mult_x_3/n53 ), .ZN(\intadd_1/B[9] ) );
  INVD0HVT U168 ( .I(\mult_x_3/n49 ), .ZN(\intadd_1/A[9] ) );
  INVD0HVT U169 ( .I(\mult_x_3/n48 ), .ZN(\intadd_1/B[10] ) );
  INVD0HVT U170 ( .I(\mult_x_3/n44 ), .ZN(\intadd_1/A[10] ) );
  INVD0HVT U171 ( .I(\mult_x_3/n43 ), .ZN(\intadd_1/B[11] ) );
  INVD0HVT U172 ( .I(\mult_x_3/n39 ), .ZN(\intadd_1/A[11] ) );
  INVD0HVT U173 ( .I(\mult_x_3/n38 ), .ZN(\intadd_1/B[12] ) );
  INVD0HVT U174 ( .I(\mult_x_3/n34 ), .ZN(\intadd_1/A[12] ) );
  INVD0HVT U175 ( .I(\mult_x_3/n33 ), .ZN(\intadd_1/B[13] ) );
  INVD0HVT U176 ( .I(\intadd_2/SUM[0] ), .ZN(\intadd_1/B[14] ) );
  INVD0HVT U177 ( .I(\mult_x_3/n30 ), .ZN(\intadd_1/A[14] ) );
  AOI22D0HVT U178 ( .A1(n59), .A2(n116), .B1(n118), .B2(n58), .ZN(n37) );
  AOI221D0HVT U179 ( .A1(n112), .A2(n117), .B1(n113), .B2(n119), .C(n37), .ZN(
        n45) );
  OAI22D0HVT U180 ( .A1(n40), .A2(n39), .B1(MUL_OP_B[4]), .B2(n38), .ZN(n42)
         );
  AOI21D0HVT U181 ( .A1(n146), .A2(n42), .B(n41), .ZN(n44) );
  INVD0HVT U182 ( .I(n43), .ZN(\intadd_2/A[1] ) );
  FA1D0HVT U183 ( .A(n45), .B(\intadd_2/B[0] ), .CI(n44), .CO(n46), .S(n43) );
  INVD0HVT U184 ( .I(n46), .ZN(\intadd_2/B[2] ) );
  AOI32D0HVT U185 ( .A1(n155), .A2(n91), .A3(MUL_OP_B[0]), .B1(n153), .B2(n99), 
        .ZN(\mult_x_3/n134 ) );
  OAI21D0HVT U186 ( .A1(n48), .A2(n47), .B(\mult_x_3/n40 ), .ZN(\mult_x_3/n41 ) );
  NR2D0HVT U187 ( .A1(n71), .A2(n49), .ZN(n50) );
  AOI221D0HVT U188 ( .A1(n112), .A2(n55), .B1(n113), .B2(n66), .C(n50), .ZN(
        n53) );
  INVD0HVT U189 ( .I(n93), .ZN(n142) );
  INVD0HVT U190 ( .I(n92), .ZN(n140) );
  NR2D0HVT U191 ( .A1(n59), .A2(n136), .ZN(n52) );
  AOI221D0HVT U192 ( .A1(n142), .A2(n155), .B1(n140), .B2(n153), .C(n52), .ZN(
        n54) );
  NR2D0HVT U193 ( .A1(n53), .A2(n54), .ZN(\mult_x_3/n45 ) );
  AOI21D0HVT U194 ( .A1(n54), .A2(n53), .B(\mult_x_3/n45 ), .ZN(\mult_x_3/n46 ) );
  AOI22D0HVT U195 ( .A1(n66), .A2(n116), .B1(n118), .B2(n55), .ZN(n56) );
  AOI221D0HVT U196 ( .A1(n112), .A2(n106), .B1(n113), .B2(n107), .C(n56), .ZN(
        n60) );
  NR2D0HVT U197 ( .A1(n119), .A2(n136), .ZN(n57) );
  AOI221D0HVT U198 ( .A1(n142), .A2(n59), .B1(n140), .B2(n58), .C(n57), .ZN(
        n61) );
  NR2D0HVT U199 ( .A1(n60), .A2(n61), .ZN(\mult_x_3/n50 ) );
  AOI21D0HVT U200 ( .A1(n61), .A2(n60), .B(\mult_x_3/n50 ), .ZN(\mult_x_3/n51 ) );
  AOI22D0HVT U201 ( .A1(n107), .A2(n116), .B1(n118), .B2(n106), .ZN(n62) );
  AOI221D0HVT U202 ( .A1(n112), .A2(n139), .B1(n113), .B2(n141), .C(n62), .ZN(
        n64) );
  NR2D0HVT U203 ( .A1(n114), .A2(n136), .ZN(n63) );
  AOI221D0HVT U204 ( .A1(n142), .A2(n119), .B1(n140), .B2(n117), .C(n63), .ZN(
        n65) );
  NR2D0HVT U205 ( .A1(n64), .A2(n65), .ZN(\mult_x_3/n55 ) );
  AOI21D0HVT U206 ( .A1(n65), .A2(n64), .B(\mult_x_3/n55 ), .ZN(\mult_x_3/n56 ) );
  IAO21D0HVT U207 ( .A1(n118), .A2(n145), .B(n112), .ZN(n69) );
  NR2D0HVT U208 ( .A1(n66), .A2(n136), .ZN(n67) );
  AOI221D0HVT U209 ( .A1(n142), .A2(n84), .B1(n140), .B2(n68), .C(n67), .ZN(
        n70) );
  NR2D0HVT U210 ( .A1(n69), .A2(n70), .ZN(\mult_x_3/n75 ) );
  AOI21D0HVT U211 ( .A1(n70), .A2(n69), .B(\mult_x_3/n75 ), .ZN(\mult_x_3/n76 ) );
  NR2D0HVT U212 ( .A1(n71), .A2(n120), .ZN(\mult_x_3/n105 ) );
  AOI22D0HVT U213 ( .A1(n141), .A2(n116), .B1(n118), .B2(n139), .ZN(n72) );
  AOI221D0HVT U214 ( .A1(n112), .A2(n76), .B1(n113), .B2(n137), .C(n72), .ZN(
        n74) );
  NR2D0HVT U215 ( .A1(n80), .A2(n136), .ZN(n73) );
  AOI221D0HVT U216 ( .A1(n142), .A2(n114), .B1(n140), .B2(n111), .C(n73), .ZN(
        n75) );
  NR2D0HVT U217 ( .A1(n74), .A2(n75), .ZN(\mult_x_3/n60 ) );
  AOI21D0HVT U218 ( .A1(n75), .A2(n74), .B(\mult_x_3/n60 ), .ZN(\mult_x_3/n61 ) );
  AOI22D0HVT U219 ( .A1(n137), .A2(n116), .B1(n118), .B2(n76), .ZN(n77) );
  AOI221D0HVT U220 ( .A1(n112), .A2(n128), .B1(n113), .B2(n129), .C(n77), .ZN(
        n81) );
  NR2D0HVT U221 ( .A1(n87), .A2(n136), .ZN(n78) );
  AOI221D0HVT U222 ( .A1(n142), .A2(n80), .B1(n140), .B2(n79), .C(n78), .ZN(
        n82) );
  NR2D0HVT U223 ( .A1(n81), .A2(n82), .ZN(\mult_x_3/n65 ) );
  AOI21D0HVT U224 ( .A1(n82), .A2(n81), .B(\mult_x_3/n65 ), .ZN(\mult_x_3/n66 ) );
  AOI22D0HVT U225 ( .A1(n129), .A2(n116), .B1(n118), .B2(n128), .ZN(n83) );
  AOI221D0HVT U226 ( .A1(n112), .A2(n124), .B1(n113), .B2(n126), .C(n83), .ZN(
        n88) );
  NR2D0HVT U227 ( .A1(n84), .A2(n136), .ZN(n85) );
  AOI221D0HVT U228 ( .A1(n142), .A2(n87), .B1(n140), .B2(n86), .C(n85), .ZN(
        n89) );
  NR2D0HVT U229 ( .A1(n88), .A2(n89), .ZN(\mult_x_3/n70 ) );
  AOI21D0HVT U230 ( .A1(n89), .A2(n88), .B(\mult_x_3/n70 ), .ZN(\mult_x_3/n71 ) );
  NR2D0HVT U231 ( .A1(n90), .A2(n120), .ZN(MUL_RESULT[0]) );
  NR2D0HVT U232 ( .A1(MUL_RESULT[0]), .A2(n91), .ZN(n96) );
  OAI22D0HVT U233 ( .A1(n124), .A2(n93), .B1(n126), .B2(n92), .ZN(n95) );
  OA21D0HVT U234 ( .A1(n96), .A2(n95), .B(n94), .Z(MUL_RESULT[1]) );
  OA21D0HVT U235 ( .A1(n98), .A2(n97), .B(\intadd_1/CI ), .Z(MUL_RESULT[2]) );
  NR2D0HVT U236 ( .A1(n99), .A2(MUL_OP_B[2]), .ZN(n100) );
  AOI32D0HVT U237 ( .A1(n120), .A2(n154), .A3(n101), .B1(n100), .B2(n154), 
        .ZN(\intadd_1/B[0] ) );
  OAI21D0HVT U238 ( .A1(n103), .A2(n102), .B(\intadd_1/A[1] ), .ZN(
        \intadd_1/A[0] ) );
  AOI21D0HVT U239 ( .A1(n125), .A2(n120), .B(n104), .ZN(n131) );
  NR2D0HVT U240 ( .A1(n141), .A2(n136), .ZN(n105) );
  AOI221D0HVT U241 ( .A1(n142), .A2(n107), .B1(n140), .B2(n106), .C(n105), 
        .ZN(n132) );
  NR2D0HVT U242 ( .A1(n131), .A2(n132), .ZN(\mult_x_3/n82 ) );
  OAI21D0HVT U243 ( .A1(n110), .A2(n109), .B(n108), .ZN(\intadd_2/A[3] ) );
  OAI221D0HVT U244 ( .A1(n119), .A2(n118), .B1(n117), .B2(n116), .C(n115), 
        .ZN(\intadd_2/CI ) );
  AOI22D0HVT U245 ( .A1(n145), .A2(n122), .B1(n121), .B2(n120), .ZN(n123) );
  AOI221D0HVT U246 ( .A1(n127), .A2(n126), .B1(n125), .B2(n124), .C(n123), 
        .ZN(n135) );
  AOI22D0HVT U247 ( .A1(n129), .A2(n154), .B1(n152), .B2(n128), .ZN(n144) );
  AOI22D0HVT U248 ( .A1(n151), .A2(n130), .B1(n144), .B2(n150), .ZN(n134) );
  AO21D0HVT U249 ( .A1(n132), .A2(n131), .B(\mult_x_3/n82 ), .Z(n133) );
  FA1D0HVT U250 ( .A(n135), .B(n134), .CI(n133), .CO(\intadd_1/B[3] ), .S(
        \intadd_1/A[2] ) );
  NR2D0HVT U251 ( .A1(n137), .A2(n136), .ZN(n138) );
  AOI221D0HVT U252 ( .A1(n142), .A2(n141), .B1(n140), .B2(n139), .C(n138), 
        .ZN(n149) );
  AOI22D0HVT U253 ( .A1(n151), .A2(n144), .B1(n150), .B2(n143), .ZN(n148) );
  IND2D0HVT U254 ( .A1(n146), .B1(n145), .ZN(n147) );
  FA1D0HVT U255 ( .A(n149), .B(n148), .CI(n147), .CO(\intadd_1/B[2] ), .S(
        \intadd_1/B[1] ) );
  OAI222D0HVT U256 ( .A1(n155), .A2(n154), .B1(n153), .B2(n152), .C1(n151), 
        .C2(n150), .ZN(\mult_x_3/n120 ) );
endmodule


module ADDER_v3 ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [21:0] ADD_OP_A;
  input [21:0] ADD_OP_B;
  output [21:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_3/A[19] , \intadd_3/A[18] , \intadd_3/A[17] ,
         \intadd_3/A[16] , \intadd_3/A[15] , \intadd_3/A[14] ,
         \intadd_3/A[13] , \intadd_3/A[12] , \intadd_3/A[11] ,
         \intadd_3/A[10] , \intadd_3/A[9] , \intadd_3/A[8] , \intadd_3/A[7] ,
         \intadd_3/A[6] , \intadd_3/A[5] , \intadd_3/A[4] , \intadd_3/A[3] ,
         \intadd_3/A[2] , \intadd_3/A[1] , \intadd_3/A[0] , \intadd_3/B[19] ,
         \intadd_3/B[18] , \intadd_3/B[17] , \intadd_3/B[16] ,
         \intadd_3/B[15] , \intadd_3/B[14] , \intadd_3/B[13] ,
         \intadd_3/B[12] , \intadd_3/B[11] , \intadd_3/B[10] , \intadd_3/B[9] ,
         \intadd_3/B[8] , \intadd_3/B[7] , \intadd_3/B[6] , \intadd_3/B[5] ,
         \intadd_3/B[4] , \intadd_3/B[3] , \intadd_3/B[2] , \intadd_3/B[1] ,
         \intadd_3/B[0] , \intadd_3/CI , \intadd_3/n20 , \intadd_3/n19 ,
         \intadd_3/n18 , \intadd_3/n17 , \intadd_3/n16 , \intadd_3/n15 ,
         \intadd_3/n14 , \intadd_3/n13 , \intadd_3/n12 , \intadd_3/n11 ,
         \intadd_3/n10 , \intadd_3/n9 , \intadd_3/n8 , \intadd_3/n7 ,
         \intadd_3/n6 , \intadd_3/n5 , \intadd_3/n4 , \intadd_3/n3 ,
         \intadd_3/n2 , \intadd_3/n1 , n1, n2, n3, n4;

  FA1D0HVT \intadd_3/U21  ( .A(\intadd_3/A[0] ), .B(\intadd_3/B[0] ), .CI(
        \intadd_3/CI ), .CO(\intadd_3/n20 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_3/U20  ( .A(\intadd_3/A[1] ), .B(\intadd_3/B[1] ), .CI(
        \intadd_3/n20 ), .CO(\intadd_3/n19 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_3/U19  ( .A(\intadd_3/A[2] ), .B(\intadd_3/B[2] ), .CI(
        \intadd_3/n19 ), .CO(\intadd_3/n18 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_3/U18  ( .A(\intadd_3/A[3] ), .B(\intadd_3/B[3] ), .CI(
        \intadd_3/n18 ), .CO(\intadd_3/n17 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_3/U17  ( .A(\intadd_3/A[4] ), .B(\intadd_3/B[4] ), .CI(
        \intadd_3/n17 ), .CO(\intadd_3/n16 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_3/U16  ( .A(\intadd_3/A[5] ), .B(\intadd_3/B[5] ), .CI(
        \intadd_3/n16 ), .CO(\intadd_3/n15 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_3/U15  ( .A(\intadd_3/A[6] ), .B(\intadd_3/B[6] ), .CI(
        \intadd_3/n15 ), .CO(\intadd_3/n14 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_3/U14  ( .A(\intadd_3/A[7] ), .B(\intadd_3/B[7] ), .CI(
        \intadd_3/n14 ), .CO(\intadd_3/n13 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_3/U13  ( .A(\intadd_3/A[8] ), .B(\intadd_3/B[8] ), .CI(
        \intadd_3/n13 ), .CO(\intadd_3/n12 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_3/U12  ( .A(\intadd_3/A[9] ), .B(\intadd_3/B[9] ), .CI(
        \intadd_3/n12 ), .CO(\intadd_3/n11 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_3/U11  ( .A(\intadd_3/A[10] ), .B(\intadd_3/B[10] ), .CI(
        \intadd_3/n11 ), .CO(\intadd_3/n10 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_3/U10  ( .A(\intadd_3/A[11] ), .B(\intadd_3/B[11] ), .CI(
        \intadd_3/n10 ), .CO(\intadd_3/n9 ), .S(ADD_RESULT[12]) );
  FA1D0HVT \intadd_3/U9  ( .A(\intadd_3/A[12] ), .B(\intadd_3/B[12] ), .CI(
        \intadd_3/n9 ), .CO(\intadd_3/n8 ), .S(ADD_RESULT[13]) );
  FA1D0HVT \intadd_3/U8  ( .A(\intadd_3/A[13] ), .B(\intadd_3/B[13] ), .CI(
        \intadd_3/n8 ), .CO(\intadd_3/n7 ), .S(ADD_RESULT[14]) );
  FA1D0HVT \intadd_3/U7  ( .A(\intadd_3/A[14] ), .B(\intadd_3/B[14] ), .CI(
        \intadd_3/n7 ), .CO(\intadd_3/n6 ), .S(ADD_RESULT[15]) );
  FA1D0HVT \intadd_3/U6  ( .A(\intadd_3/A[15] ), .B(\intadd_3/B[15] ), .CI(
        \intadd_3/n6 ), .CO(\intadd_3/n5 ), .S(ADD_RESULT[16]) );
  FA1D0HVT \intadd_3/U5  ( .A(\intadd_3/A[16] ), .B(\intadd_3/B[16] ), .CI(
        \intadd_3/n5 ), .CO(\intadd_3/n4 ), .S(ADD_RESULT[17]) );
  FA1D0HVT \intadd_3/U4  ( .A(\intadd_3/A[17] ), .B(\intadd_3/B[17] ), .CI(
        \intadd_3/n4 ), .CO(\intadd_3/n3 ), .S(ADD_RESULT[18]) );
  FA1D0HVT \intadd_3/U3  ( .A(\intadd_3/A[18] ), .B(\intadd_3/B[18] ), .CI(
        \intadd_3/n3 ), .CO(\intadd_3/n2 ), .S(ADD_RESULT[19]) );
  FA1D0HVT \intadd_3/U2  ( .A(\intadd_3/A[19] ), .B(\intadd_3/B[19] ), .CI(
        \intadd_3/n2 ), .CO(\intadd_3/n1 ), .S(ADD_RESULT[20]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_3/B[3] ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_3/A[10] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_A[20]), .A2(ADD_EN), .Z(\intadd_3/A[19] ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_3/CI ) );
  AN3D0HVT U6 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_3/B[0] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_3/A[0] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_3/B[1] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_3/A[1] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_3/B[2] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_3/A[2] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_3/A[3] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_3/B[4] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_3/A[4] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_3/B[5] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_3/A[5] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_3/B[6] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_3/A[6] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_3/B[7] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_3/A[7] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_B[9]), .A2(ADD_EN), .Z(\intadd_3/B[8] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_3/A[8] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_B[10]), .A2(ADD_EN), .Z(\intadd_3/B[9] ) );
  CKAN2D0HVT U24 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_3/A[9] ) );
  CKAN2D0HVT U25 ( .A1(ADD_OP_B[11]), .A2(ADD_EN), .Z(\intadd_3/B[10] ) );
  CKAN2D0HVT U26 ( .A1(ADD_OP_B[12]), .A2(ADD_EN), .Z(\intadd_3/B[11] ) );
  CKAN2D0HVT U27 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_3/A[11] ) );
  CKAN2D0HVT U28 ( .A1(ADD_OP_B[13]), .A2(ADD_EN), .Z(\intadd_3/B[12] ) );
  CKAN2D0HVT U29 ( .A1(ADD_OP_A[13]), .A2(ADD_EN), .Z(\intadd_3/A[12] ) );
  CKAN2D0HVT U30 ( .A1(ADD_OP_B[14]), .A2(ADD_EN), .Z(\intadd_3/B[13] ) );
  CKAN2D0HVT U31 ( .A1(ADD_OP_A[14]), .A2(ADD_EN), .Z(\intadd_3/A[13] ) );
  CKAN2D0HVT U32 ( .A1(ADD_OP_B[15]), .A2(ADD_EN), .Z(\intadd_3/B[14] ) );
  CKAN2D0HVT U33 ( .A1(ADD_OP_A[15]), .A2(ADD_EN), .Z(\intadd_3/A[14] ) );
  CKAN2D0HVT U34 ( .A1(ADD_OP_B[16]), .A2(ADD_EN), .Z(\intadd_3/B[15] ) );
  CKAN2D0HVT U35 ( .A1(ADD_OP_A[16]), .A2(ADD_EN), .Z(\intadd_3/A[15] ) );
  CKAN2D0HVT U36 ( .A1(ADD_OP_B[17]), .A2(ADD_EN), .Z(\intadd_3/B[16] ) );
  CKAN2D0HVT U37 ( .A1(ADD_OP_A[17]), .A2(ADD_EN), .Z(\intadd_3/A[16] ) );
  CKAN2D0HVT U38 ( .A1(ADD_OP_B[18]), .A2(ADD_EN), .Z(\intadd_3/B[17] ) );
  CKAN2D0HVT U39 ( .A1(ADD_OP_A[18]), .A2(ADD_EN), .Z(\intadd_3/A[17] ) );
  CKAN2D0HVT U40 ( .A1(ADD_OP_B[19]), .A2(ADD_EN), .Z(\intadd_3/B[18] ) );
  CKAN2D0HVT U41 ( .A1(ADD_OP_A[19]), .A2(ADD_EN), .Z(\intadd_3/A[18] ) );
  CKAN2D0HVT U42 ( .A1(ADD_OP_B[20]), .A2(ADD_EN), .Z(\intadd_3/B[19] ) );
  INVD0HVT U43 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U44 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U45 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U46 ( .A1(ADD_OP_A[21]), .A2(ADD_OP_B[21]), .ZN(n3) );
  OAI211D0HVT U47 ( .A1(ADD_OP_A[21]), .A2(ADD_OP_B[21]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U48 ( .A1(\intadd_3/n1 ), .A2(n4), .ZN(ADD_RESULT[21]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v5_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v5_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module newMAC_v5 ( clk, rst_n, en, data_valid, weight, activation, reset, acc, 
        output_valid, output_result );
  input [7:0] weight;
  input [7:0] activation;
  output [21:0] output_result;
  input clk, rst_n, en, data_valid, reset, acc;
  output output_valid;
  wire   \*Logic0* , weight_check, compute_check, ACC, MUL, ADD_EN, N48, N49,
         N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N113, N114, N115, N116, N117, net144,
         net150, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [7:0] weight_idx;
  wire   [13:0] activation_out;
  wire   [7:0] weight_last;
  wire   [13:0] ADD_OP_A;
  wire   [13:0] ADD_RESULT;
  wire   [21:0] ADD_OP_B_V2;
  wire   [21:0] ADD_RESULT_V2;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  inputGen u_inputGen ( .en(1'b0), .data_valid(data_valid), .weight(weight), 
        .activation(activation), .data_valid_out(), .weight_check(weight_check), .compute_check(compute_check), .weight_idx(weight_idx), .activation_out({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, activation_out[8:0]}) );
  action_arbiter u_action_arbiter ( .data_valid_out(1'b0), .acc(acc), 
        .compute_check(compute_check), .weight(weight_idx), .weight_last(
        weight_last), .ACC(ACC), .MUL(MUL) );
  ADDER u_ADDER ( .ADD_EN(ADD_EN), .ADD_OP_A(ADD_OP_A), .ADD_OP_B({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, activation_out[8:0]}), .ADD_RESULT(ADD_RESULT) );
  MULTIPLIER_V1 u_MULTIPLIER_V1 ( .MUL_EN(n32), .MUL_OP_A(ADD_OP_A), 
        .MUL_OP_B(weight_last), .MUL_RESULT(ADD_OP_B_V2) );
  ADDER_v3 u_ADDER_v3 ( .ADD_EN(n32), .ADD_OP_A(output_result), .ADD_OP_B(
        ADD_OP_B_V2), .ADD_RESULT(ADD_RESULT_V2) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v5_0 clk_gate_weight_last_reg ( .CLK(clk), .EN(
        en), .ENCLK(net144), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v5_1 clk_gate_output_result_reg ( .CLK(clk), 
        .EN(N117), .ENCLK(net150), .TE(\*Logic0* ) );
  DFCNQD1HVT \weight_last_reg[7]  ( .D(n17), .CP(net144), .CDN(rst_n), .Q(
        weight_last[7]) );
  DFCNQD1HVT \weight_last_reg[6]  ( .D(n16), .CP(net144), .CDN(rst_n), .Q(
        weight_last[6]) );
  DFCNQD1HVT \weight_last_reg[5]  ( .D(n15), .CP(net144), .CDN(rst_n), .Q(
        weight_last[5]) );
  DFCNQD1HVT \weight_last_reg[4]  ( .D(n14), .CP(net144), .CDN(rst_n), .Q(
        weight_last[4]) );
  DFCNQD1HVT \weight_last_reg[3]  ( .D(n13), .CP(net144), .CDN(rst_n), .Q(
        weight_last[3]) );
  DFCNQD1HVT \weight_last_reg[2]  ( .D(n12), .CP(net144), .CDN(rst_n), .Q(
        weight_last[2]) );
  DFCNQD1HVT \weight_last_reg[1]  ( .D(n11), .CP(net144), .CDN(rst_n), .Q(
        weight_last[1]) );
  DFCNQD1HVT \weight_last_reg[0]  ( .D(n10), .CP(net144), .CDN(rst_n), .Q(
        weight_last[0]) );
  DFCNQD1HVT \sumTemp_reg[0]  ( .D(N48), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[0]) );
  DFCNQD1HVT \sumTemp_reg[1]  ( .D(N49), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[1]) );
  DFCNQD1HVT \sumTemp_reg[2]  ( .D(N50), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[2]) );
  DFCNQD1HVT \sumTemp_reg[3]  ( .D(N51), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[3]) );
  DFCNQD1HVT \sumTemp_reg[4]  ( .D(N52), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[4]) );
  DFCNQD1HVT \sumTemp_reg[5]  ( .D(N53), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[5]) );
  DFCNQD1HVT \sumTemp_reg[6]  ( .D(N54), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[6]) );
  DFCNQD1HVT \sumTemp_reg[7]  ( .D(N55), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[7]) );
  DFCNQD1HVT \sumTemp_reg[8]  ( .D(N56), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[8]) );
  DFCNQD1HVT \sumTemp_reg[9]  ( .D(N57), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[9]) );
  DFCNQD1HVT \sumTemp_reg[10]  ( .D(N58), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[10]) );
  DFCNQD1HVT \sumTemp_reg[11]  ( .D(N59), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[11]) );
  DFCNQD1HVT \sumTemp_reg[12]  ( .D(N60), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[12]) );
  DFCNQD1HVT \sumTemp_reg[13]  ( .D(N61), .CP(net144), .CDN(rst_n), .Q(
        ADD_OP_A[13]) );
  DFCNQD1HVT output_valid_reg ( .D(N94), .CP(net150), .CDN(rst_n), .Q(
        output_valid) );
  DFCNQD1HVT \output_result_reg[18]  ( .D(N113), .CP(net150), .CDN(rst_n), .Q(
        output_result[18]) );
  DFCNQD1HVT \output_result_reg[19]  ( .D(N114), .CP(net150), .CDN(rst_n), .Q(
        output_result[19]) );
  DFCNQD1HVT \output_result_reg[20]  ( .D(N115), .CP(net150), .CDN(rst_n), .Q(
        output_result[20]) );
  DFCNQD1HVT \output_result_reg[21]  ( .D(N116), .CP(net150), .CDN(rst_n), .Q(
        output_result[21]) );
  DFCNQD1HVT \output_result_reg[17]  ( .D(N112), .CP(net150), .CDN(rst_n), .Q(
        output_result[17]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N111), .CP(net150), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N110), .CP(net150), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N109), .CP(net150), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N108), .CP(net150), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N107), .CP(net150), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N106), .CP(net150), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N105), .CP(net150), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N104), .CP(net150), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N103), .CP(net150), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N102), .CP(net150), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N101), .CP(net150), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N100), .CP(net150), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N99), .CP(net150), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N98), .CP(net150), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N97), .CP(net150), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N95), .CP(net150), .CDN(rst_n), .Q(
        output_result[0]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N96), .CP(net150), .CDN(rst_n), .Q(
        output_result[1]) );
  TIELHVT U58 ( .ZN(\*Logic0* ) );
  AOI22D0HVT U59 ( .A1(n26), .A2(ADD_OP_A[8]), .B1(n27), .B2(ADD_RESULT[8]), 
        .ZN(n19) );
  BUFFD1HVT U60 ( .I(MUL), .Z(n32) );
  INVD0HVT U61 ( .I(ACC), .ZN(n18) );
  NR2XD0HVT U62 ( .A1(n32), .A2(n18), .ZN(ADD_EN) );
  NR2D0HVT U63 ( .A1(reset), .A2(weight_check), .ZN(n31) );
  INR2D0HVT U64 ( .A1(weight_check), .B1(reset), .ZN(n30) );
  AO22D0HVT U65 ( .A1(n31), .A2(weight_last[3]), .B1(n30), .B2(weight_idx[3]), 
        .Z(n13) );
  AO22D0HVT U66 ( .A1(n31), .A2(weight_last[2]), .B1(n30), .B2(weight_idx[2]), 
        .Z(n12) );
  AO22D0HVT U67 ( .A1(n31), .A2(weight_last[5]), .B1(n30), .B2(weight_idx[5]), 
        .Z(n15) );
  AO22D0HVT U68 ( .A1(n31), .A2(weight_last[6]), .B1(n30), .B2(weight_idx[6]), 
        .Z(n16) );
  NR3D0HVT U69 ( .A1(ACC), .A2(reset), .A3(n32), .ZN(n26) );
  INR2D0HVT U70 ( .A1(ADD_EN), .B1(reset), .ZN(n27) );
  IND2D0HVT U71 ( .A1(reset), .B1(n32), .ZN(n29) );
  NR2D0HVT U72 ( .A1(n18), .A2(n29), .ZN(n28) );
  CKND2D0HVT U73 ( .A1(n28), .A2(activation_out[8]), .ZN(n24) );
  CKND2D0HVT U74 ( .A1(n19), .A2(n24), .ZN(N56) );
  AOI22D0HVT U75 ( .A1(n26), .A2(ADD_OP_A[9]), .B1(n27), .B2(ADD_RESULT[9]), 
        .ZN(n20) );
  CKND2D0HVT U76 ( .A1(n20), .A2(n24), .ZN(N57) );
  AOI22D0HVT U77 ( .A1(n26), .A2(ADD_OP_A[10]), .B1(n27), .B2(ADD_RESULT[10]), 
        .ZN(n21) );
  CKND2D0HVT U78 ( .A1(n21), .A2(n24), .ZN(N58) );
  AOI22D0HVT U79 ( .A1(n26), .A2(ADD_OP_A[11]), .B1(n27), .B2(ADD_RESULT[11]), 
        .ZN(n22) );
  CKND2D0HVT U80 ( .A1(n22), .A2(n24), .ZN(N59) );
  AOI22D0HVT U81 ( .A1(n26), .A2(ADD_OP_A[12]), .B1(n27), .B2(ADD_RESULT[12]), 
        .ZN(n23) );
  CKND2D0HVT U82 ( .A1(n23), .A2(n24), .ZN(N60) );
  AOI22D0HVT U83 ( .A1(n26), .A2(ADD_OP_A[13]), .B1(n27), .B2(ADD_RESULT[13]), 
        .ZN(n25) );
  CKND2D0HVT U84 ( .A1(n25), .A2(n24), .ZN(N61) );
  INR2D0HVT U85 ( .A1(acc), .B1(n29), .ZN(N94) );
  OA21D0HVT U86 ( .A1(reset), .A2(n32), .B(en), .Z(N117) );
  INR2D0HVT U87 ( .A1(ADD_RESULT_V2[0]), .B1(n29), .ZN(N95) );
  AO222D0HVT U88 ( .A1(n28), .A2(activation_out[0]), .B1(n26), .B2(ADD_OP_A[0]), .C1(n27), .C2(ADD_RESULT[0]), .Z(N48) );
  INR2D0HVT U89 ( .A1(ADD_RESULT_V2[1]), .B1(n29), .ZN(N96) );
  AO222D0HVT U90 ( .A1(n28), .A2(activation_out[1]), .B1(n27), .B2(
        ADD_RESULT[1]), .C1(ADD_OP_A[1]), .C2(n26), .Z(N49) );
  AO222D0HVT U91 ( .A1(n28), .A2(activation_out[2]), .B1(n27), .B2(
        ADD_RESULT[2]), .C1(ADD_OP_A[2]), .C2(n26), .Z(N50) );
  INR2D0HVT U92 ( .A1(ADD_RESULT_V2[2]), .B1(n29), .ZN(N97) );
  AO222D0HVT U93 ( .A1(n28), .A2(activation_out[3]), .B1(n27), .B2(
        ADD_RESULT[3]), .C1(ADD_OP_A[3]), .C2(n26), .Z(N51) );
  AO222D0HVT U94 ( .A1(n28), .A2(activation_out[4]), .B1(n27), .B2(
        ADD_RESULT[4]), .C1(ADD_OP_A[4]), .C2(n26), .Z(N52) );
  AO222D0HVT U95 ( .A1(n28), .A2(activation_out[5]), .B1(n27), .B2(
        ADD_RESULT[5]), .C1(ADD_OP_A[5]), .C2(n26), .Z(N53) );
  AO222D0HVT U96 ( .A1(n28), .A2(activation_out[6]), .B1(n27), .B2(
        ADD_RESULT[6]), .C1(ADD_OP_A[6]), .C2(n26), .Z(N54) );
  AO222D0HVT U97 ( .A1(n28), .A2(activation_out[7]), .B1(n27), .B2(
        ADD_RESULT[7]), .C1(ADD_OP_A[7]), .C2(n26), .Z(N55) );
  INR2D0HVT U98 ( .A1(ADD_RESULT_V2[3]), .B1(n29), .ZN(N98) );
  INR2D0HVT U99 ( .A1(ADD_RESULT_V2[4]), .B1(n29), .ZN(N99) );
  INR2D0HVT U100 ( .A1(ADD_RESULT_V2[5]), .B1(n29), .ZN(N100) );
  INR2D0HVT U101 ( .A1(ADD_RESULT_V2[6]), .B1(n29), .ZN(N101) );
  INR2D0HVT U102 ( .A1(ADD_RESULT_V2[7]), .B1(n29), .ZN(N102) );
  INR2D0HVT U103 ( .A1(ADD_RESULT_V2[8]), .B1(n29), .ZN(N103) );
  INR2D0HVT U104 ( .A1(ADD_RESULT_V2[9]), .B1(n29), .ZN(N104) );
  INR2D0HVT U105 ( .A1(ADD_RESULT_V2[10]), .B1(n29), .ZN(N105) );
  INR2D0HVT U106 ( .A1(ADD_RESULT_V2[11]), .B1(n29), .ZN(N106) );
  INR2D0HVT U107 ( .A1(ADD_RESULT_V2[12]), .B1(n29), .ZN(N107) );
  INR2D0HVT U108 ( .A1(ADD_RESULT_V2[13]), .B1(n29), .ZN(N108) );
  INR2D0HVT U109 ( .A1(ADD_RESULT_V2[14]), .B1(n29), .ZN(N109) );
  INR2D0HVT U110 ( .A1(ADD_RESULT_V2[15]), .B1(n29), .ZN(N110) );
  INR2D0HVT U111 ( .A1(ADD_RESULT_V2[16]), .B1(n29), .ZN(N111) );
  INR2D0HVT U112 ( .A1(ADD_RESULT_V2[17]), .B1(n29), .ZN(N112) );
  INR2D0HVT U113 ( .A1(ADD_RESULT_V2[18]), .B1(n29), .ZN(N113) );
  INR2D0HVT U114 ( .A1(ADD_RESULT_V2[19]), .B1(n29), .ZN(N114) );
  INR2D0HVT U115 ( .A1(ADD_RESULT_V2[20]), .B1(n29), .ZN(N115) );
  INR2D0HVT U116 ( .A1(ADD_RESULT_V2[21]), .B1(n29), .ZN(N116) );
  AO22D0HVT U117 ( .A1(n31), .A2(weight_last[7]), .B1(n30), .B2(weight_idx[7]), 
        .Z(n17) );
  AO22D0HVT U118 ( .A1(n31), .A2(weight_last[4]), .B1(n30), .B2(weight_idx[4]), 
        .Z(n14) );
  AO22D0HVT U119 ( .A1(n31), .A2(weight_last[1]), .B1(n30), .B2(weight_idx[1]), 
        .Z(n11) );
  AO22D0HVT U120 ( .A1(n31), .A2(weight_last[0]), .B1(n30), .B2(weight_idx[0]), 
        .Z(n10) );
endmodule

