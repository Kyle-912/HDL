set_false_path -from [get_clocks s00_axi_aclk] -to [get_clocks clk2] 
set_false_path -from [get_clocks clk2] -to [get_clocks s00_axi_aclk]