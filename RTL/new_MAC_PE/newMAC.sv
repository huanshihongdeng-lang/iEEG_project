module newMAC(
    input clk,
    input rst_n,
    input en,
    input data_valid,
    input signed [3:0] weight,
    input signed [7:0] activation,
    input reset,
    input acc,
    output reg output_valid,
    output logic signed [20:0] output_result
);

    logic [2:0] index;
    logic       zero_flag;
    logic signed [13:0] partialAcc [7:0];

    indexGen u_indexGen(
        .data_valid ( data_valid  ),
        .weight     ( weight      ),
        .activation ( activation  ),
        .index      ( index       ),
        .zero       ( zero_flag   )
    );

    //Adder
    logic update_Flag;
    assign update_Flag = data_valid & ~zero_flag;
    logic [2:0] MUL_CNT;
    logic signed [3:0] MUL_CNT_PLUS_1;
    logic inACC;
    logic signed [13:0] adder_A, adder_B, adder_result;
    assign inACC = (~(|MUL_CNT) & acc) | (|MUL_CNT);
    assign MUL_CNT_PLUS_1 = (inACC)?((&MUL_CNT)?4'b1000:MUL_CNT + 4'd1)
                                   :'0;
    //Adder's input
    always @(*) begin
        if (update_Flag) begin
            adder_A = partialAcc[index];
            case(weight)
            4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, -4'd8: begin
                adder_B = {{6{activation[7]}}, activation};
            end
            default: begin
                adder_B = {{6{~activation[7]}}, -activation};
            end
            endcase
        end else begin
            adder_A = '0;
            adder_B = '0;
        end
    end
    assign adder_result = adder_A + adder_B;            

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (integer i = 0; i < 8; i++) begin
                partialAcc[i] <= '0;
            end 
        end else if(en) begin
            if (update_Flag) begin
                partialAcc[index] <= adder_result;
            end else if (reset) begin
                for (integer i = 0; i < 8; i++) begin
                    partialAcc[i] <= '0;
                end 
            end
        end
    end

    //OUTPUT STATE
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            MUL_CNT <= '0;
        end else if (en) begin
            if (~(|MUL_CNT)) begin
                MUL_CNT <= (acc)?MUL_CNT + 3'd1:MUL_CNT;
            end else begin
                MUL_CNT <= MUL_CNT + 3'd1;
            end
        end
    end

    logic signed [17:0] mul_result;
    assign mul_result = partialAcc[MUL_CNT] * MUL_CNT_PLUS_1;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            output_result <= '0;
            output_valid  <= '0;
        end else if (en) begin
            if (inACC) begin
                output_valid  <= (&MUL_CNT)?1'b1:1'b0;
                output_result <= {{3{mul_result[17]}}, mul_result} + output_result;
            end else if (reset) begin
                output_result <= '0;
                output_valid  <= '0;
            end
        end
    end



endmodule

module indexGen(
    input data_valid,
    input [3:0] weight,
    input [7:0] activation,
    output reg [2:0] index,
    output zero
);

    logic [3:0] weight_minus_1;

    assign zero = (~(|weight) | ~(|activation)) & data_valid;
    assign weight_minus_1 = (~zero) & weight - 1;

    always @(*) begin
        //if it is zero, then index is zero
        //if it is negative value, then index is inverse, else is the minus one：
        //-8 ~ -1 ->  7 ~ 0
        // 1 ~ 7 -> 0 ~ 6
        if (zero) begin
            index = 3'd0;
        end else begin
            index = (weight[3])?~weight[2:0]:weight_minus_1[2:0];
        end            
    end

endmodule