`timescale 1ns / 1ps

module topModule(
    input sysclk,
    input [3:0] btn,
    input [1:0] sw,
	output [3:0] led,
	output led4_r,
	output led4_g,
	output led4_b,
	output led5_r,
	output led5_g,
	output led5_b
    );
    
    wire [3:0] btn_n;
    assign btn_n = ~btn;
    
    wire [9:0] total_LED;
    assign total_LED = {led5_b, led5_g, led5_r, led4_b, led4_g, led4_r, led[3], led[2], led[1], led[0]};
    
    wire clk_1s;
    
    clk_1s_generator clk_inst (
    .clk(sysclk),
    .resetn(btn_n[0]),
    .clk_1s(clk_1s)
    );
    
    shift_register shift_inst (
	.clk(clk_1s),
	.resetn(btn_n[0]),
	.i_val(sw[0]),
	.o_led(total_LED)
	);
    
endmodule
