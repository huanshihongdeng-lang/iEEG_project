module newMAC_tb();

    logic clk;
    logic rst_n;
    logic en;
    logic data_valid;
    logic signed [7:0] weight;
    logic signed [7:0] activation;
    logic reset;
    logic acc;
    logic output_valid_NMAC;
    logic signed [21:0] output_result_NMAC;
    logic signed [21:0] output_result_TMAC;
    logic signed [7:0]  weight_MEM [0:63] ;
    logic signed [7:0]  activation_MEM [0:63] ;
    integer test;
    integer w_i, a_i;

    initial begin
        clk = '0;
        rst_n = '0;
        en = '0;
        data_valid = '0;
        weight = '0;
        activation = '0;
        reset = '0;
        acc = '0;
    end

    initial begin
        clk = '0;
        forever begin
            clk = #10 ~clk;
        end
    end

    initial begin
        $readmemb("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/weight_sorted_8b.txt", weight_MEM          ) ;
    end

    initial begin
        $readmemb("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/activation_sorted.txt", activation_MEM  ) ;
    end

    initial begin
        $sdf_annotate("/home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/newMAC_v5/newMAC_v5.sdf", u_newMAC,,"newMAC_sdf.log",);
        $sdf_annotate("/home/hdeng/ic/iEEG_Transformer_Project2/Scripts/Syn/traditionalMac_v1/traditionalMac_v1.sdf", u_traditionalMac,,"traditionalMac_sdf.log",);
    end



    initial begin
        // traditionalMac
        $dumpfile("/home/hdeng/ic/iEEG_Transformer_Project2/RTL/new_MAC_PE/newMAC_8b_tb.vcd");
        $dumpvars(0, newMAC_tb);
    end


    initial begin
        @(negedge clk) rst_n = 1'b1;
        @(negedge clk) en    = 1'b1;
        test = 0;
        SEND_WEIGHT_ACTIVATION;
    end

    task SEND_WEIGHT_ACTIVATION;
    begin
        @(negedge clk);
        for (integer i = 0; i < 64; i++) begin
            data_valid = 1'b1;
            weight = weight_MEM[i];
            activation = activation_MEM[i];
            a_i = $signed(activation_MEM[i]);
            w_i = $signed(weight_MEM[i]);  
            test = test + w_i * a_i;
            @(negedge clk);
        end
        data_valid = 1'b0;
        acc = 1'b1;
        @(negedge clk);
        acc = 1'b0;
        repeat(20) begin
            @(negedge clk);
        end
        $finish;
    end
    endtask


    newMAC_v5 u_newMAC(
        .clk            ( clk                ),
        .rst_n          ( rst_n              ),
        .en             ( en                 ),
        .data_valid     ( data_valid         ),
        .weight         ( weight             ),
        .activation     ( activation         ),
        .reset          ( reset              ),
        .acc            ( acc                ),
        .output_valid   ( output_valid_NMAC  ),
        .output_result  ( output_result_NMAC )
    );

    traditionalMac_v1 u_traditionalMac(
        .clk            ( clk                 ),
        .rst_n          ( rst_n               ),
        .en             ( en                  ),
        .reset          ( reset               ),
        .data_valid     ( data_valid          ),
        .weight         ( weight              ),
        .activation     ( activation          ),
        .output_result  ( output_result_TMAC  )
    );


endmodule
