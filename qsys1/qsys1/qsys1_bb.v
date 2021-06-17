
module qsys1 (
	clk_clk,
	reset_reset_n,
	i2c_0_i2c_serial_sda_in,
	i2c_0_i2c_serial_scl_in,
	i2c_0_i2c_serial_sda_oe,
	i2c_0_i2c_serial_scl_oe,
	pio_0_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		i2c_0_i2c_serial_sda_in;
	input		i2c_0_i2c_serial_scl_in;
	output		i2c_0_i2c_serial_sda_oe;
	output		i2c_0_i2c_serial_scl_oe;
	output	[31:0]	pio_0_external_connection_export;
endmodule
