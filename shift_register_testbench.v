`timescale 1ns / 1ps

module shift_register_testbench();
    reg clk;
    reg resetn;
    reg i_val;
    wire [9:0] o_led;
    
    initial begin
        clk <= 0;
        resetn <= 1;
        i_val <= 0;

        #100 // initialization
        
		#25 resetn <= 0;
        
		#20 resetn <= 1;
        
		#20 i_val <= 1;
		#20 i_val <= 0;
		#40 i_val <= 1;
		#40 i_val <= 0;
    end
    
    always begin
        #10 clk <= ~clk;
    end
        
    
    shift_register shift_inst(
    .clk(clk),
    .resetn(resetn),
    .i_val(i_val),
    .o_led(o_led)
    );

endmodule
