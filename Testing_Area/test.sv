//-----------------------------------------------------
// Design Name : up_counter_load
// File Name   : up_counter_load.sv
// Function    : Up counter with load
// Coder      : Deepak
//-----------------------------------------------------
module up_counter_load    (
    output  reg  [7:0]  out      ,  // Output of the counter
    input   wire [7:0]  data     ,  // Parallel load for the counter
    input   wire        load     ,  // Parallel load enable
    input   wire        enable   ,  // Enable counting
    input   wire        clk      ,  // clock input
    input   wire        reset       // reset input
  );
  //-------------Code Starts Here-------
  always_ff @ (posedge clk)
    if (reset)
    begin
      out <= 8'b0 ;
    end
    else if (load)
    begin
      out <= data;
    end
    else if (enable)
    begin
      out <= out++;
    end

endmodule
