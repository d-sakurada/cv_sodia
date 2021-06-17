module ghrd_top (
    // FPGA peripherals ports
  input  wire [1:0]  fpga_dipsw_pio,                   
  output wire [3:0]  fpga_led_pio,                     
//  input  wire [1:0]  fpga_button_pio,  
    // HPS memory controller ports
//  output wire [14:0] hps_memory_mem_a,                           
//  output wire [2:0]  hps_memory_mem_ba,                          
//  output wire        hps_memory_mem_ck,                          
//  output wire        hps_memory_mem_ck_n,                        
//  output wire        hps_memory_mem_cke,                         
//  output wire        hps_memory_mem_cs_n,                        
//  output wire        hps_memory_mem_ras_n,                       
//  output wire        hps_memory_mem_cas_n,                       
//  output wire        hps_memory_mem_we_n,                        
//  output wire        hps_memory_mem_reset_n,                     
//  inout  wire [39:0] hps_memory_mem_dq,                          
//  inout  wire [4:0]  hps_memory_mem_dqs,                         
//  inout  wire [4:0]  hps_memory_mem_dqs_n,                       
//  output wire        hps_memory_mem_odt,                         
//  output wire [4:0]  hps_memory_mem_dm,                          
//  input  wire        hps_memory_oct_rzqin,                       
//    // HPS peripherals
//  output wire        hps_emac1_TX_CLK,   
//  output wire        hps_emac1_TXD0,     
//  output wire        hps_emac1_TXD1,     
//  output wire        hps_emac1_TXD2,     
//  output wire        hps_emac1_TXD3,     
//  input  wire        hps_emac1_RXD0,     
//  inout  wire        hps_emac1_MDIO,     
//  output wire        hps_emac1_MDC,      
//  input  wire        hps_emac1_RX_CTL,   
//  output wire        hps_emac1_TX_CTL,   
//  input  wire        hps_emac1_RX_CLK,   
//  input  wire        hps_emac1_RXD1,     
//  input  wire        hps_emac1_RXD2,     
//  input  wire        hps_emac1_RXD3,     
//  inout  wire        hps_qspi_IO0,       
//  inout  wire        hps_qspi_IO1,       
//  inout  wire        hps_qspi_IO2,       
//  inout  wire        hps_qspi_IO3,       
//  output wire        hps_qspi_SS0,       
//  output wire        hps_qspi_CLK,       
//  inout  wire        hps_sdio_CMD,       
//  inout  wire        hps_sdio_D0,        
//  inout  wire        hps_sdio_D1,        
//  output wire        hps_sdio_CLK,       
//  inout  wire        hps_sdio_D2,        
//  inout  wire        hps_sdio_D3,        
//  inout  wire        hps_usb1_D0,        
//  inout  wire        hps_usb1_D1,        
//  inout  wire        hps_usb1_D2,        
//  inout  wire        hps_usb1_D3,        
//  inout  wire        hps_usb1_D4,        
//  inout  wire        hps_usb1_D5,        
//  inout  wire        hps_usb1_D6,        
//  inout  wire        hps_usb1_D7,        
//  input  wire        hps_usb1_CLK,       
//  output wire        hps_usb1_STP,       
//  input  wire        hps_usb1_DIR,       
//  input  wire        hps_usb1_NXT,       
////  output wire        hps_spim0_CLK,      
////  output wire        hps_spim0_MOSI,     
////  input  wire        hps_spim0_MISO,     
////  output wire        hps_spim0_SS0,      
//  input  wire        hps_uart0_RX,       
//  output wire        hps_uart0_TX,       
//  inout  wire        hps_i2c0_SDA,       
//  inout  wire        hps_i2c0_SCL,     
//  inout  wire        hps_i2c1_SDA,       
//  inout  wire        hps_i2c1_SCL,    
////  input  wire        hps_can0_RX,        
////  output wire        hps_can0_TX,        
////  output wire        hps_trace_CLK,      
////  output wire        hps_trace_D0,       
////  output wire        hps_trace_D1,       
////  output wire        hps_trace_D2,       
////  output wire        hps_trace_D3,       
////  output wire        hps_trace_D4,       
////  output wire        hps_trace_D5,       
////  output wire        hps_trace_D6,       
////  output wire        hps_trace_D7,       
////  inout  wire        hps_gpio_GPIO09,    
//  inout  wire        hps_gpio_GPIO35,    
//  inout  wire        hps_gpio_GPIO41,    
//  inout  wire        hps_gpio_GPIO42,    
//  inout  wire        hps_gpio_GPIO43,    
//  inout  wire        hps_gpio_GPIO44,    
    // FPGA clock and reset
//  input  wire        fpga_clk_50                         
    input  wire FPGA_RESETn,     //AD27
    input  wire FPGA_CLKIN_100M  //AC18
);

  wire[31:0] qsys_po;

	qsys1 u0 (
		.clk_clk                          (FPGA_CLKIN_100M),                          //                       clk.clk
		.reset_reset_n                    (FPGA_RESETn),                    //                     reset.reset_n
		.i2c_0_i2c_serial_sda_in          (1'b1),          //          i2c_0_i2c_serial.sda_in
		.i2c_0_i2c_serial_scl_in          (1'b1),          //                          .scl_in
		.i2c_0_i2c_serial_sda_oe          (),          //                          .sda_oe
		.i2c_0_i2c_serial_scl_oe          (),          //                          .scl_oe
		.pio_0_external_connection_export (qsys_po)  // pio_0_external_connection.export
	);
  
  assign fpga_led_pio[3:0] = qsys_po[3:0];


endmodule
