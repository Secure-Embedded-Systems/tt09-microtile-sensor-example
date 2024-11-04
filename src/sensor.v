`default_nettype none

module sensor #(parameter N_DELAY = 16) (
    input wire  i,             // System clock
    output wire delayed_clk      // Delayed clock output
);

    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_1;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_2;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_3;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_4;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_5;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_6;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_7;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_8;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_9;
    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig_10;
    (* keep = "true" *) wire [N_DELAY:0] w_dly_sig_n;

    assign w_dly_sig[0] = i;

    genvar i;
    generate
        for (i = 0; i <= N_DELAY; i = i + 1) begin : g_dly_chain_even
            (* keep = "true" *) cinv dly_stg1 (.a(w_dly_sig[i]), .q(w_dly_sig_1[i]));
            (* keep = "true" *) cinv dly_stg2 (.a(w_dly_sig_1[i]), .q(w_dly_sig_2[i]));
            (* keep = "true" *) cinv dly_stg3 (.a(w_dly_sig_2[i]), .q(w_dly_sig_3[i]));
            (* keep = "true" *) cinv dly_stg4 (.a(w_dly_sig_3[i]), .q(w_dly_sig_4[i]));
            (* keep = "true" *) cinv dly_stg5 (.a(w_dly_sig_4[i]), .q(w_dly_sig_5[i]));
            (* keep = "true" *) cinv dly_stg6 (.a(w_dly_sig_5[i]), .q(w_dly_sig_6[i]));
            (* keep = "true" *) cinv dly_stg7 (.a(w_dly_sig_6[i]), .q(w_dly_sig_7[i]));
            (* keep = "true" *) cinv dly_stg8 (.a(w_dly_sig_7[i]), .q(w_dly_sig_8[i]));
            (* keep = "true" *) cinv dly_stg9 (.a(w_dly_sig_8[i]), .q(w_dly_sig_9[i]));
            (* keep = "true" *) cinv dly_stg10 (.a(w_dly_sig_9[i]), .q(w_dly_sig_10[i]));
            (* keep = "true" *) cinv dly_stg11 (.a(w_dly_sig_10[i]), .q(w_dly_sig_n[i]));
            (* keep = "true" *) cinv dly_stg12 (.a(w_dly_sig_n[i]), .q(w_dly_sig[i+1]));
        end
    endgenerate

    assign delayed_clk = w_dly_sig[N_DELAY];

endmodule

