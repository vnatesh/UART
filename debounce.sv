// We have to be careful counting button 
// pushes, because switches bounce, which is the phenomenon where a switch may literally
// bounce on the contacts when pushed/unpushed resulting in high-frequency ON-OFF-ON-OFF 
// signaling. A human may not notice this, but our 100 MHz digital systems will. The 
// required solution is to “debounce” the signal so we'll add a module which handles 
// this for us. Switch bounce typically disappears after 10-ish ms so one approach to 
// building a debouncer is to make a module that only “passes” the button's value after 
// it has been constant for 10 ms (you DSP people can think of this as a form of 
// low-pass filtering).


module debounce(
	input clk_in,
	input rst_in,
	input bouncey_in,
	output logic clean_out
	);

	logic[19:0] count;
	logic old;

	always_ff @(posedge clk_in) begin
		old <= bouncey_in;
		if(rst_in) begin
            clean_out <= 1'b0;
        end else begin
			if(old == bouncey_in) begin
				count <= count + 1;
				if(count == 999999) begin
					clean_out <= old;
				end
			end else begin
				count <= 20'b0;
			end
		end
	end
endmodule


