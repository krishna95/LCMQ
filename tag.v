`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Kharagpur
// Engineer: Krishna Bagadia
// 
// Create Date:    14:08:09 08/14/2016 
// Design Name: LCMQ
// Module Name:    tag 
// Project Name: LCMQ
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module XOR(O,A,B);
	input wire A,B;
	output wire O;
	assign O = (~A)*B + A*(~B);
endmodule

module AND(O,A,B);
	input wire A,B;
	output wire O;
	assign O = A*B;
endmodule

module XOR_SINGLE_ARRAY(O,A);
	parameter m=163;
	input wire[0:m-1] A;
	output wire O;
	assign O = ^A;
endmodule

module AND_ARRAY(O,A,B);
	parameter m=163;//default
	input wire[0:m-1] A,B;
	output wire[0:m-1] O;
	AND a[0:m-1] (O,A,B);
endmodule

module XOR_ARRAY(O, A, B);
	parameter m=163; //default
	input wire[0:m-1] A, B;
	output wire[0:m-1] O;
	XOR x[0:m-1] (O,A,B);
endmodule

module INNER_PRODUCT(O,A,B);
	parameter m=163;
	input wire[0:m-1] A,B;
	output wire O;
	wire[0:m-1] temp;
	AND_ARRAY a(temp,A,B);
	XOR_SINGLE_ARRAY x(O,temp);
endmodule

module MUX(O,A,B,sel);
	input wire A,B;
	output wire O;
	input wire sel;
	assign O = (~sel)*A + (sel&B);
endmodule

module D_FLIP_FLOP(Q,A,clk,reset);
	parameter m=163;
	input wire[0:m-1] A;
	output wire[0:m-1] Q;
	reg[0:m-1] Q1;
	input wire clk,reset;
	assign Q=Q1;
	initial
	begin
		Q1=163'd0;
	end
	always@(posedge clk or negedge reset)
		if(~reset)begin
			Q1<=163'd0;
		end
		else begin
			Q1 <= A;

		end
endmodule

module MUX_ARRAY(O,B_R,A,B,sel,clk);
	parameter m=163;
	input wire[0:m-1] A,B;
	output wire[0:m-1] O,B_R;
	input wire sel,clk;
	wire[0:m-1] temp;
	MUX mu[0:m-1](O,A,B,sel);
	assign B_R = O;
	//D_FLIP_FLOP d(O,temp,clk,1); // why do u need this ???
	//D_FLIP_FLOP dd(B_R,B,clk,1);
endmodule

module TRI_BUF(O,A,E);
	input wire A,E;
	output wire O;
	assign O = (E)?A:1'bz;
endmodule

//module DEMUX(O,A,sel);
//	parameter m=163;
//	parameter log_m = 7;
//	input wire A;
//	input wire[0:log_m] sel;
//	output wire[0:m-1] O;
//	integer i;
//	always@(sel)
//		i = sel;
//	assign O[i-:1] = A;
//endmodule

module RIGHT_SHIFT(O,A, clk);
	parameter m=163;
	input wire[0:m-1] A;
	input wire clk;
	output wire[0:m-1] O;
	wire[0:m-1] temp;
	assign temp={A[m-1],A[0:m-2]};
	D_FLIP_FLOP #m d(O,temp,clk,1'b1);
endmodule

module test_bench_right_shift();
	parameter m=163;
	wire[0:m-1] A,O;
	wire clk;
	RIGHT_SHIFT rs(O,A,clk);
	reg[0:m-1] A1;
	reg clk1;
	assign clk=clk1;
	assign A=A1;
	initial begin
	clk1=0;
	A1=163'd1;
	end
	always #100 clk1=~clk1;
	always #100 $display("A=%b O=%b ",A,O);
endmodule


module MULTIPLY_B_CK(O,B,C_k,clk1);
	parameter m=163; // mxn 1xm
	parameter n=162; //size of the output
	
	parameter START_STATE=2'b00;
	parameter INTER_STATE=2'b01;
	parameter FINAL_STATE=2'b10;
	
	reg[0:1] current_state, next_state;
	input wire[0:m-1] B;
	input wire[0:m-1] C_k;
	input wire clk1;
	output wire[0:n-1] O;
	
	wire sel,O1,select, clk,mux_result;
	wire[0:m-1] Ckr, mux_inner_poduct, shift_mux;
	wire[0:n-1] shift_result,result,result_shift;
	integer i;
	reg sel1,select1, stop, start;
	
	assign sel = sel1;
	assign select = select1;
	assign clk = (clk1&(~stop))&start;
	
	MUX_ARRAY ma(mux_inner_poduct,Ckr,C_k,shift_mux,sel,clk);
	RIGHT_SHIFT rs(shift_mux,Ckr,clk);
	INNER_PRODUCT ip(O1,B,mux_inner_poduct);
	//MUX m1(mux_result,O1,shift_result[0],select);

	D_FLIP_FLOP #162 df(result,{O1,result[2:n-1],result[0]},clk,1'b1);
	//RIGHT_SHIFT #162 rs2(shift_result,result,clk);
	
	assign O = {result[1:n-1],result[0]};
	initial begin
		current_state = START_STATE;
		sel1=1'b0;
		i=0;
		stop = 1'b0;
		start = 1'b0;
	end
	always @(posedge clk)
	begin
		current_state <= next_state;
		i=i+1;
		if(i==n+1)
			current_state<=FINAL_STATE;
	end
	always@(*)
	begin
		case(current_state)
			START_STATE: begin
								if(i>0)
									next_state = INTER_STATE;
								start = 1'b1;
								//i = i+1;
							end
			INTER_STATE: begin
								if(i==m)begin
									next_state = FINAL_STATE;
									end
								$display("Incrementing the value of i");
								//i=i+1;
								sel1<=1'b1;
								end
								
			FINAL_STATE: begin
								stop = 1'b1;
							end
		endcase
	end
endmodule

module test_bench_multiply_b_ck();
	wire[0:162] B,C_k;
	wire[0:161] O;
	wire clk;
	MULTIPLY_B_CK mk(O,B,C_k,clk);
	reg[0:162] B1,C_k1;
	reg clk1;
	assign clk=clk1;
	assign B=B1;
	assign C_k = C_k1;
	initial 
	begin
		clk1=1;
		B1=163'd2;
		C_k1=163'd2;
	end
	always #1 clk1=~clk1;
	always #1 $display("B=%b C_k=%b O=%b mux_inner_poduct=%b Ckr=%b sel=%b O1=%b mux_result=%b shift_mux=%b i=%d",B,C_k,O,mk.mux_inner_poduct, mk.Ckr, mk.sel,mk.O1,mk.mux_result,mk.shift_mux ,mk.i);
	
	
endmodule

module tag(
 );
endmodule

//module test_bench_demux();
//	parameter m=163;
//	parameter log_m = 7;
//	wire A,clk;
//	wire[0:log_m] sel;
//	wire[0:m-1] O;
//	DEMUX dm(O,A,sel,clk);
//	reg[0:log_m] sel1;
//	reg A1;
//	assign A= A1;
//	assign clk=1;
//	initial
//	begin
//		#10
//		sel1 = 7'd0;
//		A1=1;
//		$display("A=%b O=%b sel=%b",A,O,sel);
//		#10
//		sel1=7'd2;
//		A1=0;
//		$display("A=%b O=%b sel=%b",A,O,sel);
//		#10
//		sel1=7'd0;
//		A1=0;
//		$display("A=%b O=%b sel=%b",A,O,sel);
//	end
//endmodule

module test_bench_d_flip_flop();
	parameter m=163;
	wire[0:m-1] A,Q;
	reg[0:m-1] A1;
	wire clk,reset;
	reg clk1;
	
	assign A=A1;
	assign clk=clk1;
	assign reset=1;
	D_FLIP_FLOP d(Q,A,clk,reset);
	
	initial
	begin
		clk1=0;
		A1=163'd1;
	end
	always#100 clk1=~clk1;
	
	initial 
	begin
		#200
		A1=163'd2;
		$display("Q=%b A1=%b",Q,A);
		#300
		A1=163'd3;
		$display("Q=%b A1=%b",Q,A);
		#600
		$display("Q=%b A1=%b",Q,A);
	end

endmodule

module test_bench_mux();
	wire A,B,O,sel;
	MUX m(O,A,B,sel);
	reg A1,B1,sel1;
	assign A=A1,B=B1,sel=sel1;
	initial
	begin
		#1
		A1=1'b1;
		B1=1'b0;
		sel1=1'b1;
		#2
		$display("A=%b B=%b O=%b sel=%b ",A,B,O,sel);
		#3
		A1=1'b1;
		B1=1'b0;
		sel1=1'b0;
		#4
		$display("A=%b B=%b O=%b sel=%b ",A,B,O,sel);
	end
endmodule

module test_bench_mux_array();
	parameter m=163;
	wire[0:m-1] A,B,O,B_R;
	reg[0:m-1] A1,B1;
	wire sel,clk;
	reg sel1,clk1;
	MUX_ARRAY mu(O,B_R,A,B,sel,clk);
	assign A = A1;
	assign B = B1;
	assign sel = sel1;
	assign clk = clk1;
	initial 
	begin
		#1
		A1 = 163'd1;
		B1 = 163'd3;
		sel1 = 0;
		#2
		clk1 = 1;
		#3
		$display("A=%b B=%b B_R=%b sel=%b O=%b clk=%b",A,B,B_R,sel,O,clk);
		#4
		clk1=0;
		#5
		sel1=1;
		#6
		$display("A=%b B=%b B_R=%b sel=%b O=%b clk=%b",A,B,B_R,sel,O,clk);
		#7 
		clk1=1;
		#8
		$display("A=%b B=%b B_R=%b sel=%b O=%b clk=%b",A,B,B_R,sel,O,clk);
	end
endmodule


module test_bench_inner_product();
	parameter m=163;
	wire[0:m-1] A,B;
	wire O;
	INNER_PRODUCT in(O,A,B);
	reg[0:162] A1,B1;
	assign A=A1;
	assign B=B1;
	initial
	begin
		#10
		A1 = 163'd3;
		B1 = 163'd3;
		#20
		$display("A=%b B=%b O=%b",A,B,O);
		#10
		A1 = 163'd1;
		B1 = 163'd0;
		#20
		$display("A=%b B=%b O=%b",A,B,O);
		#10
		A1 = 163'd1;
		B1 = 163'd1;
		#20
		$display("A=%b B=%b O=%b",A,B,O);
	end
endmodule

module test_bench_xor_gate();
	wire A,B,O;
	reg A1, B1;
	XOR x(O,A,B);
	assign A = A1;
	assign B = B1;
	
	initial 
	begin
		#10
		A1 = 1'b1;
		B1 = 1'b1;
		#20
		$display("A=%b B=%b O=%b",A,B,O);
		#30
		A1 = 1'b0;
		B1 = 1'b1;
		#40
		$display("A=%b B=%b O=%b",A,B,O);
		#50
		A1 = 1'b1;
		B1 = 1'b0;
		#60
		$display("A=%b B=%b O=%b",A,B,O);
		#70
		A1 = 1'b0;
		B1 = 1'b0;
		#80
		$display("A=%b B=%b O=%b",A,B,O);
	end
endmodule

module test_bench_xor_array();
	parameter m=163;
	wire[0:m-1] A,B,O;
	reg[0:m-1] A1,B1;
	XOR_ARRAY x(O,A,B);
	assign A = A1;
	assign B = B1;
	
	initial
	begin
		A1 = 10'd163;
		B1 = 10'd163;
		#10
		$display("A=%b , B=%b, O=%b",A,B,O);
	end
endmodule

module test_bench_and_array();
	parameter m=163;
	wire[0:m-1] A,B,O;
	reg[0:m-1] A1,B1;
	AND_ARRAY x(O,A,B);
	assign A = A1;
	assign B = B1;
	
	initial
	begin
		A1 = 10'd163;
		B1 = 10'd163;
		#10
		$display("A=%b , B=%b, O=%b",A,B,O);
	end
endmodule

module testbench_xor_single_array();
	parameter m=163;
	wire[0:m-1] A;
	wire O;
	reg[0:m-1] A1;
	XOR_SINGLE_ARRAY x(O,A);
	assign A = A1;
	
	initial
	begin
		A1 = 10'd3;
		#10
		$display("A=%b , O=%b",A,O);
	end
endmodule