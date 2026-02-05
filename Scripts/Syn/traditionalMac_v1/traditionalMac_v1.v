/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03-SP5
// Date      : Fri Jan 30 12:10:25 2026
/////////////////////////////////////////////////////////////


module MULTIPLIER_tMAC ( MUL_EN, MUL_OP_A, MUL_OP_B, MUL_RESULT );
  input [7:0] MUL_OP_A;
  input [7:0] MUL_OP_B;
  output [15:0] MUL_RESULT;
  input MUL_EN;
  wire   \mult_x_3/n82 , \mult_x_3/n80 , \mult_x_3/n75 , \mult_x_3/n74 ,
         \mult_x_3/n72 , \mult_x_3/n69 , \mult_x_3/n68 , \mult_x_3/n67 ,
         \mult_x_3/n66 , \mult_x_3/n65 , \mult_x_3/n63 , \mult_x_3/n62 ,
         \mult_x_3/n60 , \mult_x_3/n59 , \mult_x_3/n46 , \mult_x_3/n43 ,
         \mult_x_3/n42 , \mult_x_3/n41 , \mult_x_3/n40 , \mult_x_3/n39 ,
         \mult_x_3/n38 , \mult_x_3/n37 , \mult_x_3/n36 , \mult_x_3/n35 ,
         \mult_x_3/n34 , \mult_x_3/n33 , \mult_x_3/n32 , \mult_x_3/n31 ,
         \mult_x_3/n30 , \mult_x_3/n29 , \mult_x_3/n28 , \mult_x_3/n27 ,
         \mult_x_3/n26 , \mult_x_3/n25 , \mult_x_3/n24 , \mult_x_3/n23 ,
         \intadd_0/A[8] , \intadd_0/A[7] , \intadd_0/A[6] , \intadd_0/A[5] ,
         \intadd_0/A[4] , \intadd_0/A[3] , \intadd_0/A[2] , \intadd_0/A[1] ,
         \intadd_0/A[0] , \intadd_0/B[8] , \intadd_0/B[7] , \intadd_0/B[6] ,
         \intadd_0/B[5] , \intadd_0/B[4] , \intadd_0/B[3] , \intadd_0/B[2] ,
         \intadd_0/B[1] , \intadd_0/B[0] , \intadd_0/CI , \intadd_0/SUM[8] ,
         \intadd_0/SUM[7] , \intadd_0/SUM[6] , \intadd_0/SUM[5] ,
         \intadd_0/SUM[4] , \intadd_0/SUM[3] , \intadd_0/SUM[2] ,
         \intadd_0/SUM[1] , \intadd_0/SUM[0] , \intadd_0/n9 , \intadd_0/n8 ,
         \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 , \intadd_0/n4 ,
         \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 , \intadd_1/A[3] ,
         \intadd_1/A[2] , \intadd_1/A[1] , \intadd_1/B[3] , \intadd_1/B[2] ,
         \intadd_1/B[1] , \intadd_1/B[0] , \intadd_1/CI , \intadd_1/SUM[0] ,
         \intadd_1/n4 , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95;

  CMPE42D1HVT \mult_x_3/U28  ( .A(\mult_x_3/n82 ), .B(\mult_x_3/n63 ), .C(
        \mult_x_3/n69 ), .CIX(\mult_x_3/n46 ), .D(\mult_x_3/n75 ), .CO(
        \mult_x_3/n42 ), .COX(\mult_x_3/n41 ), .S(\mult_x_3/n43 ) );
  CMPE42D1HVT \mult_x_3/U26  ( .A(\mult_x_3/n62 ), .B(\mult_x_3/n74 ), .C(
        \mult_x_3/n68 ), .CIX(\mult_x_3/n41 ), .D(\mult_x_3/n40 ), .CO(
        \mult_x_3/n37 ), .COX(\mult_x_3/n36 ), .S(\mult_x_3/n38 ) );
  CMPE42D1HVT \mult_x_3/U23  ( .A(\mult_x_3/n80 ), .B(\mult_x_3/n67 ), .C(
        \mult_x_3/n39 ), .CIX(\mult_x_3/n36 ), .D(\mult_x_3/n35 ), .CO(
        \mult_x_3/n32 ), .COX(\mult_x_3/n31 ), .S(\mult_x_3/n33 ) );
  CMPE42D1HVT \mult_x_3/U21  ( .A(\mult_x_3/n60 ), .B(\mult_x_3/n66 ), .C(
        \mult_x_3/n30 ), .CIX(\mult_x_3/n31 ), .D(\mult_x_3/n34 ), .CO(
        \mult_x_3/n27 ), .COX(\mult_x_3/n26 ), .S(\mult_x_3/n28 ) );
  CMPE42D1HVT \mult_x_3/U20  ( .A(\mult_x_3/n65 ), .B(\mult_x_3/n29 ), .C(
        \mult_x_3/n59 ), .CIX(\mult_x_3/n26 ), .D(\mult_x_3/n72 ), .CO(
        \mult_x_3/n24 ), .COX(\mult_x_3/n23 ), .S(\mult_x_3/n25 ) );
  FA1D0HVT \intadd_0/U10  ( .A(\intadd_0/A[0] ), .B(\intadd_0/B[0] ), .CI(
        \intadd_0/CI ), .CO(\intadd_0/n9 ), .S(\intadd_0/SUM[0] ) );
  FA1D0HVT \intadd_0/U9  ( .A(\intadd_0/A[1] ), .B(\intadd_0/B[1] ), .CI(
        \intadd_0/n9 ), .CO(\intadd_0/n8 ), .S(\intadd_0/SUM[1] ) );
  FA1D0HVT \intadd_0/U8  ( .A(\intadd_0/A[2] ), .B(\intadd_0/B[2] ), .CI(
        \intadd_0/n8 ), .CO(\intadd_0/n7 ), .S(\intadd_0/SUM[2] ) );
  FA1D0HVT \intadd_0/U7  ( .A(\intadd_0/A[3] ), .B(\intadd_0/B[3] ), .CI(
        \intadd_0/n7 ), .CO(\intadd_0/n6 ), .S(\intadd_0/SUM[3] ) );
  FA1D0HVT \intadd_0/U6  ( .A(\intadd_0/A[4] ), .B(\intadd_0/B[4] ), .CI(
        \intadd_0/n6 ), .CO(\intadd_0/n5 ), .S(\intadd_0/SUM[4] ) );
  FA1D0HVT \intadd_0/U5  ( .A(\intadd_0/A[5] ), .B(\intadd_0/B[5] ), .CI(
        \intadd_0/n5 ), .CO(\intadd_0/n4 ), .S(\intadd_0/SUM[5] ) );
  FA1D0HVT \intadd_0/U4  ( .A(\intadd_0/A[6] ), .B(\intadd_0/B[6] ), .CI(
        \intadd_0/n4 ), .CO(\intadd_0/n3 ), .S(\intadd_0/SUM[6] ) );
  FA1D0HVT \intadd_0/U3  ( .A(\intadd_0/A[7] ), .B(\intadd_0/B[7] ), .CI(
        \intadd_0/n3 ), .CO(\intadd_0/n2 ), .S(\intadd_0/SUM[7] ) );
  FA1D0HVT \intadd_0/U2  ( .A(\intadd_0/A[8] ), .B(\intadd_0/B[8] ), .CI(
        \intadd_0/n2 ), .CO(\intadd_0/n1 ), .S(\intadd_0/SUM[8] ) );
  FA1D0HVT \intadd_1/U5  ( .A(\mult_x_3/n23 ), .B(\intadd_1/B[0] ), .CI(
        \intadd_1/CI ), .CO(\intadd_1/n4 ), .S(\intadd_1/SUM[0] ) );
  FA1D0HVT \intadd_1/U4  ( .A(\intadd_1/A[1] ), .B(\intadd_1/B[1] ), .CI(
        \intadd_1/n4 ), .CO(\intadd_1/n3 ), .S(MUL_RESULT[12]) );
  FA1D0HVT \intadd_1/U3  ( .A(\intadd_1/A[2] ), .B(\intadd_1/B[2] ), .CI(
        \intadd_1/n3 ), .CO(\intadd_1/n2 ), .S(MUL_RESULT[13]) );
  FA1D0HVT \intadd_1/U2  ( .A(\intadd_1/A[3] ), .B(\intadd_1/B[3] ), .CI(
        \intadd_1/n2 ), .CO(\intadd_1/n1 ), .S(MUL_RESULT[14]) );
  AOI22D0HVT U2 ( .A1(n61), .A2(n82), .B1(n81), .B2(n59), .ZN(n31) );
  AOI22D0HVT U3 ( .A1(n51), .A2(n82), .B1(n81), .B2(n50), .ZN(n52) );
  AOI22D0HVT U4 ( .A1(n73), .A2(n64), .B1(n66), .B2(n70), .ZN(n12) );
  CKND2D0HVT U5 ( .A1(MUL_EN), .A2(MUL_OP_A[3]), .ZN(n71) );
  CKND2D0HVT U6 ( .A1(MUL_EN), .A2(MUL_OP_B[5]), .ZN(n50) );
  CKND2D0HVT U7 ( .A1(n92), .A2(n91), .ZN(n93) );
  INVD0HVT U8 ( .I(n40), .ZN(n29) );
  AOI31D0HVT U9 ( .A1(n90), .A2(n72), .A3(n65), .B(n15), .ZN(\intadd_0/B[0] )
         );
  INVD0HVT U10 ( .I(\mult_x_3/n24 ), .ZN(\intadd_0/A[8] ) );
  INVD0HVT U11 ( .I(\intadd_0/n1 ), .ZN(\intadd_1/B[1] ) );
  INVD0HVT U12 ( .I(n71), .ZN(n72) );
  INVD0HVT U13 ( .I(MUL_OP_A[4]), .ZN(n53) );
  MUX2ND0HVT U14 ( .I0(n72), .I1(n71), .S(n53), .ZN(n91) );
  INVD0HVT U15 ( .I(n91), .ZN(n69) );
  CKND2D0HVT U16 ( .A1(MUL_EN), .A2(MUL_OP_A[5]), .ZN(n64) );
  INVD0HVT U17 ( .I(n64), .ZN(n66) );
  CKND2D0HVT U18 ( .A1(MUL_EN), .A2(MUL_OP_B[7]), .ZN(n59) );
  INVD0HVT U19 ( .I(n59), .ZN(n61) );
  AOI22D0HVT U20 ( .A1(n66), .A2(n59), .B1(n61), .B2(n64), .ZN(n22) );
  OAI221D0HVT U21 ( .A1(MUL_OP_A[4]), .A2(n66), .B1(n53), .B2(n64), .C(n69), 
        .ZN(n63) );
  CKND2D0HVT U22 ( .A1(MUL_EN), .A2(MUL_OP_B[6]), .ZN(n32) );
  INVD0HVT U23 ( .I(n32), .ZN(n20) );
  AOI22D0HVT U24 ( .A1(n20), .A2(n64), .B1(n66), .B2(n32), .ZN(n4) );
  OA22D0HVT U25 ( .A1(n69), .A2(n22), .B1(n63), .B2(n4), .Z(\intadd_1/B[0] )
         );
  CKND2D0HVT U26 ( .A1(MUL_EN), .A2(MUL_OP_A[1]), .ZN(n40) );
  CKND2D0HVT U27 ( .A1(MUL_OP_A[0]), .A2(n29), .ZN(n81) );
  CKND2D0HVT U28 ( .A1(MUL_OP_A[0]), .A2(n40), .ZN(n82) );
  NR2D0HVT U29 ( .A1(MUL_OP_A[0]), .A2(n40), .ZN(n86) );
  CKND2D0HVT U30 ( .A1(n86), .A2(n50), .ZN(n1) );
  OAI221D0HVT U31 ( .A1(n20), .A2(n81), .B1(n32), .B2(n82), .C(n1), .ZN(
        \mult_x_3/n82 ) );
  CKND2D0HVT U32 ( .A1(n29), .A2(MUL_OP_A[2]), .ZN(n2) );
  OAI21D0HVT U33 ( .A1(n29), .A2(MUL_OP_A[2]), .B(n2), .ZN(n14) );
  INVD0HVT U34 ( .I(n14), .ZN(n90) );
  CKND2D0HVT U35 ( .A1(MUL_EN), .A2(MUL_OP_B[4]), .ZN(n80) );
  INVD0HVT U36 ( .I(n80), .ZN(n83) );
  AOI22D0HVT U37 ( .A1(n72), .A2(n83), .B1(n80), .B2(n71), .ZN(n3) );
  CKND2D0HVT U38 ( .A1(MUL_EN), .A2(MUL_OP_B[3]), .ZN(n85) );
  INVD0HVT U39 ( .I(n85), .ZN(n18) );
  AOI22D0HVT U40 ( .A1(n72), .A2(n18), .B1(n85), .B2(n71), .ZN(n74) );
  OAI32D0HVT U41 ( .A1(n71), .A2(n29), .A3(MUL_OP_A[2]), .B1(n72), .B2(n2), 
        .ZN(n88) );
  AO22D0HVT U42 ( .A1(n90), .A2(n3), .B1(n74), .B2(n88), .Z(\mult_x_3/n75 ) );
  INVD0HVT U43 ( .I(n50), .ZN(n51) );
  AOI22D0HVT U44 ( .A1(n72), .A2(n51), .B1(n50), .B2(n71), .ZN(n9) );
  AO22D0HVT U45 ( .A1(n90), .A2(n9), .B1(n3), .B2(n88), .Z(\mult_x_3/n74 ) );
  AOI22D0HVT U46 ( .A1(n72), .A2(n61), .B1(n59), .B2(n71), .ZN(n30) );
  AOI22D0HVT U47 ( .A1(n72), .A2(n20), .B1(n32), .B2(n71), .ZN(n10) );
  AOI22D0HVT U48 ( .A1(n90), .A2(n30), .B1(n10), .B2(n88), .ZN(\mult_x_3/n30 )
         );
  INVD0HVT U49 ( .I(\mult_x_3/n30 ), .ZN(\mult_x_3/n29 ) );
  INVD0HVT U50 ( .I(MUL_OP_A[6]), .ZN(n34) );
  MUX2ND0HVT U51 ( .I0(n66), .I1(n64), .S(n34), .ZN(n58) );
  INVD0HVT U52 ( .I(n58), .ZN(n33) );
  CKND2D0HVT U53 ( .A1(MUL_EN), .A2(MUL_OP_A[7]), .ZN(n60) );
  INVD0HVT U54 ( .I(n60), .ZN(n62) );
  AOI22D0HVT U55 ( .A1(n62), .A2(n80), .B1(n83), .B2(n60), .ZN(n19) );
  OAI221D0HVT U56 ( .A1(n60), .A2(n34), .B1(n62), .B2(MUL_OP_A[6]), .C(n33), 
        .ZN(n54) );
  AOI22D0HVT U57 ( .A1(n62), .A2(n85), .B1(n18), .B2(n60), .ZN(n6) );
  OAI22D0HVT U58 ( .A1(n33), .A2(n19), .B1(n54), .B2(n6), .ZN(\mult_x_3/n59 )
         );
  AOI22D0HVT U59 ( .A1(n51), .A2(n64), .B1(n66), .B2(n50), .ZN(n5) );
  OAI22D0HVT U60 ( .A1(n69), .A2(n4), .B1(n63), .B2(n5), .ZN(\mult_x_3/n65 )
         );
  AOI22D0HVT U61 ( .A1(n66), .A2(n80), .B1(n83), .B2(n64), .ZN(n7) );
  OAI22D0HVT U62 ( .A1(n69), .A2(n5), .B1(n63), .B2(n7), .ZN(\mult_x_3/n66 )
         );
  INVD0HVT U63 ( .I(n54), .ZN(n57) );
  CKND2D0HVT U64 ( .A1(MUL_EN), .A2(MUL_OP_B[2]), .ZN(n70) );
  INVD0HVT U65 ( .I(n70), .ZN(n73) );
  AOI22D0HVT U66 ( .A1(n73), .A2(n62), .B1(n60), .B2(n70), .ZN(n11) );
  MOAI22D0HVT U67 ( .A1(n33), .A2(n6), .B1(n57), .B2(n11), .ZN(\mult_x_3/n60 )
         );
  AOI22D0HVT U68 ( .A1(n66), .A2(n85), .B1(n18), .B2(n64), .ZN(n8) );
  OAI22D0HVT U69 ( .A1(n69), .A2(n7), .B1(n63), .B2(n8), .ZN(\mult_x_3/n67 )
         );
  OAI22D0HVT U70 ( .A1(n69), .A2(n8), .B1(n63), .B2(n12), .ZN(\mult_x_3/n68 )
         );
  AOI22D0HVT U71 ( .A1(n90), .A2(n10), .B1(n9), .B2(n88), .ZN(n38) );
  CKND2D0HVT U72 ( .A1(MUL_EN), .A2(MUL_OP_B[1]), .ZN(n42) );
  INVD0HVT U73 ( .I(n42), .ZN(n41) );
  AOI22D0HVT U74 ( .A1(n41), .A2(n62), .B1(n60), .B2(n42), .ZN(n56) );
  AOI22D0HVT U75 ( .A1(n58), .A2(n11), .B1(n57), .B2(n56), .ZN(n37) );
  CKND2D0HVT U76 ( .A1(n38), .A2(n37), .ZN(\mult_x_3/n34 ) );
  OAI22D0HVT U77 ( .A1(n42), .A2(n64), .B1(n66), .B2(n41), .ZN(n68) );
  OAI22D0HVT U78 ( .A1(n69), .A2(n12), .B1(n63), .B2(n68), .ZN(\mult_x_3/n69 )
         );
  INVD0HVT U79 ( .I(\intadd_0/SUM[0] ), .ZN(MUL_RESULT[3]) );
  INVD0HVT U80 ( .I(\intadd_0/SUM[1] ), .ZN(MUL_RESULT[4]) );
  INVD0HVT U81 ( .I(\intadd_0/SUM[2] ), .ZN(MUL_RESULT[5]) );
  INVD0HVT U82 ( .I(\intadd_0/SUM[3] ), .ZN(MUL_RESULT[6]) );
  INVD0HVT U83 ( .I(\intadd_0/SUM[4] ), .ZN(MUL_RESULT[7]) );
  INVD0HVT U84 ( .I(\intadd_0/SUM[5] ), .ZN(MUL_RESULT[8]) );
  INVD0HVT U85 ( .I(\intadd_0/SUM[6] ), .ZN(MUL_RESULT[9]) );
  INVD0HVT U86 ( .I(\intadd_0/SUM[7] ), .ZN(MUL_RESULT[10]) );
  INVD0HVT U87 ( .I(\intadd_0/SUM[8] ), .ZN(MUL_RESULT[11]) );
  INVD0HVT U88 ( .I(\intadd_1/n1 ), .ZN(MUL_RESULT[15]) );
  CKND2D0HVT U89 ( .A1(n86), .A2(n42), .ZN(n13) );
  OAI221D0HVT U90 ( .A1(n73), .A2(n81), .B1(n70), .B2(n82), .C(n13), .ZN(n46)
         );
  CKND2D0HVT U91 ( .A1(MUL_EN), .A2(MUL_OP_B[0]), .ZN(n65) );
  INVD0HVT U92 ( .I(MUL_OP_A[0]), .ZN(n39) );
  OAI211D0HVT U93 ( .A1(n39), .A2(n42), .B(n29), .C(n65), .ZN(n43) );
  OAI21D0HVT U94 ( .A1(n65), .A2(n14), .B(n43), .ZN(n47) );
  CKND2D0HVT U95 ( .A1(n46), .A2(n47), .ZN(\intadd_0/CI ) );
  NR3D0HVT U96 ( .A1(n29), .A2(MUL_OP_A[2]), .A3(n71), .ZN(n15) );
  OAI22D0HVT U97 ( .A1(n42), .A2(n72), .B1(n71), .B2(n41), .ZN(n87) );
  INVD0HVT U98 ( .I(n65), .ZN(n92) );
  OAI221D0HVT U99 ( .A1(n72), .A2(n92), .B1(n71), .B2(n65), .C(n88), .ZN(n16)
         );
  IOA21D0HVT U100 ( .A1(n90), .A2(n87), .B(n16), .ZN(n48) );
  CKND2D0HVT U101 ( .A1(n86), .A2(n70), .ZN(n17) );
  OAI221D0HVT U102 ( .A1(n18), .A2(n81), .B1(n85), .B2(n82), .C(n17), .ZN(n49)
         );
  CKND2D0HVT U103 ( .A1(n48), .A2(n49), .ZN(\intadd_0/A[1] ) );
  INVD0HVT U104 ( .I(\mult_x_3/n43 ), .ZN(\intadd_0/A[3] ) );
  INVD0HVT U105 ( .I(\mult_x_3/n42 ), .ZN(\intadd_0/B[4] ) );
  INVD0HVT U106 ( .I(\mult_x_3/n38 ), .ZN(\intadd_0/A[4] ) );
  INVD0HVT U107 ( .I(\mult_x_3/n33 ), .ZN(\intadd_0/B[5] ) );
  INVD0HVT U108 ( .I(\mult_x_3/n37 ), .ZN(\intadd_0/A[5] ) );
  INVD0HVT U109 ( .I(\mult_x_3/n32 ), .ZN(\intadd_0/B[6] ) );
  INVD0HVT U110 ( .I(\mult_x_3/n28 ), .ZN(\intadd_0/A[6] ) );
  INVD0HVT U111 ( .I(\mult_x_3/n27 ), .ZN(\intadd_0/B[7] ) );
  INVD0HVT U112 ( .I(\mult_x_3/n25 ), .ZN(\intadd_0/A[7] ) );
  INVD0HVT U113 ( .I(\intadd_1/SUM[0] ), .ZN(\intadd_0/B[8] ) );
  AOI22D0HVT U114 ( .A1(n51), .A2(n60), .B1(n62), .B2(n50), .ZN(n21) );
  OAI22D0HVT U115 ( .A1(n33), .A2(n21), .B1(n54), .B2(n19), .ZN(\intadd_1/CI )
         );
  AOI22D0HVT U116 ( .A1(n20), .A2(n60), .B1(n62), .B2(n32), .ZN(n27) );
  OA22D0HVT U117 ( .A1(n33), .A2(n27), .B1(n54), .B2(n21), .Z(n25) );
  AOI21D0HVT U118 ( .A1(n69), .A2(n63), .B(n22), .ZN(n24) );
  INVD0HVT U119 ( .I(n23), .ZN(\intadd_1/A[1] ) );
  FA1D0HVT U120 ( .A(n25), .B(\intadd_1/B[0] ), .CI(n24), .CO(n26), .S(n23) );
  INVD0HVT U121 ( .I(n26), .ZN(\intadd_1/B[2] ) );
  AOI22D0HVT U122 ( .A1(n62), .A2(n59), .B1(n61), .B2(n60), .ZN(n28) );
  OAI22D0HVT U123 ( .A1(n33), .A2(n28), .B1(n54), .B2(n27), .ZN(
        \intadd_1/B[3] ) );
  INVD0HVT U124 ( .I(\intadd_1/B[3] ), .ZN(\intadd_1/A[2] ) );
  AOI32D0HVT U125 ( .A1(n61), .A2(n40), .A3(MUL_OP_A[0]), .B1(n59), .B2(n29), 
        .ZN(\mult_x_3/n80 ) );
  OAI21D0HVT U126 ( .A1(n90), .A2(n88), .B(n30), .ZN(\mult_x_3/n72 ) );
  NR2D0HVT U127 ( .A1(n65), .A2(n33), .ZN(\mult_x_3/n63 ) );
  AOI21D0HVT U128 ( .A1(n86), .A2(n32), .B(n31), .ZN(n36) );
  OAI221D0HVT U129 ( .A1(n58), .A2(n34), .B1(n33), .B2(n65), .C(n62), .ZN(n35)
         );
  NR2D0HVT U130 ( .A1(n36), .A2(n35), .ZN(\mult_x_3/n39 ) );
  AOI21D0HVT U131 ( .A1(n36), .A2(n35), .B(\mult_x_3/n39 ), .ZN(\mult_x_3/n40 ) );
  OAI21D0HVT U132 ( .A1(n38), .A2(n37), .B(\mult_x_3/n34 ), .ZN(\mult_x_3/n35 ) );
  NR2D0HVT U133 ( .A1(n39), .A2(n65), .ZN(MUL_RESULT[0]) );
  NR2D0HVT U134 ( .A1(MUL_RESULT[0]), .A2(n40), .ZN(n45) );
  OAI22D0HVT U135 ( .A1(n42), .A2(n82), .B1(n41), .B2(n81), .ZN(n44) );
  OA21D0HVT U136 ( .A1(n45), .A2(n44), .B(n43), .Z(MUL_RESULT[1]) );
  OA21D0HVT U137 ( .A1(n47), .A2(n46), .B(\intadd_0/CI ), .Z(MUL_RESULT[2]) );
  OAI21D0HVT U138 ( .A1(n49), .A2(n48), .B(\intadd_0/A[1] ), .ZN(
        \intadd_0/A[0] ) );
  AOI21D0HVT U139 ( .A1(n86), .A2(n80), .B(n52), .ZN(n76) );
  OAI221D0HVT U140 ( .A1(n91), .A2(n53), .B1(n69), .B2(n65), .C(n66), .ZN(n75)
         );
  NR2D0HVT U141 ( .A1(n76), .A2(n75), .ZN(\mult_x_3/n46 ) );
  AOI221D0HVT U142 ( .A1(n92), .A2(n62), .B1(n65), .B2(n60), .C(n54), .ZN(n55)
         );
  AO21D0HVT U143 ( .A1(n56), .A2(n58), .B(n55), .Z(\mult_x_3/n62 ) );
  OAI222D0HVT U144 ( .A1(n62), .A2(n61), .B1(n60), .B2(n59), .C1(n58), .C2(n57), .ZN(\intadd_1/A[3] ) );
  AOI221D0HVT U145 ( .A1(n92), .A2(n66), .B1(n65), .B2(n64), .C(n63), .ZN(n67)
         );
  IAO21D0HVT U146 ( .A1(n69), .A2(n68), .B(n67), .ZN(n79) );
  AOI22D0HVT U147 ( .A1(n73), .A2(n72), .B1(n71), .B2(n70), .ZN(n89) );
  AOI22D0HVT U148 ( .A1(n90), .A2(n74), .B1(n89), .B2(n88), .ZN(n78) );
  AO21D0HVT U149 ( .A1(n76), .A2(n75), .B(\mult_x_3/n46 ), .Z(n77) );
  FA1D0HVT U150 ( .A(n79), .B(n78), .CI(n77), .CO(\intadd_0/B[3] ), .S(
        \intadd_0/A[2] ) );
  AOI22D0HVT U151 ( .A1(n83), .A2(n82), .B1(n81), .B2(n80), .ZN(n84) );
  AOI21D0HVT U152 ( .A1(n86), .A2(n85), .B(n84), .ZN(n95) );
  AOI22D0HVT U153 ( .A1(n90), .A2(n89), .B1(n88), .B2(n87), .ZN(n94) );
  FA1D0HVT U154 ( .A(n95), .B(n94), .CI(n93), .CO(\intadd_0/B[2] ), .S(
        \intadd_0/B[1] ) );
