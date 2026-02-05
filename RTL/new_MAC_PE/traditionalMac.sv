module traditionalMac(
    input clk,
    input rst_n,
    input en,
    input reset,
    input data_valid,
    input signed [3:0] weight,
    input signed [7:0] activation,
    output logic signed [20:0] output_result
);


    logic MUL_EN;
    logic signed [7:0] MUL_OP_A;
    logic signed [3:0] MUL_OP_B;
    logic signed [11:0] MUL_RESULT;
    logic ADD_EN;
    logic signed [20:0] ADD_OP_A;
    logic signed [11:0] ADD_OP_B;
    logic signed [20:0] ADD_RESULT;
    assign MUL_EN = data_valid;
    assign MUL_OP_A = activation;
    assign MUL_OP_B = weight;
    assign ADD_EN = data_valid;
    assign ADD_OP_A = output_result;
    assign ADD_OP_B = MUL_RESULT;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            output_result <= '0;
        end else if (en) begin
            if (data_valid) begin
                output_result <= ADD_RESULT;
            end else if (reset) begin
                output_result <= '0;
            end
        end
    end

    MULTIPLIER_tMAC u_MULTIPLIER_tMAC(
        .MUL_EN   ( MUL_EN   ),
        .MUL_OP_A ( MUL_OP_A ),
        .MUL_OP_B ( MUL_OP_B ),
        .MUL_RESULT  ( MUL_RESULT  )
    );

    ADDER_tMAC u_ADDER(
        .ADD_EN   ( ADD_EN   ),
        .ADD_OP_A ( ADD_OP_A ),
        .ADD_OP_B ( ADD_OP_B ),
        .ADD_RESULT  ( ADD_RESULT  )
    );




endmodule

module MULTIPLIER_tMAC(
    input MUL_EN,
    input signed [7:0] MUL_OP_A,
    input signed [3:0] MUL_OP_B,
    output signed [11:0] MUL_RESULT
);

    logic signed [7:0] a_g;
    logic signed [3:0] b_g;
    assign a_g = MUL_EN ? MUL_OP_A : 0;
    assign b_g = MUL_EN ? MUL_OP_B : 0;

    assign MUL_RESULT = a_g * b_g;

endmodule

module ADDER_tMAC(
    input ADD_EN,
    input signed [20:0] ADD_OP_A,
    input signed [11:0] ADD_OP_B,
    output logic signed [20:0] ADD_RESULT
);

    logic signed [20:0] a_g;
    logic signed [11:0] b_g;
    assign a_g = ADD_EN ? ADD_OP_A : 0;
    assign b_g = ADD_EN ? ADD_OP_B : 0;
    assign ADD_RESULT = a_g + b_g;

endmodule