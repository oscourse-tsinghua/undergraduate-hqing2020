//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2014 leishangwen@163.com                       ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
// Module:  phy_bus_addr_conv
// File:    phy_bus_addr_conv.v
// Author:  shyoshyo
// E-mail:  shyoshyo@qq.com
// Description: phy addr => bus addr    
// Revision: 1.0
//////////////////////////////////////////////////////////////////////
`include "cpu/defines.v"

`define RAM_PHYSICAL_ADDR_BEGIN            34'h08000_0000
`define RAM_PHYSICAL_ADDR_LEN              34'h00080_0000

`define UART_PHYSICAL_ADDR_BEGIN           34'h00200_0000
`define UART_PHYSICAL_ADDR_LEN             34'h20

`define CONFIG_STRING_PHYSICAL_ADDR_BEGIN  34'h00000_1000
`define CONFIG_STRING_PHYSICAL_ADDR_LEN    34'h00000_0100

`define MTIME_PHYSICAL_ADDR_BEGIN          34'h04000_0000
`define MTIME_PHYSICAL_ADDR_LEN            34'h00000_0008

`define MTIMECMP_PHYSICAL_ADDR_BEGIN       34'h04000_0008
`define MTIMECMP_PHYSICAL_ADDR_LEN         34'h00000_0008

`define IPI_PHYSICAL_ADDR_BEGIN            34'h04000_1000
`define IPI_PHYSICAL_ADDR_LEN              34'h00000_0004

`define FLASH_PHYSICAL_ADDR_BEGIN          34'h00001_0000//34'h02000_0000
`define FLASH_PHYSICAL_ADDR_LEN            34'h00000_C000//34'h00080_0000

//`define BOOTLOADER_PHYSICAL_ADDR_BEGIN     34'h00002_0000
//`define BOOTLOADER_PHYSICAL_ADDR_LEN       34'h00000_0400

`define LED_PHYSICAL_ADDR_BEGIN				 34'h03000_0000 
`define LED_PHYSICAL_ADDR_LEN					 34'h10	


module phy_bus_addr_conv(
	input wire rst_n,

	input wire[`PhyAddrBus] phy_addr_i,
	output reg[`WishboneAddrBus] bus_addr_o
);
	wire [`PhyAddrBus] ram_index = ((phy_addr_i - `RAM_PHYSICAL_ADDR_BEGIN));
	wire [`PhyAddrBus] uart_index = ((phy_addr_i - `UART_PHYSICAL_ADDR_BEGIN));
	wire [`PhyAddrBus] config_string_index = ((phy_addr_i - `CONFIG_STRING_PHYSICAL_ADDR_BEGIN));
	
	wire [`PhyAddrBus] mtime_index = ((phy_addr_i - `MTIME_PHYSICAL_ADDR_BEGIN));
	wire [`PhyAddrBus] mtimecmp_index = ((phy_addr_i - `MTIMECMP_PHYSICAL_ADDR_BEGIN));
	wire [`PhyAddrBus] ipi_index = ((phy_addr_i - `IPI_PHYSICAL_ADDR_BEGIN));

	wire [`PhyAddrBus] flash_index = ((phy_addr_i - `FLASH_PHYSICAL_ADDR_BEGIN));
	//wire [`PhyAddrBus] bootloader_index = ((phy_addr_i - `BOOTLOADER_PHYSICAL_ADDR_BEGIN));
	wire [`PhyAddrBus] led_index = ((phy_addr_i - `LED_PHYSICAL_ADDR_BEGIN));
	
	always @(*)
		if (rst_n == `RstEnable)
		begin
			bus_addr_o <= `ZeroWord;
		end
		else
		begin
			if (ram_index < `RAM_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h0, ram_index[27:0]};
			else if (uart_index < `UART_PHYSICAL_ADDR_LEN)
				//bus_addr_o <= {4'h1, uart_index[27:2], 2'h0};
				bus_addr_o <= {4'h1, uart_index[27:0]};
			else if (config_string_index < `CONFIG_STRING_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h3, config_string_index[27:0]};
			else if (mtime_index < `MTIME_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h3, mtime_index[27:0] + 8'hfc};
			else if (mtimecmp_index < `MTIMECMP_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h3, mtimecmp_index[27:0] + 8'hfe};
			else if (ipi_index < `IPI_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h3, ipi_index[27:0] + 8'h3fb};
			else if (flash_index < `FLASH_PHYSICAL_ADDR_LEN)
				bus_addr_o <= {4'h4, flash_index[27:0]};
			else if (led_index < `LED_PHYSICAL_ADDR_BEGIN)
				bus_addr_o <= {4'h5, led_index[27:0]};
			//else if (bootloader_index < `BOOTLOADER_PHYSICAL_ADDR_LEN)
			//	bus_addr_o <= {4'h2, bootloader_index[27:0]};
			else
				bus_addr_o <= ~`ZeroWord;
		end
endmodule
