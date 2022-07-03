`timescale 1ns / 1ps



module shift_register (
	input clk,
	input resetn,
	input i_val,
	output reg [9:0] o_led
	);
	
	// Module Body
    always @(negedge resetn or posedge clk) begin
        if(!resetn) begin //초기 상태를 지정해준다
            o_led <= 10'b0000000000;
        end
        else begin //버튼을 눌렀을 때 신호가 각각 한 비트씩 옮겨 갈 수 있도록 한다. (ex. o_led[0] -> o_led[1]
            o_led[0] <= i_val;
            o_led[1] <= o_led[0];
            o_led[2] <= o_led[1];
            o_led[3] <= o_led[2];
            o_led[4] <= o_led[3];
            o_led[5] <= o_led[4];
            o_led[6] <= o_led[5];
            o_led[7] <= o_led[6];
            o_led[8] <= o_led[7];
            o_led[9] <= o_led[8];
        end
    end
endmodule

