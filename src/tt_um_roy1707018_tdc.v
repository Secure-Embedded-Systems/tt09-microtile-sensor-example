/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_roy1707018_tdc (

	      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(vpwr),
      .VGND(vgnd),
`endif
    input  wire [7:0] ui_in,    // Dedicated inputs (we'll use ui_in[1:0] for mux control)
    output wire [7:0] uo_out,   // Dedicated outputs (8-bit output of time count)
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // Don't use (used for power gating)
    input  wire       clk,      // System clock
    input  wire       rst_n     // Active-low reset
);


    localparam N_DELAY = 16;
    
    // Delayed clock signal
    wire delayed_clk;
    wire inverted_clk; 
    // Assign the inverted value of clk to inverted_clk
     assign inverted_clk = ~clk;

    // Instantiate the sensor module
    sensor #(
        .N_DELAY(16) // Set the number of inverter stages
    ) sensor_inst (
        .clk(inverted_clk),
        .delayed_clk(delayed_clk)
    );
     assign uo_out[0] = inverted_clk;
    assign uo_out[1] = delayed_clk;
    assign uio_out = 0;
    assign uio_oe = 0;


  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in, 1'b0};







endmodule