endmodule


module ADDER_tMAC ( ADD_EN, ADD_OP_A, ADD_OP_B, ADD_RESULT );
  input [21:0] ADD_OP_A;
  input [15:0] ADD_OP_B;
  output [21:0] ADD_RESULT;
  input ADD_EN;
  wire   \intadd_2/A[14] , \intadd_2/A[13] , \intadd_2/A[12] ,
         \intadd_2/A[11] , \intadd_2/A[10] , \intadd_2/A[9] , \intadd_2/A[8] ,
         \intadd_2/A[7] , \intadd_2/A[6] , \intadd_2/A[5] , \intadd_2/A[4] ,
         \intadd_2/A[3] , \intadd_2/A[2] , \intadd_2/A[1] , \intadd_2/A[0] ,
         \intadd_2/B[19] , \intadd_2/B[18] , \intadd_2/B[17] ,
         \intadd_2/B[16] , \intadd_2/B[15] , \intadd_2/B[14] ,
         \intadd_2/B[13] , \intadd_2/B[12] , \intadd_2/B[11] ,
         \intadd_2/B[10] , \intadd_2/B[9] , \intadd_2/B[8] , \intadd_2/B[7] ,
         \intadd_2/B[6] , \intadd_2/B[5] , \intadd_2/B[4] , \intadd_2/B[3] ,
         \intadd_2/B[2] , \intadd_2/B[1] , \intadd_2/B[0] , \intadd_2/CI ,
         \intadd_2/n20 , \intadd_2/n19 , \intadd_2/n18 , \intadd_2/n17 ,
         \intadd_2/n16 , \intadd_2/n15 , \intadd_2/n14 , \intadd_2/n13 ,
         \intadd_2/n12 , \intadd_2/n11 , \intadd_2/n10 , \intadd_2/n9 ,
         \intadd_2/n8 , \intadd_2/n7 , \intadd_2/n6 , \intadd_2/n5 ,
         \intadd_2/n4 , \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 , n1, n2,
         n3, n4;

  FA1D0HVT \intadd_2/U21  ( .A(\intadd_2/A[0] ), .B(\intadd_2/B[0] ), .CI(
        \intadd_2/CI ), .CO(\intadd_2/n20 ), .S(ADD_RESULT[1]) );
  FA1D0HVT \intadd_2/U20  ( .A(\intadd_2/A[1] ), .B(\intadd_2/B[1] ), .CI(
        \intadd_2/n20 ), .CO(\intadd_2/n19 ), .S(ADD_RESULT[2]) );
  FA1D0HVT \intadd_2/U19  ( .A(\intadd_2/A[2] ), .B(\intadd_2/B[2] ), .CI(
        \intadd_2/n19 ), .CO(\intadd_2/n18 ), .S(ADD_RESULT[3]) );
  FA1D0HVT \intadd_2/U18  ( .A(\intadd_2/A[3] ), .B(\intadd_2/B[3] ), .CI(
        \intadd_2/n18 ), .CO(\intadd_2/n17 ), .S(ADD_RESULT[4]) );
  FA1D0HVT \intadd_2/U17  ( .A(\intadd_2/A[4] ), .B(\intadd_2/B[4] ), .CI(
        \intadd_2/n17 ), .CO(\intadd_2/n16 ), .S(ADD_RESULT[5]) );
  FA1D0HVT \intadd_2/U16  ( .A(\intadd_2/A[5] ), .B(\intadd_2/B[5] ), .CI(
        \intadd_2/n16 ), .CO(\intadd_2/n15 ), .S(ADD_RESULT[6]) );
  FA1D0HVT \intadd_2/U15  ( .A(\intadd_2/A[6] ), .B(\intadd_2/B[6] ), .CI(
        \intadd_2/n15 ), .CO(\intadd_2/n14 ), .S(ADD_RESULT[7]) );
  FA1D0HVT \intadd_2/U14  ( .A(\intadd_2/A[7] ), .B(\intadd_2/B[7] ), .CI(
        \intadd_2/n14 ), .CO(\intadd_2/n13 ), .S(ADD_RESULT[8]) );
  FA1D0HVT \intadd_2/U13  ( .A(\intadd_2/A[8] ), .B(\intadd_2/B[8] ), .CI(
        \intadd_2/n13 ), .CO(\intadd_2/n12 ), .S(ADD_RESULT[9]) );
  FA1D0HVT \intadd_2/U12  ( .A(\intadd_2/A[9] ), .B(\intadd_2/B[9] ), .CI(
        \intadd_2/n12 ), .CO(\intadd_2/n11 ), .S(ADD_RESULT[10]) );
  FA1D0HVT \intadd_2/U11  ( .A(\intadd_2/A[10] ), .B(\intadd_2/B[10] ), .CI(
        \intadd_2/n11 ), .CO(\intadd_2/n10 ), .S(ADD_RESULT[11]) );
  FA1D0HVT \intadd_2/U10  ( .A(\intadd_2/A[11] ), .B(\intadd_2/B[11] ), .CI(
        \intadd_2/n10 ), .CO(\intadd_2/n9 ), .S(ADD_RESULT[12]) );
  FA1D0HVT \intadd_2/U9  ( .A(\intadd_2/A[12] ), .B(\intadd_2/B[12] ), .CI(
        \intadd_2/n9 ), .CO(\intadd_2/n8 ), .S(ADD_RESULT[13]) );
  FA1D0HVT \intadd_2/U8  ( .A(\intadd_2/A[13] ), .B(\intadd_2/B[13] ), .CI(
        \intadd_2/n8 ), .CO(\intadd_2/n7 ), .S(ADD_RESULT[14]) );
  FA1D0HVT \intadd_2/U7  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[14] ), .CI(
        \intadd_2/n7 ), .CO(\intadd_2/n6 ), .S(ADD_RESULT[15]) );
  FA1D0HVT \intadd_2/U6  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[15] ), .CI(
        \intadd_2/n6 ), .CO(\intadd_2/n5 ), .S(ADD_RESULT[16]) );
  FA1D0HVT \intadd_2/U5  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[16] ), .CI(
        \intadd_2/n5 ), .CO(\intadd_2/n4 ), .S(ADD_RESULT[17]) );
  FA1D0HVT \intadd_2/U4  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[17] ), .CI(
        \intadd_2/n4 ), .CO(\intadd_2/n3 ), .S(ADD_RESULT[18]) );
  FA1D0HVT \intadd_2/U3  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[18] ), .CI(
        \intadd_2/n3 ), .CO(\intadd_2/n2 ), .S(ADD_RESULT[19]) );
  FA1D0HVT \intadd_2/U2  ( .A(\intadd_2/A[14] ), .B(\intadd_2/B[19] ), .CI(
        \intadd_2/n2 ), .CO(\intadd_2/n1 ), .S(ADD_RESULT[20]) );
  CKAN2D0HVT U2 ( .A1(ADD_OP_B[1]), .A2(ADD_EN), .Z(\intadd_2/CI ) );
  CKAN2D0HVT U3 ( .A1(ADD_OP_B[4]), .A2(ADD_EN), .Z(\intadd_2/B[3] ) );
  CKAN2D0HVT U4 ( .A1(ADD_OP_A[11]), .A2(ADD_EN), .Z(\intadd_2/A[10] ) );
  AN3D0HVT U5 ( .A1(ADD_EN), .A2(ADD_OP_B[0]), .A3(ADD_OP_A[0]), .Z(
        \intadd_2/B[0] ) );
  CKAN2D0HVT U6 ( .A1(ADD_OP_A[1]), .A2(ADD_EN), .Z(\intadd_2/A[0] ) );
  CKAN2D0HVT U7 ( .A1(ADD_OP_B[2]), .A2(ADD_EN), .Z(\intadd_2/B[1] ) );
  CKAN2D0HVT U8 ( .A1(ADD_OP_A[2]), .A2(ADD_EN), .Z(\intadd_2/A[1] ) );
  CKAN2D0HVT U9 ( .A1(ADD_OP_B[3]), .A2(ADD_EN), .Z(\intadd_2/B[2] ) );
  CKAN2D0HVT U10 ( .A1(ADD_OP_A[3]), .A2(ADD_EN), .Z(\intadd_2/A[2] ) );
  CKAN2D0HVT U11 ( .A1(ADD_OP_A[4]), .A2(ADD_EN), .Z(\intadd_2/A[3] ) );
  CKAN2D0HVT U12 ( .A1(ADD_OP_B[5]), .A2(ADD_EN), .Z(\intadd_2/B[4] ) );
  CKAN2D0HVT U13 ( .A1(ADD_OP_A[5]), .A2(ADD_EN), .Z(\intadd_2/A[4] ) );
  CKAN2D0HVT U14 ( .A1(ADD_OP_B[6]), .A2(ADD_EN), .Z(\intadd_2/B[5] ) );
  CKAN2D0HVT U15 ( .A1(ADD_OP_A[6]), .A2(ADD_EN), .Z(\intadd_2/A[5] ) );
  CKAN2D0HVT U16 ( .A1(ADD_OP_B[7]), .A2(ADD_EN), .Z(\intadd_2/B[6] ) );
  CKAN2D0HVT U17 ( .A1(ADD_OP_A[7]), .A2(ADD_EN), .Z(\intadd_2/A[6] ) );
  CKAN2D0HVT U18 ( .A1(ADD_OP_B[8]), .A2(ADD_EN), .Z(\intadd_2/B[7] ) );
  CKAN2D0HVT U19 ( .A1(ADD_OP_A[8]), .A2(ADD_EN), .Z(\intadd_2/A[7] ) );
  CKAN2D0HVT U20 ( .A1(ADD_OP_B[9]), .A2(ADD_EN), .Z(\intadd_2/B[8] ) );
  CKAN2D0HVT U21 ( .A1(ADD_OP_A[9]), .A2(ADD_EN), .Z(\intadd_2/A[8] ) );
  CKAN2D0HVT U22 ( .A1(ADD_OP_B[10]), .A2(ADD_EN), .Z(\intadd_2/B[9] ) );
  CKAN2D0HVT U23 ( .A1(ADD_OP_A[10]), .A2(ADD_EN), .Z(\intadd_2/A[9] ) );
  CKAN2D0HVT U24 ( .A1(ADD_OP_B[11]), .A2(ADD_EN), .Z(\intadd_2/B[10] ) );
  CKAN2D0HVT U25 ( .A1(ADD_OP_B[12]), .A2(ADD_EN), .Z(\intadd_2/B[11] ) );
  CKAN2D0HVT U26 ( .A1(ADD_OP_A[12]), .A2(ADD_EN), .Z(\intadd_2/A[11] ) );
  CKAN2D0HVT U27 ( .A1(ADD_OP_B[13]), .A2(ADD_EN), .Z(\intadd_2/B[12] ) );
  CKAN2D0HVT U28 ( .A1(ADD_OP_A[13]), .A2(ADD_EN), .Z(\intadd_2/A[12] ) );
  CKAN2D0HVT U29 ( .A1(ADD_OP_B[14]), .A2(ADD_EN), .Z(\intadd_2/B[13] ) );
  CKAN2D0HVT U30 ( .A1(ADD_OP_A[14]), .A2(ADD_EN), .Z(\intadd_2/A[13] ) );
  CKAN2D0HVT U31 ( .A1(ADD_OP_A[15]), .A2(ADD_EN), .Z(\intadd_2/B[14] ) );
  CKAN2D0HVT U32 ( .A1(ADD_OP_A[16]), .A2(ADD_EN), .Z(\intadd_2/B[15] ) );
  CKAN2D0HVT U33 ( .A1(ADD_OP_A[17]), .A2(ADD_EN), .Z(\intadd_2/B[16] ) );
  CKAN2D0HVT U34 ( .A1(ADD_OP_A[18]), .A2(ADD_EN), .Z(\intadd_2/B[17] ) );
  CKAN2D0HVT U35 ( .A1(ADD_OP_A[19]), .A2(ADD_EN), .Z(\intadd_2/B[18] ) );
  CKAN2D0HVT U36 ( .A1(ADD_OP_A[20]), .A2(ADD_EN), .Z(\intadd_2/B[19] ) );
  CKAN2D0HVT U37 ( .A1(ADD_OP_B[15]), .A2(ADD_EN), .Z(\intadd_2/A[14] ) );
  INVD0HVT U38 ( .I(ADD_EN), .ZN(n2) );
  NR2D0HVT U39 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .ZN(n1) );
  AOI211D0HVT U40 ( .A1(ADD_OP_B[0]), .A2(ADD_OP_A[0]), .B(n2), .C(n1), .ZN(
        ADD_RESULT[0]) );
  CKND2D0HVT U41 ( .A1(ADD_OP_B[15]), .A2(ADD_OP_A[21]), .ZN(n3) );
  OAI211D0HVT U42 ( .A1(ADD_OP_B[15]), .A2(ADD_OP_A[21]), .B(ADD_EN), .C(n3), 
        .ZN(n4) );
  XNR2D0HVT U43 ( .A1(\intadd_2/n1 ), .A2(n4), .ZN(ADD_RESULT[21]) );
