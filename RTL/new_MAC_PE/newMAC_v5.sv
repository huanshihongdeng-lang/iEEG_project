module newMAC_v5(
    input clk,
    input rst_n,
    input en,
    input data_valid,
    input signed [7:0] weight,
    input signed [7:0] activation,
    input reset,
    input acc,
    output reg output_valid,
    output logic signed [21:0] output_result
);

    //inputGen
    logic data_valid_out;
    logic weight_check;
    logic compute_check;
    logic signed [7:0] weight_idx;
    logic signed [13:0] activation_out;

    //ADDER
    logic ADD_EN;
    logic signed [13:0] ADD_OP_A;
    logic signed [13:0] ADD_OP_B;
    logic signed [13:0] ADD_RESULT;
    //ADDER_v1
    logic ADD_EN_V2;
    logic signed [21:0] ADD_OP_A_V2;
    logic signed [21:0] ADD_OP_B_V2;
    logic signed [21:0] ADD_RESULT_V2;
    //MULTIPLIER
    logic MUL_EN;
    logic signed [13:0] MUL_OP_A;
    logic signed [7:0] MUL_OP_B;
    logic signed [21:0] MUL_RESULT;
    //output register


    inputGen u_inputGen(
        .en              ( en              ),
        .data_valid      ( data_valid      ),
        .weight          ( weight          ),
        .activation      ( activation      ),
        .data_valid_out  ( data_valid_out  ),
        .weight_check    ( weight_check    ),
        .compute_check   ( compute_check   ),
        .weight_idx      ( weight_idx      ),
        .activation_out  ( activation_out  )
    );


    //check the data difference
    logic ACC, MUL;
    logic signed [13:0] sumTemp;
    logic signed [7:0] weight_last;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            weight_last <= '0;
        end else if (en) begin
            if (reset) begin
                weight_last <= '0;
            end else begin
                weight_last <= (weight_check)?weight_idx:weight_last;
            end
        end else begin
            weight_last <= weight_last;
        end
    end

    action_arbiter u_action_arbiter(
        .data_valid_out ( data_valid_out ),
        .acc            ( acc            ),
        .compute_check  ( compute_check  ),
        .weight         ( weight_idx     ),
        .weight_last    ( weight_last    ),
        .ACC            ( ACC            ),
        .MUL            ( MUL            )
    );


    assign ADD_EN = ACC & (~MUL)         ;
    assign ADD_OP_A = sumTemp            ;
    assign ADD_OP_B = activation_out     ;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            sumTemp <= 0;
        end else if (en) begin
                sumTemp <= 0;
            if (reset) begin
            end else begin
                case({ACC, MUL})
                2'b10: sumTemp <= ADD_RESULT;
                2'b11: sumTemp <= activation_out;
                2'b01: sumTemp <= 0;
                2'b00: sumTemp <= sumTemp;
                endcase
            end
        end
    end

    //MUL
    assign MUL_EN = MUL;
    assign MUL_OP_A = sumTemp;
    assign MUL_OP_B = weight_last;

    //output register
    assign ADD_EN_V2 = MUL;
    assign ADD_OP_A_V2 = output_result;
    assign ADD_OP_B_V2 = MUL_RESULT;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            output_valid <= 0;
            output_result <= 0;
        end else if (en) begin
            if (reset) begin
                output_valid <= 0;
                output_result <= 0;
            end else if (MUL) begin
                output_valid <= (acc)?1'b1:1'b0;
                output_result <= (MUL)?ADD_RESULT_V2:output_result; 
            end
        end
    end

    ADDER u_ADDER(
        .ADD_EN      ( ADD_EN      ),
        .ADD_OP_A    ( ADD_OP_A    ),
        .ADD_OP_B    ( ADD_OP_B    ),
        .ADD_RESULT  ( ADD_RESULT  )
    );

    MULTIPLIER_V1 u_MULTIPLIER_V1(
        .MUL_EN   ( MUL_EN   ),
        .MUL_OP_A ( MUL_OP_A ),
        .MUL_OP_B ( MUL_OP_B ),
        .MUL_RESULT  ( MUL_RESULT  )
    );

    ADDER_v3 u_ADDER_v3(
        .ADD_EN   ( ADD_EN_V2   ),
        .ADD_OP_A ( ADD_OP_A_V2 ),
        .ADD_OP_B ( ADD_OP_B_V2 ),
        .ADD_RESULT  ( ADD_RESULT_V2  )
    );


endmodule

module inputGen(
    input en,   
    input data_valid,
    input signed [7:0] weight,
    input signed [7:0] activation,
    output data_valid_out,
    output weight_check,
    output compute_check,
    output logic signed [7:0] weight_idx,
    output logic signed [13:0] activation_out
);

    logic signed [7:0] weight_valid;
    assign data_valid_out = en & data_valid & (|weight) & (|activation);
    assign weight_valid = (data_valid)?weight:0;
    always @(*) begin
        if ((~weight_valid[7]) | (weight_valid == -8'd128)) begin
            weight_idx = weight_valid;
        end else begin
            weight_idx = -weight_valid;
        end
    end

    assign weight_check = data_valid & (|weight);
    assign compute_check = weight_check & (|activation);
    always @(*) begin
        if ((~weight_valid[7]) | (weight_valid == -8'd128)) begin
            activation_out = {{6{activation[7]}}, activation};
        end else begin
            activation_out = ~{{6{activation[7]}}, activation} + 1;
        end
    end

endmodule

module action_arbiter(
    input data_valid_out,
    input acc,
    input compute_check,
    input signed [7:0] weight, 
    input signed [7:0] weight_last,
    output reg ACC,
    output reg MUL
);
    logic COMPUTE_VALID ;
    logic DATA_VALID    ;

    assign ACC = compute_check;
    assign MUL = acc | ((weight_last != weight) & (|weight));

endmodule

module ADDER(
    input ADD_EN,
    input signed [13:0] ADD_OP_A,
    input signed [13:0] ADD_OP_B,
    output logic signed [13:0] ADD_RESULT
);

    logic signed [13:0] a_g;
    logic signed [13:0] b_g;
    assign a_g = ADD_EN ? ADD_OP_A :0;
    assign b_g = ADD_EN ? ADD_OP_B :0;
    // assign ADD_RESULT = (ADD_EN)?ADD_OP_A + ADD_OP_B:'0;
    assign ADD_RESULT = a_g + b_g;


endmodule

module ADDER_v3(
    input ADD_EN,
    input signed [21:0] ADD_OP_A,
    input signed [21:0] ADD_OP_B,
    output logic signed [21:0] ADD_RESULT
);

    logic signed [21:0] a_g;
    logic signed [21:0] b_g;
    assign a_g = ADD_EN ? ADD_OP_A :0;
    assign b_g = ADD_EN ? ADD_OP_B :0;
    // assign ADD_RESULT = (ADD_EN)?ADD_OP_A + ADD_OP_B:'0;
    assign ADD_RESULT = a_g + b_g;


endmodule

module MULTIPLIER_V1(
    input MUL_EN,
    input signed [13:0] MUL_OP_A,
    input signed [7:0] MUL_OP_B,
    output signed [21:0] MUL_RESULT
);

    logic signed [13:0] a_g;
    logic signed [7:0]  b_g;
    assign a_g = MUL_EN ? MUL_OP_A :0;
    assign b_g = MUL_EN ? MUL_OP_B :0;
    assign MUL_RESULT = a_g * b_g;

endmodule