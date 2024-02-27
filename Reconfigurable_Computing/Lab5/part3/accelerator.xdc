set_false_path -from [get_clocks clk_fpga_0] -to [get_clocks -of_objects [get_pins design_1_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]]
set_false_path -from [get_clocks -of_objects [get_pins design_1_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0]] -to [get_clocks clk_fpga_0]

