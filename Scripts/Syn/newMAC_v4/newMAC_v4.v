/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jan 30 00:25:42 2026
/////////////////////////////////////////////////////////////


module inputGen ( en, data_valid, weight, activation, data_valid_out, 
        weight_check, compute_check, weight_idx, activation_out );
  input [3:0] weight;
  input [7:0] activation;
  output [3:0] weight_idx;
  output [13:0] activation_out;
  input en, data_valid;
  output data_valid_out, weight_check, compute_check;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;
  assign activation_out[0] = activation[0];

  INVD0HVT U3 ( .I(activation[6]), .ZN(n23) );
  OAI31D0HVT U4 ( .A1(weight[2]), .A2(weight[1]), .A3(weight[0]), .B(
        data_valid), .ZN(n2) );
  CKND2D0HVT U5 ( .A1(data_valid), .A2(weight[3]), .ZN(n3) );
  CKND2D0HVT U6 ( .A1(n2), .A2(n3), .ZN(weight_check) );
  CKAN2D0HVT U7 ( .A1(weight[0]), .A2(data_valid), .Z(weight_idx[0]) );
  AOI22D0HVT U8 ( .A1(weight[1]), .A2(data_valid), .B1(weight[3]), .B2(
        weight_idx[0]), .ZN(n1) );
  AOI31D0HVT U9 ( .A1(weight[0]), .A2(weight[1]), .A3(weight[3]), .B(n1), .ZN(
        weight_idx[1]) );
  INR2D0HVT U10 ( .A1(n2), .B1(n3), .ZN(weight_idx[3]) );
  NR2D0HVT U11 ( .A1(activation[0]), .A2(activation[1]), .ZN(n5) );
  OAI21D0HVT U12 ( .A1(n3), .A2(n2), .B(weight_check), .ZN(n20) );
  INVD0HVT U13 ( .I(n20), .ZN(n16) );
  OAI21D0HVT U14 ( .A1(n5), .A2(n16), .B(activation[2]), .ZN(n4) );
  OAI31D0HVT U15 ( .A1(n5), .A2(activation[2]), .A3(n16), .B(n4), .ZN(
        activation_out[2]) );
  NR3D0HVT U16 ( .A1(activation[2]), .A2(activation[0]), .A3(activation[1]), 
        .ZN(n7) );
  OAI21D0HVT U17 ( .A1(n7), .A2(n16), .B(activation[3]), .ZN(n6) );
  OAI31D0HVT U18 ( .A1(n7), .A2(activation[3]), .A3(n16), .B(n6), .ZN(
        activation_out[3]) );
  OR4D0HVT U19 ( .A1(activation[3]), .A2(activation[2]), .A3(activation[0]), 
        .A4(activation[1]), .Z(n13) );
  NR2D0HVT U20 ( .A1(activation[4]), .A2(n13), .ZN(n17) );
  INVD0HVT U21 ( .I(activation[5]), .ZN(n19) );
  CKND2D0HVT U22 ( .A1(n17), .A2(n19), .ZN(n21) );
  NR2D0HVT U23 ( .A1(activation[6]), .A2(n21), .ZN(n10) );
  INVD0HVT U24 ( .I(activation[7]), .ZN(n9) );
  OAI32D0HVT U25 ( .A1(n16), .A2(activation[7]), .A3(n10), .B1(n9), .B2(n20), 
        .ZN(activation_out[8]) );
  AO21D0HVT U26 ( .A1(n10), .A2(activation[7]), .B(activation_out[8]), .Z(
        activation_out[7]) );
  INVD0HVT U27 ( .I(weight_check), .ZN(n8) );
  AOI21D0HVT U28 ( .A1(n10), .A2(n9), .B(n8), .ZN(compute_check) );
  INVD0HVT U29 ( .I(activation[1]), .ZN(n12) );
  CKND2D0HVT U30 ( .A1(activation[0]), .A2(n20), .ZN(n11) );
  MUX2ND0HVT U31 ( .I0(activation[1]), .I1(n12), .S(n11), .ZN(
        activation_out[1]) );
  INVD0HVT U32 ( .I(activation[4]), .ZN(n15) );
  CKND2D0HVT U33 ( .A1(n13), .A2(n20), .ZN(n14) );
  MUX2ND0HVT U34 ( .I0(activation[4]), .I1(n15), .S(n14), .ZN(
        activation_out[4]) );
  NR2D0HVT U35 ( .A1(n17), .A2(n16), .ZN(n18) );
  MUX2ND0HVT U36 ( .I0(n19), .I1(activation[5]), .S(n18), .ZN(
        activation_out[5]) );
  CKND2D0HVT U37 ( .A1(n21), .A2(n20), .ZN(n22) );
  MUX2ND0HVT U38 ( .I0(activation[6]), .I1(n23), .S(n22), .ZN(
        activation_out[6]) );
  OAI211D0HVT U39 ( .A1(weight[1]), .A2(weight[0]), .B(data_valid), .C(
        weight[3]), .ZN(n25) );
  INVD0HVT U40 ( .I(n25), .ZN(n26) );
  CKND2D0HVT U41 ( .A1(weight[2]), .A2(data_valid), .ZN(n24) );
  MUX2ND0HVT U42 ( .I0(n26), .I1(n25), .S(n24), .ZN(weight_idx[2]) );
endmodule


