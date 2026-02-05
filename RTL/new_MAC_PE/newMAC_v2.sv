module newMAC_v2(
    input clk,
    input rst_n,
    input en,
    input data_valid,
    input signed [3:0] weight,
    input signed [7:0] activation,
    input reset,
    input acc,
    output reg output_valid,
    output logic signed [16:0] output_result
);

    //INDEX_GEN
    logic [2:0] index;
    logic       zero_flag;
    //INTERNAL_STORAGE
    logic wen_IS;
    logic [2:0] addr_A_IS;
    logic [9:0] data_A_IS;
    logic ren_IS;
    logic [2:0] addr_B_IS;
    logic [9:0] data_B_IS;
    //ADDER
    logic ADD_EN;
    logic signed [9:0] ADD_OP_A;
    logic signed [9:0] ADD_OP_B;
    logic signed [9:0] ADD_RESULT;
    //MULTIPLIER
    logic MUL_EN;
    logic signed [9:0] MUL_OP_A;
    logic signed [3:0] MUL_OP_B;
    logic signed [13:0] MUL_RESULT;




    //check the data difference
    indexGen u_indexGen(
        .data_valid ( data_valid  ),
        .weight     ( weight      ),
        .activation ( activation  ),
        .index      ( index       ),
        .zero       ( zero_flag   )
    );

    //get data from IS and send data to adder and IS
    logic update_Flag;
    logic ren_READ_DATA;
    logic [2:0] addr_B_READ_DATA;
    logic  [9:0] data_B_READ_DATA;
    assign update_Flag = data_valid & ~zero_flag;
    assign ren_READ_DATA = update_Flag;
    assign addr_B_READ_DATA = index;
    //send data to adder
    assign ADD_EN = update_Flag;
    assign ADD_OP_A = data_B_IS;
    always @(*) begin
        if (update_Flag) begin
            case (weight)
            4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, -4'd8: begin
                ADD_OP_B = {{2{activation[7]}}, activation};
            end
            default: begin
                ADD_OP_B = {{2{~activation[7]}}, -activation};
            end
            endcase
        end else begin
            ADD_OP_B = '0;
        end
    end
    //write data to IS
    logic wen_READ_DATA;
    logic [2:0] addr_A_READ_DATA;
    logic [9:0] data_A_READ_DATA;
    assign wen_READ_DATA = update_Flag;
    assign addr_A_READ_DATA = index;
    assign data_A_READ_DATA = ADD_RESULT;

    //OUTPUT MUL_CNT
    //OUTPUT STATE
    logic [2:0] MUL_CNT;
    logic signed [3:0] MUL_CNT_PLUS_1;
    logic inACC;
    assign inACC = (~(|MUL_CNT) & acc) | (|MUL_CNT);
    assign MUL_CNT_PLUS_1 = (inACC)?((&MUL_CNT)?4'b1000:MUL_CNT + 4'd1)
                                   :'0;
    //state machine
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

    //READ_DATA
    logic ren_READ_DATA_ACC;
    logic [2:0] addr_B_READ_DATA_ACC;
    assign ren_READ_DATA_ACC = inACC;
    assign addr_B_READ_DATA_ACC = MUL_CNT;
    assign MUL_EN = inACC;
    assign MUL_OP_A = data_B_IS;
    assign MUL_OP_B = MUL_CNT_PLUS_1;

    //OUTPUT 
    logic signed [16:0] MUL_ADD_OPA;
    logic signed [16:0] MUL_ADD_OPB;
    assign MUL_ADD_OPA = (inACC)?{{3{MUL_RESULT[13]}}, MUL_RESULT}:'0;
    assign MUL_ADD_OPB = (inACC)?output_result:'0;
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            output_result <= '0;
            output_valid  <= '0;
        end else if (en) begin
            if (inACC) begin
                output_valid  <= (&MUL_CNT)?1'b1:1'b0;
                output_result <= MUL_ADD_OPA + MUL_ADD_OPB;
            end else if (reset) begin
                output_result <= '0;
                output_valid  <= '0;
            end
        end
    end


    assign ren_IS = (inACC)?ren_READ_DATA_ACC:ren_READ_DATA;
    assign addr_B_IS = (inACC)?addr_B_READ_DATA_ACC:addr_B_READ_DATA;
    assign wen_IS = wen_READ_DATA;
    assign addr_A_IS = addr_A_READ_DATA;
    assign data_A_IS = data_A_READ_DATA;

    internalStorage u_internalStorage(
        .clk     ( clk       ),
        .rst_n   ( rst_n     ),
        .en      ( en        ),
        .reset   ( reset     ),
        .wen     ( wen_IS    ),
        .addr_A  ( addr_A_IS ),
        .data_A  ( data_A_IS ),
        .ren     ( ren_IS    ),
        .addr_B  ( addr_B_IS ),
        .data_B  ( data_B_IS )
    );

    //ADDER
    ADDER u_ADDER(
        .ADD_EN     ( ADD_EN      ),
        .ADD_OP_A   ( ADD_OP_A    ),
        .ADD_OP_B   ( ADD_OP_B    ),
        .ADD_RESULT ( ADD_RESULT  )
    );


    MULTIPLIER u_MULTIPLIER(
        .MUL_EN      ( MUL_EN      ),
        .MUL_OP_A    ( MUL_OP_A    ),
        .MUL_OP_B    ( MUL_OP_B    ),
        .MUL_RESULT  ( MUL_RESULT  )
    );

endmodule

module internalStorage(
    input clk,
    input rst_n,
    input en,
    input reset,
    input wen,
    input [2:0] addr_A,
    input [9:0] data_A,
    input ren,
    input [2:0] addr_B,
    output [9:0] data_B
);

    logic signed [9:0] partialAcc [7:0];
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (integer i = 0; i < 8; i++) begin
                partialAcc[i] <= '0;
            end 
        end else if(en) begin
            if (wen) begin
                partialAcc[addr_A] <= data_A;
            end else if (reset) begin
                for (integer i = 0; i < 8; i++) begin
                    partialAcc[i] <= '0;
                end 
            end
        end
    end
    assign data_B = (ren)?partialAcc[addr_B]:'0;

endmodule

module ADDER(
    input ADD_EN,
    input signed [9:0] ADD_OP_A,
    input signed [9:0] ADD_OP_B,
    output logic signed [9:0] ADD_RESULT
);

    logic signed [9:0] a_g;
    logic signed [9:0] b_g;
    assign a_g = ADD_EN ? ADD_OP_A : '0;
    assign b_g = ADD_EN ? ADD_OP_B : '0;
    assign ADD_RESULT = (ADD_EN)?ADD_OP_A + ADD_OP_B:'0;

endmodule

module MULTIPLIER(
    input MUL_EN,
    input signed [9:0] MUL_OP_A,
    input signed [3:0] MUL_OP_B,
    output signed [13:0] MUL_RESULT
);

    logic signed [9:0] a_g;
    logic signed [3:0]  b_g;
    assign a_g = MUL_EN ? MUL_OP_A : '0;
    assign b_g = MUL_EN ? MUL_OP_B : '0;

    assign MUL_RESULT = a_g * b_g;

endmodule