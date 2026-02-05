/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Sat Jan 17 00:24:14 2026
/////////////////////////////////////////////////////////////


module MULTIPLIER_tMAC ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [7:0] MUL_OP_A;
  input [3:0] MUL_OP_B;
  output [11:0] MUL_RESULT;
  input MUL_EN;
  wire   \intadd_0/A[7] , \intadd_0/A[6] , \intadd_0/A[5] , \intadd_0/A[4] ,
         \intadd_0/A[3] , \intadd_0/A[2] , \intadd_0/A[1] , \intadd_0/A[0] ,
         \intadd_0/B[7] , \intadd_0/B[6] , \intadd_0/B[5] , \intadd_0/B[4] ,
         \intadd_0/B[3] , \intadd_0/B[2] , \intadd_0/B[1] , \intadd_0/B[0] ,
         \intadd_0/CI , \intadd_0/SUM[7] , \intadd_0/SUM[6] ,
         \intadd_0/SUM[5] , \intadd_0/SUM[4] , \intadd_0/SUM[3] ,
         \intadd_0/SUM[2] , \intadd_0/SUM[1] , \intadd_0/SUM[0] ,
         \intadd_0/n8 , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;
  assign MUL_RESULT[11] = \intadd_0/n1 ;

  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[0] ) );
  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[1] ) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[2] ) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[3] ) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[4] ) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[5] ) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[6] ) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[7] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[7] ) );
  CKAN2D0HVT U2 ( .A1(n28), .A2(n49), .Z(n1) );
  INVD0HVT U3 ( .I(n26), .ZN(n25) );
  INVD0HVT U4 ( .I(\intadd_0/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U5 ( .I(\intadd_0/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U6 ( .I(\intadd_0/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U7 ( .I(\intadd_0/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U8 ( .I(\intadd_0/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U9 ( .I(\intadd_0/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U10 ( .I(\intadd_0/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U11 ( .I(\intadd_0/SUM[7] ), .ZN(MUL_RESULT[10]) );
  ND3D0HVT U12 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .A3(MUL_OP_B[1]), .ZN(n29) );
  INVD0HVT U13 ( .I(MUL_OP_A[2]), .ZN(n11) );
  CKND2D0HVT U14 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n28) );
  CKND2D0HVT U15 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n34) );
  INVD0HVT U16 ( .I(n34), .ZN(n49) );
  NR2D0HVT U17 ( .A1(n28), .A2(n49), .ZN(n50) );
  INVD0HVT U18 ( .I(n50), .ZN(n23) );
  INVD0HVT U19 ( .I(MUL_OP_A[1]), .ZN(n31) );
  CKND2D0HVT U20 ( .A1(n1), .A2(n31), .ZN(n2) );
  OAI221D0HVT U21 ( .A1(MUL_OP_A[2]), .A2(n29), .B1(n11), .B2(n23), .C(n2), 
        .ZN(n36) );
  CKND2D0HVT U22 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n7) );
  NR2D0HVT U23 ( .A1(n49), .A2(n7), .ZN(n4) );
  INVD0HVT U24 ( .I(n7), .ZN(n8) );
  NR2D0HVT U25 ( .A1(n8), .A2(n34), .ZN(n3) );
  NR2D0HVT U26 ( .A1(n4), .A2(n3), .ZN(n57) );
  INVD0HVT U27 ( .I(MUL_OP_A[0]), .ZN(n27) );
  OAI211D0HVT U28 ( .A1(n28), .A2(n31), .B(n49), .C(n27), .ZN(n32) );
  OAI21D0HVT U29 ( .A1(n57), .A2(n27), .B(n32), .ZN(n37) );
  CKND2D0HVT U30 ( .A1(n36), .A2(n37), .ZN(\intadd_0/CI ) );
  CKND2D0HVT U31 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n26) );
  INVD0HVT U32 ( .I(n57), .ZN(n6) );
  NR3D0HVT U33 ( .A1(n49), .A2(n8), .A3(n26), .ZN(n5) );
  AOI31D0HVT U34 ( .A1(n25), .A2(n27), .A3(n6), .B(n5), .ZN(\intadd_0/B[0] )
         );
  AOI33D0HVT U35 ( .A1(n49), .A2(n8), .A3(n26), .B1(n25), .B2(n7), .B3(n34), 
        .ZN(n56) );
  AOI22D0HVT U36 ( .A1(MUL_OP_A[0]), .A2(n26), .B1(n25), .B2(n27), .ZN(n9) );
  AOI22D0HVT U37 ( .A1(MUL_OP_A[1]), .A2(n26), .B1(n25), .B2(n31), .ZN(n12) );
  OAI22D0HVT U38 ( .A1(n56), .A2(n9), .B1(n57), .B2(n12), .ZN(n38) );
  INVD0HVT U39 ( .I(MUL_OP_A[3]), .ZN(n14) );
  CKND2D0HVT U40 ( .A1(n1), .A2(n11), .ZN(n10) );
  OAI221D0HVT U41 ( .A1(MUL_OP_A[3]), .A2(n29), .B1(n14), .B2(n23), .C(n10), 
        .ZN(n39) );
  CKND2D0HVT U42 ( .A1(n38), .A2(n39), .ZN(\intadd_0/B[1] ) );
  AOI22D0HVT U43 ( .A1(MUL_OP_A[2]), .A2(n26), .B1(n25), .B2(n11), .ZN(n15) );
  OAI22D0HVT U44 ( .A1(n56), .A2(n12), .B1(n57), .B2(n15), .ZN(n40) );
  INVD0HVT U45 ( .I(MUL_OP_A[4]), .ZN(n17) );
  CKND2D0HVT U46 ( .A1(n1), .A2(n14), .ZN(n13) );
  OAI221D0HVT U47 ( .A1(MUL_OP_A[4]), .A2(n29), .B1(n17), .B2(n23), .C(n13), 
        .ZN(n41) );
  CKND2D0HVT U48 ( .A1(n40), .A2(n41), .ZN(\intadd_0/B[2] ) );
  AOI22D0HVT U49 ( .A1(n25), .A2(n14), .B1(MUL_OP_A[3]), .B2(n26), .ZN(n18) );
  OAI22D0HVT U50 ( .A1(n56), .A2(n15), .B1(n57), .B2(n18), .ZN(n42) );
  INVD0HVT U51 ( .I(MUL_OP_A[5]), .ZN(n20) );
  CKND2D0HVT U52 ( .A1(n1), .A2(n17), .ZN(n16) );
  OAI221D0HVT U53 ( .A1(MUL_OP_A[5]), .A2(n29), .B1(n20), .B2(n23), .C(n16), 
        .ZN(n43) );
  CKND2D0HVT U54 ( .A1(n42), .A2(n43), .ZN(\intadd_0/B[3] ) );
  AOI22D0HVT U55 ( .A1(n25), .A2(n17), .B1(MUL_OP_A[4]), .B2(n26), .ZN(n21) );
  OAI22D0HVT U56 ( .A1(n56), .A2(n18), .B1(n57), .B2(n21), .ZN(n44) );
  INVD0HVT U57 ( .I(MUL_OP_A[6]), .ZN(n24) );
  CKND2D0HVT U58 ( .A1(n1), .A2(n20), .ZN(n19) );
  OAI221D0HVT U59 ( .A1(MUL_OP_A[6]), .A2(n29), .B1(n24), .B2(n23), .C(n19), 
        .ZN(n45) );
  CKND2D0HVT U60 ( .A1(n44), .A2(n45), .ZN(\intadd_0/B[4] ) );
  AOI22D0HVT U61 ( .A1(n25), .A2(n20), .B1(MUL_OP_A[5]), .B2(n26), .ZN(n52) );
  OAI22D0HVT U62 ( .A1(n56), .A2(n21), .B1(n57), .B2(n52), .ZN(n46) );
  INVD0HVT U63 ( .I(MUL_OP_A[7]), .ZN(n48) );
  CKND2D0HVT U64 ( .A1(n1), .A2(n24), .ZN(n22) );
  OAI221D0HVT U65 ( .A1(MUL_OP_A[7]), .A2(n29), .B1(n48), .B2(n23), .C(n22), 
        .ZN(n47) );
  CKND2D0HVT U66 ( .A1(n46), .A2(n47), .ZN(\intadd_0/B[5] ) );
  AOI22D0HVT U67 ( .A1(n25), .A2(n24), .B1(MUL_OP_A[6]), .B2(n26), .ZN(n51) );
  AOI22D0HVT U68 ( .A1(MUL_OP_A[7]), .A2(n26), .B1(n25), .B2(n48), .ZN(n55) );
  OAI22D0HVT U69 ( .A1(n56), .A2(n51), .B1(n57), .B2(n55), .ZN(\intadd_0/A[6] ) );
  INVD0HVT U70 ( .I(\intadd_0/A[6] ), .ZN(\intadd_0/B[7] ) );
  NR2D0HVT U71 ( .A1(n28), .A2(n27), .ZN(MUL_RESULT[0]) );
  INVD0HVT U72 ( .I(n29), .ZN(n30) );
  AOI22D0HVT U73 ( .A1(n31), .A2(n30), .B1(MUL_OP_A[1]), .B2(n50), .ZN(n35) );
  INVD0HVT U74 ( .I(n32), .ZN(n33) );
  AOI221D0HVT U75 ( .A1(MUL_RESULT[0]), .A2(n35), .B1(n34), .B2(n35), .C(n33), 
        .ZN(MUL_RESULT[1]) );
  OA21D0HVT U76 ( .A1(n37), .A2(n36), .B(\intadd_0/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U77 ( .A1(n39), .A2(n38), .B(\intadd_0/B[1] ), .ZN(
        \intadd_0/A[0] ) );
  OAI21D0HVT U78 ( .A1(n41), .A2(n40), .B(\intadd_0/B[2] ), .ZN(
        \intadd_0/A[1] ) );
  OAI21D0HVT U79 ( .A1(n43), .A2(n42), .B(\intadd_0/B[3] ), .ZN(
        \intadd_0/A[2] ) );
  OAI21D0HVT U80 ( .A1(n45), .A2(n44), .B(\intadd_0/B[4] ), .ZN(
        \intadd_0/A[3] ) );
  OAI21D0HVT U81 ( .A1(n47), .A2(n46), .B(\intadd_0/B[5] ), .ZN(
        \intadd_0/A[4] ) );
  AOI22D0HVT U82 ( .A1(MUL_OP_A[7]), .A2(n50), .B1(n49), .B2(n48), .ZN(n54) );
  OAI22D0HVT U83 ( .A1(n56), .A2(n52), .B1(n57), .B2(n51), .ZN(n53) );
  NR2D0HVT U84 ( .A1(n54), .A2(n53), .ZN(\intadd_0/B[6] ) );
  AOI21D0HVT U85 ( .A1(n54), .A2(n53), .B(\intadd_0/B[6] ), .ZN(
        \intadd_0/A[5] ) );
  AOI21D0HVT U86 ( .A1(n57), .A2(n56), .B(n55), .ZN(\intadd_0/A[7] ) );
endmodule


module ADDER_tMAC ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [20:0] ADD_OP_A;
  input [11:0] ADD_OP_B;
  output [20:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_1/A[10] , \intadd_1/A[9] , \intadd_1/A[8] , \intadd_1/A[7] ,
         \intadd_1/A[6] , \intadd_1/A[5] , \intadd_1/A[4] , \intadd_1/A[3] ,
         \intadd_1/A[2] , \intadd_1/A[1] , \intadd_1/A[0] , \intadd_1/B[18] ,
         \intadd_1/B[17] , \intadd_1/B[16] , \intadd_1/B[15] ,
         \intadd_1/B[14] , \intadd_1/B[13] , \intadd_1/B[12] ,
         \intadd_1/B[11] , \intadd_1/B[10] , \intadd_1/B[9] , \intadd_1/B[8] ,
         \intadd_1/B[7] , \intadd_1/B[6] , \intadd_1/B[5] , \intadd_1/B[4] ,
         \intadd_1/B[3] , \intadd_1/B[2] , \intadd_1/B[1] , \intadd_1/B[0] ,
         \intadd_1/CI , \intadd_1/n19 , \intadd_1/n18 , \intadd_1/n17 ,
         \intadd_1/n16 , \intadd_1/n15 , \intadd_1/n14 , \intadd_1/n13 ,
         \intadd_1/n12 , \intadd_1/n11 , \intadd_1/n10 , \intadd_1/n9 ,
         \intadd_1/n8 , \intadd_1/n7 , \intadd_1/n6 , \intadd_1/n5 ,
         \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n1, n2,
         n3, n4;

  FA1D0HVT \intadd_1/U20  ( .A(\intadd_1/A[0] ), .B(\intadd_1/B[0] ), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n19 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_1/U19  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n19 ), .CO(\intadd_1/n18 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_1/U18  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n18 ), .CO(\intadd_1/n17 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_1/U17  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n17 ), .CO(\intadd_1/n16 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_1/U16  ( .A(\intadd_1/A[4] ), .B(\intadd_1/B[4] ), .CI(
        \intadd_1/n16 ), .CO(\intadd_1/n15 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_1/U15  ( .A(\intadd_1/A[5] ), .B(\intadd_1/B[5] ), .CI(
        \intadd_1/n15 ), .CO(\intadd_1/n14 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_1/U14  ( .A(\intadd_1/A[6] ), .B(\intadd_1/B[6] ), .CI(
        \intadd_1/n14 ), .CO(\intadd_1/n13 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_1/U13  ( .A(\intadd_1/A[7] ), .B(\intadd_1/B[7] ), .CI(
        \intadd_1/n13 ), .CO(\intadd_1/n12 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_1/U12  ( .A(\intadd_1/A[8] ), .B(\intadd_1/B[8] ), .CI(
        \intadd_1/n12 ), .CO(\intadd_1/n11 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_1/U11  ( .A(\intadd_1/A[9] ), .B(\intadd_1/B[9] ), .CI(
        \intadd_1/n11 ), .CO(\intadd_1/n10 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_1/U10  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[10] ), .CI(
        \intadd_1/n10 ), .CO(\intadd_1/n9 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_1/U9  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[11] ), .CI(
        \intadd_1/n9 ), .CO(\intadd_1/n8 ), .S(ADD_RESULT[12]) );
  FA1D0HVT \intadd_1/U8  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[12] ), .CI(
        \intadd_1/n8 ), .CO(\intadd_1/n7 ), .S(ADD_RESULT[13]) );
  FA1D0HVT \intadd_1/U7  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[13] ), .CI(
        \intadd_1/n7 ), .CO(\intadd_1/n6 ), .S(ADD_RESULT[14]) );
  FA1D0HVT \intadd_1/U6  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[14] ), .CI(
        \intadd_1/n6 ), .CO(\intadd_1/n5 ), .S(ADD_RESULT[15]) );
  FA1D0HVT \intadd_1/U5  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[15] ), .CI(
        \intadd_1/n5 ), .CO(\intadd_1/n4 ), .S(ADD_RESULT[16]) );
  FA1D0HVT \intadd_1/U4  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[16] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(ADD_RESULT[17]) );
  FA1D0HVT \intadd_1/U3  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[17] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(ADD_RESULT[18]) );
  FA1D0HVT \intadd_1/U2  ( .A(\intadd_1/A[10] ), .B(\intadd_1/B[18] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(ADD_RESULT[19]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_1/CI ) );
  AN3D0HVT U3 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_1/B[0] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_1/A[0] ) );
  CKAN2D0HVT U5 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_1/B[1] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_1/A[1] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_1/B[2] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_1/A[2] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_1/B[3] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_1/A[3] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_1/B[4] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_1/A[4] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_1/B[5] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_1/A[5] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_1/B[6] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_1/A[6] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_1/B[7] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_1/A[7] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_B[9]), .A2(ADD_EN), .Z(\intadd_1/B[8] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_1/A[8] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_B[10]), .A2(ADD_EN), .Z(\intadd_1/B[9] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_1/A[9] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_1/B[10] ) );
  CKAN2D0HVT U24 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_1/B[11] ) );
  CKAN2D0HVT U25 ( .A1(ADD_OP_A[13]), .A2(ADD_EN), .Z(\intadd_1/B[12] ) );
  CKAN2D0HVT U26 ( .A1(ADD_OP_A[14]), .A2(ADD_EN), .Z(\intadd_1/B[13] ) );
  CKAN2D0HVT U27 ( .A1(ADD_OP_A[15]), .A2(ADD_EN), .Z(\intadd_1/B[14] ) );
  CKAN2D0HVT U28 ( .A1(ADD_OP_A[16]), .A2(ADD_EN), .Z(\intadd_1/B[15] ) );
  CKAN2D0HVT U29 ( .A1(ADD_OP_A[17]), .A2(ADD_EN), .Z(\intadd_1/B[16] ) );
  CKAN2D0HVT U30 ( .A1(ADD_OP_A[18]), .A2(ADD_EN), .Z(\intadd_1/B[17] ) );
  CKAN2D0HVT U31 ( .A1(ADD_OP_A[19]), .A2(ADD_EN), .Z(\intadd_1/B[18] ) );
  CKAN2D0HVT U32 ( .A1(ADD_OP_B[11]), .A2(ADD_EN), .Z(\intadd_1/A[10] ) );
  INVD0HVT U33 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U34 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U35 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U36 ( .A1(ADD_OP_B[11]), .A2(ADD_OP_A[20]), .ZN(n3) );
  OAI211D0HVT U37 ( .A1(ADD_OP_B[11]), .A2(ADD_OP_A[20]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U38 ( .A1(\intadd_1/n1 ), .A2(n4), .ZN(ADD_RESULT[20]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_traditionalMac ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module traditionalMac ( clk, rst_n, en, reset, data_valid, weight, activation, 
        output_result );
  input [3:0] weight;
  input [7:0] activation;
  output [20:0] output_result;
  input clk, rst_n, en, reset, data_valid;
  wire   \*Logic0* , N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, net34;
  wire   [11:0] ADD_OP_B;
  wire   [20:0] ADD_RESULT;

  MULTIPLIER_tMAC u_MULTIPLIER_tMAC ( .MUL_EN(data_valid), .MUL_OP_A(
        activation), .MUL_OP_B(weight), .MUL_RESULT(ADD_OP_B) );
  ADDER_tMAC u_ADDER ( .ADD_EN(data_valid), .ADD_OP_A(output_result), 
        .ADD_OP_B(ADD_OP_B), .ADD_RESULT(ADD_RESULT) );
  SNPS_CLOCK_GATE_HIGH_traditionalMac clk_gate_output_result_reg ( .CLK(clk), 
        .EN(N30), .ENCLK(net34), .TE(\*Logic0* ) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N25), .CP(net34), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[17]  ( .D(N26), .CP(net34), .CDN(rst_n), .Q(
        output_result[17]) );
  DFCNQD1HVT \output_result_reg[18]  ( .D(N27), .CP(net34), .CDN(rst_n), .Q(
        output_result[18]) );
  DFCNQD1HVT \output_result_reg[19]  ( .D(N28), .CP(net34), .CDN(rst_n), .Q(
        output_result[19]) );
  DFCNQD1HVT \output_result_reg[20]  ( .D(N29), .CP(net34), .CDN(rst_n), .Q(
        output_result[20]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N24), .CP(net34), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N23), .CP(net34), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N22), .CP(net34), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N21), .CP(net34), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N20), .CP(net34), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N19), .CP(net34), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N18), .CP(net34), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N17), .CP(net34), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N16), .CP(net34), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N15), .CP(net34), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N14), .CP(net34), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N13), .CP(net34), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N12), .CP(net34), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N11), .CP(net34), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N9), .CP(net34), .CDN(rst_n), .Q(
        output_result[0]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N10), .CP(net34), .CDN(rst_n), .Q(
        output_result[1]) );
  TIELHVT U26 ( .ZN(\*Logic0* ) );
  CKAN2D0HVT U27 ( .A1(data_valid), .A2(ADD_RESULT[0]), .Z(N9) );
  CKAN2D0HVT U28 ( .A1(data_valid), .A2(ADD_RESULT[1]), .Z(N10) );
  CKAN2D0HVT U29 ( .A1(data_valid), .A2(ADD_RESULT[2]), .Z(N11) );
  CKAN2D0HVT U30 ( .A1(data_valid), .A2(ADD_RESULT[3]), .Z(N12) );
  CKAN2D0HVT U31 ( .A1(data_valid), .A2(ADD_RESULT[4]), .Z(N13) );
  CKAN2D0HVT U32 ( .A1(data_valid), .A2(ADD_RESULT[5]), .Z(N14) );
  CKAN2D0HVT U33 ( .A1(data_valid), .A2(ADD_RESULT[6]), .Z(N15) );
  CKAN2D0HVT U34 ( .A1(data_valid), .A2(ADD_RESULT[7]), .Z(N16) );
  CKAN2D0HVT U35 ( .A1(data_valid), .A2(ADD_RESULT[8]), .Z(N17) );
  CKAN2D0HVT U36 ( .A1(data_valid), .A2(ADD_RESULT[9]), .Z(N18) );
  CKAN2D0HVT U37 ( .A1(data_valid), .A2(ADD_RESULT[10]), .Z(N19) );
  CKAN2D0HVT U38 ( .A1(data_valid), .A2(ADD_RESULT[11]), .Z(N20) );
  CKAN2D0HVT U39 ( .A1(data_valid), .A2(ADD_RESULT[12]), .Z(N21) );
  CKAN2D0HVT U40 ( .A1(data_valid), .A2(ADD_RESULT[13]), .Z(N22) );
  CKAN2D0HVT U41 ( .A1(data_valid), .A2(ADD_RESULT[14]), .Z(N23) );
  CKAN2D0HVT U42 ( .A1(data_valid), .A2(ADD_RESULT[15]), .Z(N24) );
  CKAN2D0HVT U43 ( .A1(data_valid), .A2(ADD_RESULT[16]), .Z(N25) );
  CKAN2D0HVT U44 ( .A1(data_valid), .A2(ADD_RESULT[17]), .Z(N26) );
  CKAN2D0HVT U45 ( .A1(data_valid), .A2(ADD_RESULT[18]), .Z(N27) );
  CKAN2D0HVT U46 ( .A1(data_valid), .A2(ADD_RESULT[19]), .Z(N28) );
  CKAN2D0HVT U47 ( .A1(data_valid), .A2(ADD_RESULT[20]), .Z(N29) );
  OA21D0HVT U48 ( .A1(data_valid), .A2(reset), .B(en), .Z(N30) );
endmodule