module action_arbiter ( data_valid_out, acc, compute_check, weight, 
        weight_last, ACC, MUL );
  input [3:0] weight;
  input [3:0] weight_last;
  input data_valid_out, acc, compute_check;
  output ACC, MUL;
  wire   compute_check, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  assign ACC = compute_check;

  AOI22D0HVT U1 ( .A1(n6), .A2(weight_last[1]), .B1(n5), .B2(weight_last[0]), 
        .ZN(n4) );
  INVD0HVT U2 ( .I(weight[2]), .ZN(n2) );
  INVD0HVT U3 ( .I(weight[3]), .ZN(n3) );
  INVD0HVT U4 ( .I(weight[0]), .ZN(n5) );
  INVD0HVT U5 ( .I(weight[1]), .ZN(n6) );
  ND4D0HVT U6 ( .A1(n2), .A2(n3), .A3(n5), .A4(n6), .ZN(n9) );
  AOI22D0HVT U7 ( .A1(n3), .A2(weight_last[3]), .B1(n2), .B2(weight_last[2]), 
        .ZN(n1) );
  OAI221D0HVT U8 ( .A1(n3), .A2(weight_last[3]), .B1(n2), .B2(weight_last[2]), 
        .C(n1), .ZN(n8) );
  OAI221D0HVT U9 ( .A1(n6), .A2(weight_last[1]), .B1(n5), .B2(weight_last[0]), 
        .C(n4), .ZN(n7) );
  AO221D0HVT U10 ( .A1(n9), .A2(n8), .B1(n9), .B2(n7), .C(acc), .Z(MUL) );
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
  CKAN2D0HVT U2 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_0/B[1] ) );
  INVD0HVT U3 ( .I(ADD_EN), .ZN(n2) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_0/CI ) );
  AN3D0HVT U5 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_0/B[0] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_0/A[0] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_0/A[1] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_0/B[2] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_0/A[2] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_0/B[3] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_0/A[3] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_0/B[4] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_0/A[4] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_0/B[5] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_0/A[5] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_0/B[6] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_0/A[6] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_0/B[7] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_0/B[8] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_0/B[9] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_0/B[10] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_0/B[11] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_0/A[11] ) );
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
  input [3:0] MUL_OP_B;
  output [17:0] MUL_RESULT;
  input MUL_EN;
  wire   \intadd_1/A[13] , \intadd_1/A[12] , \intadd_1/A[11] ,
         \intadd_1/A[10] , \intadd_1/A[9] , \intadd_1/A[8] , \intadd_1/A[7] ,
         \intadd_1/A[6] , \intadd_1/A[5] , \intadd_1/A[4] , \intadd_1/A[3] ,
         \intadd_1/A[2] , \intadd_1/A[1] , \intadd_1/A[0] , \intadd_1/B[13] ,
         \intadd_1/B[12] , \intadd_1/B[11] , \intadd_1/B[10] , \intadd_1/B[9] ,
         \intadd_1/B[8] , \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] ,
         \intadd_1/B[4] , \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] ,
         \intadd_1/B[0] , \intadd_1/CI , \intadd_1/SUM[13] ,
         \intadd_1/SUM[12] , \intadd_1/SUM[11] , \intadd_1/SUM[10] ,
         \intadd_1/SUM[9] , \intadd_1/SUM[8] , \intadd_1/SUM[7] ,
         \intadd_1/SUM[6] , \intadd_1/SUM[5] , \intadd_1/SUM[4] ,
         \intadd_1/SUM[3] , \intadd_1/SUM[2] , \intadd_1/SUM[1] ,
         \intadd_1/SUM[0] , \intadd_1/n14 , \intadd_1/n13 , \intadd_1/n12 ,
         \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 , \intadd_1/n8 ,
         \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 , \intadd_1/n4 ,
         \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87;
  assign MUL_RESULT[17] = \intadd_1/n1 ;

  FA1D0HVT \intadd_1/U15  ( .A(\intadd_1/A[0] ), .B(\intadd_1/B[0] ), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n14 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U14  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n14 ), .CO(\intadd_1/n13 ), .S(\intadd_1/SUM[1] ) );
  FA1D0HVT \intadd_1/U13  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n13 ), .CO(\intadd_1/n12 ), .S(\intadd_1/SUM[2] ) );
  FA1D0HVT \intadd_1/U12  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n12 ), .CO(\intadd_1/n11 ), .S(\intadd_1/SUM[3] ) );
  FA1D0HVT \intadd_1/U11  ( .A(\intadd_1/A[4] ), .B(\intadd_1/B[4] ), .CI(
        \intadd_1/n11 ), .CO(\intadd_1/n10 ), .S(\intadd_1/SUM[4] ) );
  FA1D0HVT \intadd_1/U10  ( .A(\intadd_1/A[5] ), .B(\intadd_1/B[5] ), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(\intadd_1/SUM[5] ) );
  FA1D0HVT \intadd_1/U9  ( .A(\intadd_1/A[6] ), .B(\intadd_1/B[6] ), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(\intadd_1/SUM[6] ) );
  FA1D0HVT \intadd_1/U8  ( .A(\intadd_1/A[7] ), .B(\intadd_1/B[7] ), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(\intadd_1/SUM[7] ) );
  FA1D0HVT \intadd_1/U7  ( .A(\intadd_1/A[8] ), .B(\intadd_1/B[8] ), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(\intadd_1/SUM[8] ) );
  FA1D0HVT \intadd_1/U6  ( .A(\intadd_1/A[9] ), .B(\intadd_1/B[9] ), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(\intadd_1/SUM[9] ) );
  FA1D0HVT \intadd_1/U5  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[10] ), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[10] ) );
  FA1D0HVT \intadd_1/U4  ( .A(\intadd_1/A[11] ), .B(\intadd_1/B[11] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(\intadd_1/SUM[11] ) );
  FA1D0HVT \intadd_1/U3  ( .A(\intadd_1/A[12] ), .B(\intadd_1/B[12] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(\intadd_1/SUM[12] ) );
  FA1D0HVT \intadd_1/U2  ( .A(\intadd_1/A[13] ), .B(\intadd_1/B[13] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(\intadd_1/SUM[13] ) );
  CKAN2D0HVT U2 ( .A1(n46), .A2(n72), .Z(n1) );
  CKND2D0HVT U3 ( .A1(n1), .A2(n14), .ZN(n13) );
  CKND2D0HVT U4 ( .A1(n1), .A2(n29), .ZN(n28) );
  OAI22D0HVT U5 ( .A1(n78), .A2(n12), .B1(n79), .B2(n15), .ZN(n51) );
  OAI22D0HVT U6 ( .A1(n78), .A2(n36), .B1(n79), .B2(n39), .ZN(n67) );
  CKND2D0HVT U7 ( .A1(n61), .A2(n62), .ZN(\intadd_1/B[7] ) );
  INVD0HVT U8 ( .I(n84), .ZN(n85) );
  INVD0HVT U9 ( .I(\intadd_1/A[12] ), .ZN(\intadd_1/B[13] ) );
  INVD0HVT U10 ( .I(\intadd_1/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U11 ( .I(\intadd_1/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U12 ( .I(\intadd_1/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U13 ( .I(\intadd_1/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U14 ( .I(\intadd_1/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U15 ( .I(\intadd_1/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U16 ( .I(\intadd_1/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U17 ( .I(\intadd_1/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U18 ( .I(\intadd_1/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U19 ( .I(\intadd_1/SUM[9] ), .ZN(MUL_RESULT[12]) );
  INVD0HVT U20 ( .I(\intadd_1/SUM[10] ), .ZN(MUL_RESULT[13]) );
  INVD0HVT U21 ( .I(\intadd_1/SUM[11] ), .ZN(MUL_RESULT[14]) );
  INVD0HVT U22 ( .I(\intadd_1/SUM[12] ), .ZN(MUL_RESULT[15]) );
  INVD0HVT U23 ( .I(\intadd_1/SUM[13] ), .ZN(MUL_RESULT[16]) );
  ND3D0HVT U24 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .A3(MUL_OP_B[1]), .ZN(n80) );
  INVD0HVT U25 ( .I(MUL_OP_A[2]), .ZN(n11) );
  CKND2D0HVT U26 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n46) );
  CKND2D0HVT U27 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n86) );
  INVD0HVT U28 ( .I(n86), .ZN(n72) );
  NR2D0HVT U29 ( .A1(n46), .A2(n72), .ZN(n81) );
  INVD0HVT U30 ( .I(n81), .ZN(n41) );
  INVD0HVT U31 ( .I(MUL_OP_A[1]), .ZN(n83) );
  CKND2D0HVT U32 ( .A1(n1), .A2(n83), .ZN(n2) );
  OAI221D0HVT U33 ( .A1(MUL_OP_A[2]), .A2(n80), .B1(n11), .B2(n41), .C(n2), 
        .ZN(n47) );
  CKND2D0HVT U34 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n7) );
  NR2D0HVT U35 ( .A1(n72), .A2(n7), .ZN(n4) );
  INVD0HVT U36 ( .I(n7), .ZN(n8) );
  NR2D0HVT U37 ( .A1(n8), .A2(n86), .ZN(n3) );
  NR2D0HVT U38 ( .A1(n4), .A2(n3), .ZN(n79) );
  INVD0HVT U39 ( .I(MUL_OP_A[0]), .ZN(n45) );
  OAI211D0HVT U40 ( .A1(n46), .A2(n83), .B(n72), .C(n45), .ZN(n84) );
  OAI21D0HVT U41 ( .A1(n79), .A2(n45), .B(n84), .ZN(n48) );
  CKND2D0HVT U42 ( .A1(n47), .A2(n48), .ZN(\intadd_1/CI ) );
  CKND2D0HVT U43 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n44) );
  INVD0HVT U44 ( .I(n44), .ZN(n43) );
  INVD0HVT U45 ( .I(n79), .ZN(n6) );
  NR3D0HVT U46 ( .A1(n72), .A2(n8), .A3(n44), .ZN(n5) );
  AOI31D0HVT U47 ( .A1(n43), .A2(n45), .A3(n6), .B(n5), .ZN(\intadd_1/B[0] )
         );
  AOI33D0HVT U48 ( .A1(n72), .A2(n8), .A3(n44), .B1(n43), .B2(n7), .B3(n86), 
        .ZN(n78) );
  AOI22D0HVT U49 ( .A1(MUL_OP_A[0]), .A2(n44), .B1(n43), .B2(n45), .ZN(n9) );
  AOI22D0HVT U50 ( .A1(MUL_OP_A[1]), .A2(n44), .B1(n43), .B2(n83), .ZN(n12) );
  OAI22D0HVT U51 ( .A1(n78), .A2(n9), .B1(n79), .B2(n12), .ZN(n49) );
  INVD0HVT U52 ( .I(MUL_OP_A[3]), .ZN(n14) );
  CKND2D0HVT U53 ( .A1(n1), .A2(n11), .ZN(n10) );
  OAI221D0HVT U54 ( .A1(MUL_OP_A[3]), .A2(n80), .B1(n14), .B2(n41), .C(n10), 
        .ZN(n50) );
  CKND2D0HVT U55 ( .A1(n49), .A2(n50), .ZN(\intadd_1/B[1] ) );
  AOI22D0HVT U56 ( .A1(MUL_OP_A[2]), .A2(n44), .B1(n43), .B2(n11), .ZN(n15) );
  INVD0HVT U57 ( .I(MUL_OP_A[4]), .ZN(n17) );
  OAI221D0HVT U58 ( .A1(MUL_OP_A[4]), .A2(n80), .B1(n17), .B2(n41), .C(n13), 
        .ZN(n52) );
  CKND2D0HVT U59 ( .A1(n51), .A2(n52), .ZN(\intadd_1/B[2] ) );
  AOI22D0HVT U60 ( .A1(n43), .A2(n14), .B1(MUL_OP_A[3]), .B2(n44), .ZN(n18) );
  OAI22D0HVT U61 ( .A1(n78), .A2(n15), .B1(n79), .B2(n18), .ZN(n53) );
  INVD0HVT U62 ( .I(MUL_OP_A[5]), .ZN(n20) );
  CKND2D0HVT U63 ( .A1(n1), .A2(n17), .ZN(n16) );
  OAI221D0HVT U64 ( .A1(MUL_OP_A[5]), .A2(n80), .B1(n20), .B2(n41), .C(n16), 
        .ZN(n54) );
  CKND2D0HVT U65 ( .A1(n53), .A2(n54), .ZN(\intadd_1/B[3] ) );
  AOI22D0HVT U66 ( .A1(n43), .A2(n17), .B1(MUL_OP_A[4]), .B2(n44), .ZN(n21) );
  OAI22D0HVT U67 ( .A1(n78), .A2(n18), .B1(n79), .B2(n21), .ZN(n55) );
  INVD0HVT U68 ( .I(MUL_OP_A[6]), .ZN(n23) );
  CKND2D0HVT U69 ( .A1(n1), .A2(n20), .ZN(n19) );
  OAI221D0HVT U70 ( .A1(MUL_OP_A[6]), .A2(n80), .B1(n23), .B2(n41), .C(n19), 
        .ZN(n56) );
  CKND2D0HVT U71 ( .A1(n55), .A2(n56), .ZN(\intadd_1/B[4] ) );
  AOI22D0HVT U72 ( .A1(n43), .A2(n20), .B1(MUL_OP_A[5]), .B2(n44), .ZN(n24) );
  OAI22D0HVT U73 ( .A1(n78), .A2(n21), .B1(n79), .B2(n24), .ZN(n57) );
  INVD0HVT U74 ( .I(MUL_OP_A[7]), .ZN(n26) );
  CKND2D0HVT U75 ( .A1(n1), .A2(n23), .ZN(n22) );
  OAI221D0HVT U76 ( .A1(MUL_OP_A[7]), .A2(n80), .B1(n26), .B2(n41), .C(n22), 
        .ZN(n58) );
  CKND2D0HVT U77 ( .A1(n57), .A2(n58), .ZN(\intadd_1/B[5] ) );
  AOI22D0HVT U78 ( .A1(n43), .A2(n23), .B1(MUL_OP_A[6]), .B2(n44), .ZN(n27) );
  OAI22D0HVT U79 ( .A1(n78), .A2(n24), .B1(n79), .B2(n27), .ZN(n59) );
  INVD0HVT U80 ( .I(MUL_OP_A[8]), .ZN(n29) );
  CKND2D0HVT U81 ( .A1(n1), .A2(n26), .ZN(n25) );
  OAI221D0HVT U82 ( .A1(MUL_OP_A[8]), .A2(n80), .B1(n29), .B2(n41), .C(n25), 
        .ZN(n60) );
  CKND2D0HVT U83 ( .A1(n59), .A2(n60), .ZN(\intadd_1/B[6] ) );
  AOI22D0HVT U84 ( .A1(n43), .A2(n26), .B1(MUL_OP_A[7]), .B2(n44), .ZN(n30) );
  OAI22D0HVT U85 ( .A1(n78), .A2(n27), .B1(n79), .B2(n30), .ZN(n61) );
  INVD0HVT U86 ( .I(MUL_OP_A[9]), .ZN(n32) );
  OAI221D0HVT U87 ( .A1(MUL_OP_A[9]), .A2(n80), .B1(n32), .B2(n41), .C(n28), 
        .ZN(n62) );
  AOI22D0HVT U88 ( .A1(n43), .A2(n29), .B1(MUL_OP_A[8]), .B2(n44), .ZN(n33) );
  OAI22D0HVT U89 ( .A1(n78), .A2(n30), .B1(n79), .B2(n33), .ZN(n63) );
  INVD0HVT U90 ( .I(MUL_OP_A[10]), .ZN(n35) );
  CKND2D0HVT U91 ( .A1(n1), .A2(n32), .ZN(n31) );
  OAI221D0HVT U92 ( .A1(MUL_OP_A[10]), .A2(n80), .B1(n35), .B2(n41), .C(n31), 
        .ZN(n64) );
  CKND2D0HVT U93 ( .A1(n63), .A2(n64), .ZN(\intadd_1/B[8] ) );
  AOI22D0HVT U94 ( .A1(n43), .A2(n32), .B1(MUL_OP_A[9]), .B2(n44), .ZN(n36) );
  OAI22D0HVT U95 ( .A1(n78), .A2(n33), .B1(n79), .B2(n36), .ZN(n65) );
  INVD0HVT U96 ( .I(MUL_OP_A[11]), .ZN(n38) );
  CKND2D0HVT U97 ( .A1(n1), .A2(n35), .ZN(n34) );
  OAI221D0HVT U98 ( .A1(MUL_OP_A[11]), .A2(n80), .B1(n38), .B2(n41), .C(n34), 
        .ZN(n66) );
  CKND2D0HVT U99 ( .A1(n65), .A2(n66), .ZN(\intadd_1/B[9] ) );
  AOI22D0HVT U100 ( .A1(n43), .A2(n35), .B1(MUL_OP_A[10]), .B2(n44), .ZN(n39)
         );
  INVD0HVT U101 ( .I(MUL_OP_A[12]), .ZN(n42) );
  CKND2D0HVT U102 ( .A1(n1), .A2(n38), .ZN(n37) );
  OAI221D0HVT U103 ( .A1(MUL_OP_A[12]), .A2(n80), .B1(n42), .B2(n41), .C(n37), 
        .ZN(n68) );
  CKND2D0HVT U104 ( .A1(n67), .A2(n68), .ZN(\intadd_1/B[10] ) );
  AOI22D0HVT U105 ( .A1(n43), .A2(n38), .B1(MUL_OP_A[11]), .B2(n44), .ZN(n74)
         );
  OAI22D0HVT U106 ( .A1(n78), .A2(n39), .B1(n79), .B2(n74), .ZN(n69) );
  INVD0HVT U107 ( .I(MUL_OP_A[13]), .ZN(n71) );
  CKND2D0HVT U108 ( .A1(n1), .A2(n42), .ZN(n40) );
  OAI221D0HVT U109 ( .A1(MUL_OP_A[13]), .A2(n80), .B1(n71), .B2(n41), .C(n40), 
        .ZN(n70) );
  CKND2D0HVT U110 ( .A1(n69), .A2(n70), .ZN(\intadd_1/B[11] ) );
  AOI22D0HVT U111 ( .A1(n43), .A2(n42), .B1(MUL_OP_A[12]), .B2(n44), .ZN(n73)
         );
  AOI22D0HVT U112 ( .A1(MUL_OP_A[13]), .A2(n44), .B1(n43), .B2(n71), .ZN(n77)
         );
  OAI22D0HVT U113 ( .A1(n78), .A2(n73), .B1(n79), .B2(n77), .ZN(
        \intadd_1/A[12] ) );
  NR2D0HVT U114 ( .A1(n46), .A2(n45), .ZN(MUL_RESULT[0]) );
  OA21D0HVT U115 ( .A1(n48), .A2(n47), .B(\intadd_1/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U116 ( .A1(n50), .A2(n49), .B(\intadd_1/B[1] ), .ZN(
        \intadd_1/A[0] ) );
  OAI21D0HVT U117 ( .A1(n52), .A2(n51), .B(\intadd_1/B[2] ), .ZN(
        \intadd_1/A[1] ) );
  OAI21D0HVT U118 ( .A1(n54), .A2(n53), .B(\intadd_1/B[3] ), .ZN(
        \intadd_1/A[2] ) );
  OAI21D0HVT U119 ( .A1(n56), .A2(n55), .B(\intadd_1/B[4] ), .ZN(
        \intadd_1/A[3] ) );
  OAI21D0HVT U120 ( .A1(n58), .A2(n57), .B(\intadd_1/B[5] ), .ZN(
        \intadd_1/A[4] ) );
  OAI21D0HVT U121 ( .A1(n60), .A2(n59), .B(\intadd_1/B[6] ), .ZN(
        \intadd_1/A[5] ) );
  OAI21D0HVT U122 ( .A1(n62), .A2(n61), .B(\intadd_1/B[7] ), .ZN(
        \intadd_1/A[6] ) );
  OAI21D0HVT U123 ( .A1(n64), .A2(n63), .B(\intadd_1/B[8] ), .ZN(
        \intadd_1/A[7] ) );
  OAI21D0HVT U124 ( .A1(n66), .A2(n65), .B(\intadd_1/B[9] ), .ZN(
        \intadd_1/A[8] ) );
  OAI21D0HVT U125 ( .A1(n68), .A2(n67), .B(\intadd_1/B[10] ), .ZN(
        \intadd_1/A[9] ) );
  OAI21D0HVT U126 ( .A1(n70), .A2(n69), .B(\intadd_1/B[11] ), .ZN(
        \intadd_1/A[10] ) );
  AOI22D0HVT U127 ( .A1(MUL_OP_A[13]), .A2(n81), .B1(n72), .B2(n71), .ZN(n76)
         );
  OAI22D0HVT U128 ( .A1(n78), .A2(n74), .B1(n79), .B2(n73), .ZN(n75) );
  NR2D0HVT U129 ( .A1(n76), .A2(n75), .ZN(\intadd_1/B[12] ) );
  AOI21D0HVT U130 ( .A1(n76), .A2(n75), .B(\intadd_1/B[12] ), .ZN(
        \intadd_1/A[11] ) );
  AOI21D0HVT U131 ( .A1(n79), .A2(n78), .B(n77), .ZN(\intadd_1/A[13] ) );
  INVD0HVT U132 ( .I(n80), .ZN(n82) );
  AOI22D0HVT U133 ( .A1(n83), .A2(n82), .B1(MUL_OP_A[1]), .B2(n81), .ZN(n87)
         );
  AOI221D0HVT U134 ( .A1(MUL_RESULT[0]), .A2(n87), .B1(n86), .B2(n87), .C(n85), 
        .ZN(MUL_RESULT[1]) );
endmodule


module ADDER_v3 ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [17:0] ADD_OP_A;
  input [17:0] ADD_OP_B;
  output [17:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_2/A[15] , \intadd_2/A[14] , \intadd_2/A[13] ,
         \intadd_2/A[12] , \intadd_2/A[11] , \intadd_2/A[10] , \intadd_2/A[9] ,
         \intadd_2/A[8] , \intadd_2/A[7] , \intadd_2/A[6] , \intadd_2/A[5] ,
         \intadd_2/A[4] , \intadd_2/A[3] , \intadd_2/A[2] , \intadd_2/A[1] ,
         \intadd_2/A[0] , \intadd_2/B[15] , \intadd_2/B[14] , \intadd_2/B[13] ,
         \intadd_2/B[12] , \intadd_2/B[11] , \intadd_2/B[10] , \intadd_2/B[9] ,
         \intadd_2/B[8] , \intadd_2/B[7] , \intadd_2/B[6] , \intadd_2/B[5] ,
         \intadd_2/B[4] , \intadd_2/B[3] , \intadd_2/B[2] , \intadd_2/B[1] ,
         \intadd_2/B[0] , \intadd_2/CI , \intadd_2/n16 , \intadd_2/n15 ,
         \intadd_2/n14 , \intadd_2/n13 , \intadd_2/n12 , \intadd_2/n11 ,
         \intadd_2/n10 , \intadd_2/n9 , \intadd_2/n8 , \intadd_2/n7 ,
         \intadd_2/n6 , \intadd_2/n5 , \intadd_2/n4 , \intadd_2/n3 ,
         \intadd_2/n2 , \intadd_2/n1 , n1, n2, n3, n4;

  FA1D0HVT \intadd_2/U17  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n16 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_2/U16  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n16 ), .CO(\intadd_2/n15 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_2/U15  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n15 ), .CO(\intadd_2/n14 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_2/U14  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n14 ), .CO(\intadd_2/n13 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_2/U13  ( .A(\intadd_2/A[4] ), .B(\intadd_2/B[4] ), .CI(
        \intadd_2/n13 ), .CO(\intadd_2/n12 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_2/U12  ( .A(\intadd_2/A[5] ), .B(\intadd_2/B[5] ), .CI(
        \intadd_2/n12 ), .CO(\intadd_2/n11 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_2/U11  ( .A(\intadd_2/A[6] ), .B(\intadd_2/B[6] ), .CI(
        \intadd_2/n11 ), .CO(\intadd_2/n10 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_2/U10  ( .A(\intadd_2/A[7] ), .B(\intadd_2/B[7] ), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_2/U9  ( .A(\intadd_2/A[8] ), .B(\intadd_2/B[8] ), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_2/U8  ( .A(\intadd_2/A[9] ), .B(\intadd_2/B[9] ), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_2/U7  ( .A(\intadd_2/A[10] ), .B(\intadd_2/B[10] ), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_2/U6  ( .A(\intadd_2/A[11] ), .B(\intadd_2/B[11] ), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(ADD_RESULT[12]) );
  FA1D0HVT \intadd_2/U5  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[12] ), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(ADD_RESULT[13]) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[13] ), .B(\intadd_2/B[13] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(ADD_RESULT[14]) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[14] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(ADD_RESULT[15]) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[15] ), .B(\intadd_2/B[15] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(ADD_RESULT[16]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_2/B[1] ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_2/A[8] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_A[14]), .A2(ADD_EN), .Z(\intadd_2/A[13] ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_2/CI ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_2/A[0] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_2/A[1] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_2/B[2] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_2/A[2] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_2/B[3] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_2/A[3] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_2/A[4] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_2/A[5] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_2/A[6] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_B[9]), .A2(ADD_EN), .Z(\intadd_2/B[8] ) );
  INVD0HVT U16 ( .I(ADD_EN), .ZN(n2) );
  AN3D0HVT U17 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_2/B[0] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_2/B[4] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_2/B[5] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_2/B[6] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_2/B[7] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_2/A[7] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_B[10]), .A2(ADD_EN), .Z(\intadd_2/B[9] ) );
  CKAN2D0HVT U24 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_2/A[9] ) );
  CKAN2D0HVT U25 ( .A1(ADD_OP_B[11]), .A2(ADD_EN), .Z(\intadd_2/B[10] ) );
  CKAN2D0HVT U26 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_2/A[10] ) );
  CKAN2D0HVT U27 ( .A1(ADD_OP_B[12]), .A2(ADD_EN), .Z(\intadd_2/B[11] ) );
  CKAN2D0HVT U28 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_2/A[11] ) );
  CKAN2D0HVT U29 ( .A1(ADD_OP_B[13]), .A2(ADD_EN), .Z(\intadd_2/B[12] ) );
  CKAN2D0HVT U30 ( .A1(ADD_OP_A[13]), .A2(ADD_EN), .Z(\intadd_2/A[12] ) );
  CKAN2D0HVT U31 ( .A1(ADD_OP_B[14]), .A2(ADD_EN), .Z(\intadd_2/B[13] ) );
  CKAN2D0HVT U32 ( .A1(ADD_OP_B[15]), .A2(ADD_EN), .Z(\intadd_2/B[14] ) );
  CKAN2D0HVT U33 ( .A1(ADD_OP_A[15]), .A2(ADD_EN), .Z(\intadd_2/A[14] ) );
  CKAN2D0HVT U34 ( .A1(ADD_OP_B[16]), .A2(ADD_EN), .Z(\intadd_2/B[15] ) );
  CKAN2D0HVT U35 ( .A1(ADD_OP_A[16]), .A2(ADD_EN), .Z(\intadd_2/A[15] ) );
  NR2D0HVT U36 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U37 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U38 ( .A1(ADD_OP_A[17]), .A2(ADD_OP_B[17]), .ZN(n3) );
  OAI211D0HVT U39 ( .A1(ADD_OP_A[17]), .A2(ADD_OP_B[17]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U40 ( .A1(\intadd_2/n1 ), .A2(n4), .ZN(ADD_RESULT[17]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v4_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_newMAC_v4_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module newMAC_v4 ( clk, rst_n, en, data_valid, weight, activation, reset, acc, 
        output_valid, output_result );
  input [3:0] weight;
  input [7:0] activation;
  output [17:0] output_result;
  input clk, rst_n, en, data_valid, reset, acc;
  output output_valid;
  wire   \*Logic0* , weight_check, compute_check, ACC, MUL, ADD_EN, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N86, N87,
         N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, net201, net207, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [3:0] weight_idx;
  wire   [13:0] activation_out;
  wire   [3:0] weight_last;
  wire   [13:0] ADD_OP_A;
  wire   [13:0] ADD_RESULT;
  wire   [17:0] ADD_OP_B_V2;
  wire   [17:0] ADD_RESULT_V2;
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
  MULTIPLIER_V1 u_MULTIPLIER_V1 ( .MUL_EN(MUL), .MUL_OP_A(ADD_OP_A), 
        .MUL_OP_B(weight_last), .MUL_RESULT(ADD_OP_B_V2) );
  ADDER_v3 u_ADDER_v3 ( .ADD_EN(MUL), .ADD_OP_A(output_result), .ADD_OP_B(
        ADD_OP_B_V2), .ADD_RESULT(ADD_RESULT_V2) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v4_0 clk_gate_weight_last_reg ( .CLK(clk), .EN(
        en), .ENCLK(net201), .TE(\*Logic0* ) );
  SNPS_CLOCK_GATE_HIGH_newMAC_v4_1 clk_gate_output_result_reg ( .CLK(clk), 
        .EN(N105), .ENCLK(net207), .TE(\*Logic0* ) );
  DFCNQD1HVT \weight_last_reg[3]  ( .D(n13), .CP(net201), .CDN(rst_n), .Q(
        weight_last[3]) );
  DFCNQD1HVT \weight_last_reg[2]  ( .D(n12), .CP(net201), .CDN(rst_n), .Q(
        weight_last[2]) );
  DFCNQD1HVT \weight_last_reg[1]  ( .D(n11), .CP(net201), .CDN(rst_n), .Q(
        weight_last[1]) );
  DFCNQD1HVT \weight_last_reg[0]  ( .D(n10), .CP(net201), .CDN(rst_n), .Q(
        weight_last[0]) );
  DFCNQD1HVT \sumTemp_reg[0]  ( .D(N44), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[0]) );
  DFCNQD1HVT \sumTemp_reg[1]  ( .D(N45), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[1]) );
  DFCNQD1HVT \sumTemp_reg[2]  ( .D(N46), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[2]) );
  DFCNQD1HVT \sumTemp_reg[3]  ( .D(N47), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[3]) );
  DFCNQD1HVT \sumTemp_reg[4]  ( .D(N48), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[4]) );
  DFCNQD1HVT \sumTemp_reg[5]  ( .D(N49), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[5]) );
  DFCNQD1HVT \sumTemp_reg[6]  ( .D(N50), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[6]) );
  DFCNQD1HVT \sumTemp_reg[7]  ( .D(N51), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[7]) );
  DFCNQD1HVT \sumTemp_reg[8]  ( .D(N52), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[8]) );
  DFCNQD1HVT \sumTemp_reg[9]  ( .D(N53), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[9]) );
  DFCNQD1HVT \sumTemp_reg[10]  ( .D(N54), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[10]) );
  DFCNQD1HVT \sumTemp_reg[11]  ( .D(N55), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[11]) );
  DFCNQD1HVT \sumTemp_reg[12]  ( .D(N56), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[12]) );
  DFCNQD1HVT \sumTemp_reg[13]  ( .D(N57), .CP(net201), .CDN(rst_n), .Q(
        ADD_OP_A[13]) );
  DFCNQD1HVT output_valid_reg ( .D(N86), .CP(net207), .CDN(rst_n), .Q(
        output_valid) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N101), .CP(net207), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N102), .CP(net207), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N103), .CP(net207), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[17]  ( .D(N104), .CP(net207), .CDN(rst_n), .Q(
        output_result[17]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N100), .CP(net207), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N99), .CP(net207), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N98), .CP(net207), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N97), .CP(net207), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N96), .CP(net207), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N95), .CP(net207), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N94), .CP(net207), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N93), .CP(net207), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N92), .CP(net207), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N91), .CP(net207), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N90), .CP(net207), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N89), .CP(net207), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N88), .CP(net207), .CDN(rst_n), .Q(
        output_result[1]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N87), .CP(net207), .CDN(rst_n), .Q(
        output_result[0]) );
  TIELHVT U50 ( .ZN(\*Logic0* ) );
  AOI22D0HVT U51 ( .A1(n22), .A2(ADD_OP_A[11]), .B1(n23), .B2(ADD_RESULT[11]), 
        .ZN(n18) );
  CKND2D0HVT U52 ( .A1(n16), .A2(n20), .ZN(N53) );
  INVD0HVT U53 ( .I(ACC), .ZN(n14) );
  NR2XD0HVT U54 ( .A1(MUL), .A2(n14), .ZN(ADD_EN) );
  NR2D0HVT U55 ( .A1(reset), .A2(weight_check), .ZN(n27) );
  INR2D0HVT U56 ( .A1(weight_check), .B1(reset), .ZN(n26) );
  AO22D0HVT U57 ( .A1(n27), .A2(weight_last[0]), .B1(n26), .B2(weight_idx[0]), 
        .Z(n10) );
  AO22D0HVT U58 ( .A1(n27), .A2(weight_last[3]), .B1(n26), .B2(weight_idx[3]), 
        .Z(n13) );
  NR3D0HVT U59 ( .A1(ACC), .A2(reset), .A3(MUL), .ZN(n22) );
  INR2D0HVT U60 ( .A1(ADD_EN), .B1(reset), .ZN(n23) );
  AOI22D0HVT U61 ( .A1(n22), .A2(ADD_OP_A[8]), .B1(n23), .B2(ADD_RESULT[8]), 
        .ZN(n15) );
  IND2D0HVT U62 ( .A1(reset), .B1(MUL), .ZN(n25) );
  NR2D0HVT U63 ( .A1(n14), .A2(n25), .ZN(n24) );
  CKND2D0HVT U64 ( .A1(n24), .A2(activation_out[8]), .ZN(n20) );
  CKND2D0HVT U65 ( .A1(n15), .A2(n20), .ZN(N52) );
  AOI22D0HVT U66 ( .A1(n22), .A2(ADD_OP_A[9]), .B1(n23), .B2(ADD_RESULT[9]), 
        .ZN(n16) );
  AOI22D0HVT U67 ( .A1(n22), .A2(ADD_OP_A[10]), .B1(n23), .B2(ADD_RESULT[10]), 
        .ZN(n17) );
  CKND2D0HVT U68 ( .A1(n17), .A2(n20), .ZN(N54) );
  CKND2D0HVT U69 ( .A1(n18), .A2(n20), .ZN(N55) );
  AOI22D0HVT U70 ( .A1(n22), .A2(ADD_OP_A[12]), .B1(n23), .B2(ADD_RESULT[12]), 
        .ZN(n19) );
  CKND2D0HVT U71 ( .A1(n19), .A2(n20), .ZN(N56) );
  AOI22D0HVT U72 ( .A1(n22), .A2(ADD_OP_A[13]), .B1(n23), .B2(ADD_RESULT[13]), 
        .ZN(n21) );
  CKND2D0HVT U73 ( .A1(n21), .A2(n20), .ZN(N57) );
  OA21D0HVT U74 ( .A1(reset), .A2(MUL), .B(en), .Z(N105) );
  INR2D0HVT U75 ( .A1(acc), .B1(n25), .ZN(N86) );
  INR2D0HVT U76 ( .A1(ADD_RESULT_V2[0]), .B1(n25), .ZN(N87) );
  AO222D0HVT U77 ( .A1(n24), .A2(activation_out[0]), .B1(n22), .B2(ADD_OP_A[0]), .C1(n23), .C2(ADD_RESULT[0]), .Z(N44) );
  AO222D0HVT U78 ( .A1(n24), .A2(activation_out[1]), .B1(n23), .B2(
        ADD_RESULT[1]), .C1(ADD_OP_A[1]), .C2(n22), .Z(N45) );
  INR2D0HVT U79 ( .A1(ADD_RESULT_V2[1]), .B1(n25), .ZN(N88) );
  AO222D0HVT U80 ( .A1(n24), .A2(activation_out[2]), .B1(n23), .B2(
        ADD_RESULT[2]), .C1(ADD_OP_A[2]), .C2(n22), .Z(N46) );
  AO222D0HVT U81 ( .A1(n24), .A2(activation_out[3]), .B1(n23), .B2(
        ADD_RESULT[3]), .C1(ADD_OP_A[3]), .C2(n22), .Z(N47) );
  INR2D0HVT U82 ( .A1(ADD_RESULT_V2[2]), .B1(n25), .ZN(N89) );
  AO222D0HVT U83 ( .A1(n24), .A2(activation_out[4]), .B1(n23), .B2(
        ADD_RESULT[4]), .C1(ADD_OP_A[4]), .C2(n22), .Z(N48) );
  AO222D0HVT U84 ( .A1(n24), .A2(activation_out[5]), .B1(n23), .B2(
        ADD_RESULT[5]), .C1(ADD_OP_A[5]), .C2(n22), .Z(N49) );
  AO222D0HVT U85 ( .A1(n24), .A2(activation_out[6]), .B1(n23), .B2(
        ADD_RESULT[6]), .C1(ADD_OP_A[6]), .C2(n22), .Z(N50) );
  AO222D0HVT U86 ( .A1(n24), .A2(activation_out[7]), .B1(n23), .B2(
        ADD_RESULT[7]), .C1(ADD_OP_A[7]), .C2(n22), .Z(N51) );
  INR2D0HVT U87 ( .A1(ADD_RESULT_V2[3]), .B1(n25), .ZN(N90) );
  INR2D0HVT U88 ( .A1(ADD_RESULT_V2[4]), .B1(n25), .ZN(N91) );
  INR2D0HVT U89 ( .A1(ADD_RESULT_V2[5]), .B1(n25), .ZN(N92) );
  INR2D0HVT U90 ( .A1(ADD_RESULT_V2[6]), .B1(n25), .ZN(N93) );
  INR2D0HVT U91 ( .A1(ADD_RESULT_V2[7]), .B1(n25), .ZN(N94) );
  INR2D0HVT U92 ( .A1(ADD_RESULT_V2[8]), .B1(n25), .ZN(N95) );
  INR2D0HVT U93 ( .A1(ADD_RESULT_V2[9]), .B1(n25), .ZN(N96) );
  INR2D0HVT U94 ( .A1(ADD_RESULT_V2[10]), .B1(n25), .ZN(N97) );
  INR2D0HVT U95 ( .A1(ADD_RESULT_V2[11]), .B1(n25), .ZN(N98) );
  INR2D0HVT U96 ( .A1(ADD_RESULT_V2[12]), .B1(n25), .ZN(N99) );
  INR2D0HVT U97 ( .A1(ADD_RESULT_V2[13]), .B1(n25), .ZN(N100) );
  INR2D0HVT U98 ( .A1(ADD_RESULT_V2[14]), .B1(n25), .ZN(N101) );
  INR2D0HVT U99 ( .A1(ADD_RESULT_V2[15]), .B1(n25), .ZN(N102) );
  INR2D0HVT U100 ( .A1(ADD_RESULT_V2[16]), .B1(n25), .ZN(N103) );
  INR2D0HVT U101 ( .A1(ADD_RESULT_V2[17]), .B1(n25), .ZN(N104) );
  AO22D0HVT U102 ( .A1(n27), .A2(weight_last[2]), .B1(n26), .B2(weight_idx[2]), 
        .Z(n12) );
  AO22D0HVT U103 ( .A1(n27), .A2(weight_last[1]), .B1(n26), .B2(weight_idx[1]), 
        .Z(n11) );
endmodule