endmodule


module SNPS_CLOCK_GATE_HIGH_traditionalMac_v1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  CKLNQD1HVT latch ( .CP(CLK), .E(EN), .TE(TE), .Q(ENCLK) );
endmodule


module traditionalMac_v1 ( clk, rst_n, en, reset, data_valid, weight, 
        activation, output_result );
  input [7:0] weight;
  input [7:0] activation;
  output [21:0] output_result;
  input clk, rst_n, en, reset, data_valid;
  wire   \*Logic0* , N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, net53;
  wire   [15:0] ADD_OP_B;
  wire   [21:0] ADD_RESULT;

  MULTIPLIER_tMAC u_MULTIPLIER_tMAC ( .MUL_EN(data_valid), .MUL_OP_A(
        activation), .MUL_OP_B(weight), .MUL_RESULT(ADD_OP_B) );
  ADDER_tMAC u_ADDER ( .ADD_EN(data_valid), .ADD_OP_A(output_result), 
        .ADD_OP_B(ADD_OP_B), .ADD_RESULT(ADD_RESULT) );
  SNPS_CLOCK_GATE_HIGH_traditionalMac_v1 clk_gate_output_result_reg ( .CLK(clk), .EN(N31), .ENCLK(net53), .TE(\*Logic0* ) );
  DFCNQD1HVT \output_result_reg[17]  ( .D(N26), .CP(net53), .CDN(rst_n), .Q(
        output_result[17]) );
  DFCNQD1HVT \output_result_reg[18]  ( .D(N27), .CP(net53), .CDN(rst_n), .Q(
        output_result[18]) );
  DFCNQD1HVT \output_result_reg[19]  ( .D(N28), .CP(net53), .CDN(rst_n), .Q(
        output_result[19]) );
  DFCNQD1HVT \output_result_reg[20]  ( .D(N29), .CP(net53), .CDN(rst_n), .Q(
        output_result[20]) );
  DFCNQD1HVT \output_result_reg[21]  ( .D(N30), .CP(net53), .CDN(rst_n), .Q(
        output_result[21]) );
  DFCNQD1HVT \output_result_reg[16]  ( .D(N25), .CP(net53), .CDN(rst_n), .Q(
        output_result[16]) );
  DFCNQD1HVT \output_result_reg[15]  ( .D(N24), .CP(net53), .CDN(rst_n), .Q(
        output_result[15]) );
  DFCNQD1HVT \output_result_reg[14]  ( .D(N23), .CP(net53), .CDN(rst_n), .Q(
        output_result[14]) );
  DFCNQD1HVT \output_result_reg[13]  ( .D(N22), .CP(net53), .CDN(rst_n), .Q(
        output_result[13]) );
  DFCNQD1HVT \output_result_reg[12]  ( .D(N21), .CP(net53), .CDN(rst_n), .Q(
        output_result[12]) );
  DFCNQD1HVT \output_result_reg[11]  ( .D(N20), .CP(net53), .CDN(rst_n), .Q(
        output_result[11]) );
  DFCNQD1HVT \output_result_reg[10]  ( .D(N19), .CP(net53), .CDN(rst_n), .Q(
        output_result[10]) );
  DFCNQD1HVT \output_result_reg[9]  ( .D(N18), .CP(net53), .CDN(rst_n), .Q(
        output_result[9]) );
  DFCNQD1HVT \output_result_reg[8]  ( .D(N17), .CP(net53), .CDN(rst_n), .Q(
        output_result[8]) );
  DFCNQD1HVT \output_result_reg[7]  ( .D(N16), .CP(net53), .CDN(rst_n), .Q(
        output_result[7]) );
  DFCNQD1HVT \output_result_reg[6]  ( .D(N15), .CP(net53), .CDN(rst_n), .Q(
        output_result[6]) );
  DFCNQD1HVT \output_result_reg[5]  ( .D(N14), .CP(net53), .CDN(rst_n), .Q(
        output_result[5]) );
  DFCNQD1HVT \output_result_reg[4]  ( .D(N13), .CP(net53), .CDN(rst_n), .Q(
        output_result[4]) );
  DFCNQD1HVT \output_result_reg[3]  ( .D(N12), .CP(net53), .CDN(rst_n), .Q(
        output_result[3]) );
  DFCNQD1HVT \output_result_reg[2]  ( .D(N11), .CP(net53), .CDN(rst_n), .Q(
        output_result[2]) );
  DFCNQD1HVT \output_result_reg[0]  ( .D(N9), .CP(net53), .CDN(rst_n), .Q(
        output_result[0]) );
  DFCNQD1HVT \output_result_reg[1]  ( .D(N10), .CP(net53), .CDN(rst_n), .Q(
        output_result[1]) );
  CKAN2D0HVT U27 ( .A1(data_valid), .A2(ADD_RESULT[8]), .Z(N17) );
  TIELHVT U28 ( .ZN(\*Logic0* ) );
  CKAN2D0HVT U29 ( .A1(data_valid), .A2(ADD_RESULT[0]), .Z(N9) );
  CKAN2D0HVT U30 ( .A1(data_valid), .A2(ADD_RESULT[1]), .Z(N10) );
  CKAN2D0HVT U31 ( .A1(data_valid), .A2(ADD_RESULT[2]), .Z(N11) );
  CKAN2D0HVT U32 ( .A1(data_valid), .A2(ADD_RESULT[3]), .Z(N12) );
  CKAN2D0HVT U33 ( .A1(data_valid), .A2(ADD_RESULT[4]), .Z(N13) );
  CKAN2D0HVT U34 ( .A1(data_valid), .A2(ADD_RESULT[5]), .Z(N14) );
  CKAN2D0HVT U35 ( .A1(data_valid), .A2(ADD_RESULT[6]), .Z(N15) );
  CKAN2D0HVT U36 ( .A1(data_valid), .A2(ADD_RESULT[7]), .Z(N16) );
  CKAN2D0HVT U37 ( .A1(data_valid), .A2(ADD_RESULT[9]), .Z(N18) );
  CKAN2D0HVT U38 ( .A1(data_valid), .A2(ADD_RESULT[10]), .Z(N19) );
  CKAN2D0HVT U39 ( .A1(data_valid), .A2(ADD_RESULT[11]), .Z(N20) );
  CKAN2D0HVT U40 ( .A1(data_valid), .A2(ADD_RESULT[12]), .Z(N21) );
  CKAN2D0HVT U41 ( .A1(data_valid), .A2(ADD_RESULT[13]), .Z(N22) );
  CKAN2D0HVT U42 ( .A1(data_valid), .A2(ADD_RESULT[14]), .Z(N23) );
  CKAN2D0HVT U43 ( .A1(data_valid), .A2(ADD_RESULT[15]), .Z(N24) );
  CKAN2D0HVT U44 ( .A1(data_valid), .A2(ADD_RESULT[16]), .Z(N25) );
  CKAN2D0HVT U45 ( .A1(data_valid), .A2(ADD_RESULT[17]), .Z(N26) );
  CKAN2D0HVT U46 ( .A1(data_valid), .A2(ADD_RESULT[18]), .Z(N27) );
  CKAN2D0HVT U47 ( .A1(data_valid), .A2(ADD_RESULT[19]), .Z(N28) );
  CKAN2D0HVT U48 ( .A1(data_valid), .A2(ADD_RESULT[20]), .Z(N29) );
  CKAN2D0HVT U49 ( .A1(data_valid), .A2(ADD_RESULT[21]), .Z(N30) );
  OA21D0HVT U50 ( .A1(data_valid), .A2(reset), .B(en), .Z(N31) );
endmodule

