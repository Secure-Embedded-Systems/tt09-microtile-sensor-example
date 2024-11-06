`default_nettype none

module sensor #(parameter N_DELAY = 8) (
    input wire inverted_clk,              // System clock
    output wire delayed_clk               // Delayed clock output
);

    (* keep = "true" *) wire [N_DELAY+1:0] w_dly_sig;
    (* keep = "true" *) wire [N_DELAY:0] w_dly_sig_n;

    assign w_dly_sig[0] = inverted_clk;

    genvar i;
    generate
        for (i = 0; i <= N_DELAY; i = i + 1) begin : g_dly_chain_even
            (* keep = "true" *) cinv dly_stg1 (.a(w_dly_sig[i]), .q(w_dly_sig_n[i]));
            (* keep = "true" *) cinv dly_stg2 (.a(w_dly_sig_n[i]), .q(w_dly_sig[i+1]));
        end
    endgenerate

    assign delayed_clk = w_dly_sig[N_DELAY];

endmodule

