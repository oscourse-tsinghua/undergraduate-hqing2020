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
// Module:  openriscv
// File:    openriscv.v
// Author:  Lei Silei, shyoshyo
// E-mail:  leishangwen@163.com, shyoshyo@qq.com
// Description: OpenRISCV�������Ķ����ļ�
// Revision: 1.0
//////////////////////////////////////////////////////////////////////

`include "defines.v"

module openriscv(

	input wire clk,
	input wire wishbone_clk,
	input wire rst_n,
	
	input wire timer_int_i,
	input wire software_int_i,
	input wire external_int_i,
	
	// inst wishbone
	input wire[`WishboneDataBus]   iwishbone_data_i,
	input wire                     iwishbone_ack_i,
	output wire[`PhyAddrBus]       iwishbone_addr_o,
	output wire[`WishboneDataBus]  iwishbone_data_o,
	output wire                    iwishbone_we_o,
	output wire[`WishboneSelBus]   iwishbone_sel_o,
	output wire                    iwishbone_stb_o,
	output wire                    iwishbone_cyc_o, 
	
	// data wishbone
	input wire[`WishboneDataBus]   dwishbone_data_i,
	input wire                     dwishbone_ack_i,
	output wire[`PhyAddrBus]       dwishbone_addr_o,
	output wire[`WishboneDataBus]  dwishbone_data_o,
	output wire                    dwishbone_we_o,
	output wire[`WishboneSelBus]   dwishbone_sel_o,
	output wire                    dwishbone_stb_o,
	output wire                    dwishbone_cyc_o,
	
	output wire[`RegBus] pc_o
);
	// ��һ����Ҫ���� inst �洢���ĵ�ַ
	wire [`PhyAddrBus]pc_next_inst_phy_addr;
	wire [`RegBus]pc_next_inst_vir_addr;
	wire pc_next_inst_tlb_exception;
	wire pc_ce_o;


	// pc reg ��� IF �׶ε�����
	// inst �洢�� ʹ��
	wire[`RegBus] pc;
	wire if_inst_ce_i;
	wire [`PhyAddrBus]if_inst_phy_addr_i;
	wire [`ExceptionTypeBus]if_excepttype_i;

	//��������׶� IF ģ���������� IF/ID ģ��������
	// �� inst �洢�����õ�����
	wire[`InstBus] if_inst_o;
	wire if_inst_ce_o;
	wire [`ExceptionTypeBus]if_excepttype_o;

	//��������׶�IDģ��������
	wire[`RegBus] id_pc_i;
	wire[`InstBus] id_inst_i;
	wire[`ExceptionTypeBus] id_excepttype_i;
	wire id_not_stall_i;
	
	//��������׶�IDģ����������ID/EXģ��������
	wire[`AluOpBus] id_aluop_o;
	wire[`AluSelBus] id_alusel_o;
	wire[`RegBus] id_reg1_o;
	wire[`RegBus] id_reg2_o;
	wire[`RegBus] id_mem_addr_o;
	wire id_wreg_o;
	wire[`RegAddrBus] id_wd_o;
	wire id_is_in_delayslot_o;
	wire[`RegBus] id_link_address_o;
	wire[`InstBus] id_inst_o;
	wire[`ExceptionTypeBus] id_excepttype_o;
	wire[`RegBus] id_current_inst_address_o;
	wire id_not_stall_o;
 	wire id_csr_reg_re_o;
	wire[`CSRWriteTypeBus] id_csr_reg_we_o;
	wire[`CSRAddrBus] id_csr_reg_addr_o;
	wire[`RegBus] id_csr_reg_data_o;
	
	//���ID/EXģ����������ִ�н׶�EXģ��������
	wire[`AluOpBus] ex_aluop_i;
	wire[`AluSelBus] ex_alusel_i;
	wire[`RegBus] ex_reg1_i;
	wire[`RegBus] ex_reg2_i;
	wire[`RegBus] ex_mem_addr_i;
	wire ex_wreg_i;
	wire[`RegAddrBus] ex_wd_i;
	wire ex_is_in_delayslot_i;	
	wire[`RegBus] ex_link_address_i;
	wire[`InstBus] ex_inst_i;
	wire[`ExceptionTypeBus] ex_excepttype_i;	
	wire[`RegBus] ex_current_inst_address_i;
	wire ex_not_stall_i;
	wire[`CSRWriteTypeBus] ex_csr_reg_we_i;
	wire[`CSRAddrBus] ex_csr_reg_addr_i;
	wire[`RegBus] ex_csr_reg_data_i;

	wire [`PhyAddrBus]ex_mem_phy_addr_i;
	wire ex_data_tlb_exception_i;

	//���ִ�н׶�EXģ����������EX/MEMģ��������
	wire ex_wreg_o;
	wire[`RegAddrBus] ex_wd_o;
	wire[`RegBus] ex_wdata_o;
	wire[`AluOpBus] ex_aluop_o;
	wire[`RegBus] ex_mem_addr_o;
	wire ex_mem_we_o;
	wire ex_mem_ce_o;
	wire[`RegBus] ex_reg1_o;
	wire[`RegBus] ex_reg2_o;
	wire[`CSRWriteTypeBus] ex_csr_reg_we_o;
	wire[`CSRAddrBus] ex_csr_reg_addr_o;
	wire[`RegBus] ex_csr_reg_data_o;
	wire[`ExceptionTypeBus] ex_excepttype_o;
	wire[`RegBus] ex_current_inst_address_o;
	wire ex_not_stall_o;
	wire ex_is_in_delayslot_o;

	wire[`PhyAddrBus] ex_mem_phy_addr_o;
	wire ex_data_tlb_r_exception_o;
	wire ex_data_tlb_w_exception_o;

	//���EX/MEMģ�����������ô��׶�MEMģ��������
	wire mem_wreg_i;
	wire[`RegAddrBus] mem_wd_i;
	wire[`RegBus] mem_wdata_i;
	wire[`AluOpBus] mem_aluop_i;
	wire[`RegBus] mem_mem_addr_i;
	wire[`RegBus] mem_reg1_i;
	wire[`RegBus] mem_reg2_i;
	wire stallreq_from_dwishbone;
	wire [1:0] mem_cnt_i;
	wire [`RegBus] mem_original_data_i;
	wire[`CSRWriteTypeBus] mem_csr_reg_we_i;
	wire[`CSRAddrBus] mem_csr_reg_addr_i;
	wire[`RegBus] mem_csr_reg_data_i;
	wire[`ExceptionTypeBus] mem_excepttype_i;
	wire mem_is_in_delayslot_i;
	wire[`RegBus] mem_current_inst_address_i;
	wire mem_not_stall_i;
	wire [`PhyAddrBus]mem_mem_phy_addr_i;
	wire mem_data_tlb_r_exception_i;
	wire mem_data_tlb_w_exception_i;

	//��ӷô��׶�MEMģ����������MEM/WBģ��������
	wire mem_wreg_o;
	wire[`RegAddrBus] mem_wd_o;
	wire[`RegBus] mem_wdata_o;
	wire mem_LLbit_value_o;
	wire [`PhyAddrBus]mem_LLbit_addr_o;
	wire mem_LLbit_we_o;
	wire [1:0] mem_cnt_o;
	wire [`RegBus] mem_original_data_o;
	wire[`CSRWriteTypeBus] mem_csr_reg_we_o;
	wire[`CSRAddrBus] mem_csr_reg_addr_o;
	wire[`RegBus] mem_csr_reg_data_o;
	wire[`ExceptionTypeBus] mem_excepttype_o;
	wire mem_is_in_delayslot_o;
	wire[`RegBus] mem_current_inst_address_o;
	wire[`RegBus] mem_current_data_address_o;
	wire mem_not_stall_o;
	
	//���MEM/WBģ������������д�׶ε�����	
	wire wb_wreg_i;
	wire[`RegAddrBus] wb_wd_i;
	wire[`RegBus] wb_wdata_i;
	wire wb_LLbit_value_i;
	wire [`PhyAddrBus] wb_LLbit_addr_i;
	wire wb_LLbit_we_i;
	wire[`CSRWriteTypeBus] wb_csr_reg_we_i;
	wire[`CSRAddrBus] wb_csr_reg_addr_i;
	wire[`RegBus] wb_csr_reg_data_i;
	wire wb_is_in_delayslot_i;
	wire[`RegBus] wb_current_inst_address_i;
	
	//��������׶�IDģ����ͨ�üĴ���Regfileģ��
	wire reg1_read;
	wire reg2_read;
	wire[`RegBus] reg1_data;
	wire[`RegBus] reg2_data;
	wire[`RegAddrBus] reg1_addr;
	wire[`RegAddrBus] reg2_addr;
	
	// ���ִ�н׶���ex_regģ�飬���ڶ����ڵ�MADD��MADDU��MSUB��MSUBUָ��
	wire[1:0] cnt_o;
	
	wire[1:0] cnt_i;

	// ���ִ�н׶���ex_regģ�飬���ڶ����ڵ�DIV, DIVUָ��
	wire div_started_i;
	wire div_started_o;

	// ex ��� ������
	wire[`RegBus] div_result_rem;
	wire[`RegBus] div_result_div;
	wire div_ready;
	wire[`RegBus] div_opdata1;
	wire[`RegBus] div_opdata2;
	wire div_start;
	wire div_annul;
	wire signed_div;

	// id ������pc ������
	wire is_in_delayslot_i;
	wire is_in_delayslot_o;
	wire next_inst_in_delayslot_o;
	wire step_i;
	wire step_o;
	wire id_branch_flag_o;
	wire[`RegBus] branch_target_address;

	wire[5:0] stall;
	wire flush;
	wire stallreq_from_if;
	wire stallreq_from_id;
	wire stallreq_from_ex;
	wire stallreq_from_mem;

	wire LLbit_o;
	wire [`PhyAddrBus]LLbit_addr_o;

	wire[`RegBus] csr_data_o;
	wire csr_protect_o;
	wire flushreq_from_csr;
	wire[1:0] prv;
	wire[`RegBus] exception_new_pc;

	//pc_reg例化
/*	
	PC pc_reg0(
		.io_clk(clk),
		.io_rst_n(rst_n),
		.io_stall(stall),

		.io_flush(flush),
		.io_exception_new_pc(exception_new_pc),

		.io_branch_flag_i(id_branch_flag_o),
		.io_branch_target_address_i(branch_target_address),

		.io_next_inst_phy_addr_i(pc_next_inst_phy_addr),
		.io_next_inst_tlb_exception_i(pc_next_inst_tlb_exception), 

		.io_pc(pc),
		.io_inst_phy_addr_o(if_inst_phy_addr_i),
		.io_ce(if_inst_ce_i),

		.io_next_inst_vir_addr_o(pc_next_inst_vir_addr),
		.io_pc_ce_o(pc_ce_o),
		.io_excepttype_o(if_excepttype_i)
	);
*/

	//pc_reg例化
	pc_reg pc_reg0(
		.clk(clk),
		.rst_n(rst_n),
		.stall(stall),

		.flush(flush),
		.exception_new_pc(exception_new_pc),

		.branch_flag_i(id_branch_flag_o),
		.branch_target_address_i(branch_target_address),

		.next_inst_phy_addr_i(pc_next_inst_phy_addr),
		.next_inst_tlb_exception_i(pc_next_inst_tlb_exception), 

		.pc(pc),
		.inst_phy_addr_o(if_inst_phy_addr_i),
		.ce(if_inst_ce_i),

		.next_inst_vir_addr_o(pc_next_inst_vir_addr),
		.pc_ce_o(pc_ce_o),
		.excepttype_o(if_excepttype_i)
	);



	assign pc_o = pc;

	assign if_excepttype_o = if_excepttype_i;
	assign if_inst_ce_o = if_inst_ce_i;

	//IF/ID模块例化
	if_id if_id0(
		.clk(clk),
		.rst_n(rst_n),
		.stall(stall),
		.flush(flush),
		.if_pc(pc),
		.if_inst(if_inst_o),
		.if_inst_ce(if_inst_ce_o),
		.if_excepttype(if_excepttype_o),
		.id_pc(id_pc_i),
		.id_inst(id_inst_i),
		.id_excepttype(id_excepttype_i),
		.id_not_stall(id_not_stall_i)
	);
	
	//�����׶�IDģ��
	IDecode id0(
		.io_rst_n(rst_n),
		.io_pc_i(id_pc_i),
		.io_inst_i(id_inst_i),

		.io_excepttype_i(id_excepttype_i),
		.io_not_stall_i(id_not_stall_i),

		.io_reg1_data_i(reg1_data),
		.io_reg2_data_i(reg2_data),
		
		//����ִ�н׶ε�ָ����һЩ��Ϣ�����ڽ���load����
		.io_ex_aluop_i(ex_aluop_o),

		// ������·
		// ����ִ�н׶ε�ָ��Ҫд����Ŀ�ļĴ�����Ϣ
		.io_ex_wreg_i(ex_wreg_o),
		.io_ex_wdata_i(ex_wdata_o),
		.io_ex_wd_i(ex_wd_o),

		// ���ڷô��׶ε�ָ��Ҫд����Ŀ�ļĴ�����Ϣ
		.io_mem_wreg_i(mem_wreg_o),
		.io_mem_wdata_i(mem_wdata_o),
		.io_mem_wd_i(mem_wd_o),

		.io_ex_csr_reg_we_i(ex_csr_reg_we_o),
		.io_mem_csr_reg_we_i(mem_csr_reg_we_o),
		.io_wb_csr_reg_we_i(wb_csr_reg_we_i),

		.io_ex_not_stall_i(ex_not_stall_i),
		.io_mem_not_stall_i(mem_not_stall_i),

		// ������һ��ָ����ת��ָ���ô��һ��ָ����������ʱ�� is_in_delayslot Ϊ true
		.io_is_in_delayslot_i(is_in_delayslot_i),
		.io_step_i(step_i),
		
		.io_prv_i(prv),
		.io_csr_reg_data_i(csr_data_o),
		.io_csr_protect_i(csr_protect_o),

		//�͵�regfile����Ϣ
		.io_reg1_read_o(reg1_read),
		.io_reg2_read_o(reg2_read),
		.io_reg1_addr_o(reg1_addr),
		.io_reg2_addr_o(reg2_addr), 

		//�͵�ID/EXģ������Ϣ
		.io_aluop_o(id_aluop_o),
		.io_alusel_o(id_alusel_o),
		.io_reg1_o(id_reg1_o),
		.io_reg2_o(id_reg2_o),
		.io_mem_addr_o(id_mem_addr_o),
		.io_wd_o(id_wd_o),
		.io_wreg_o(id_wreg_o),
		.io_inst_o(id_inst_o),

		// ��һ��ָ���Ƿ����ӳٲ���
		.io_next_inst_in_delayslot_o(next_inst_in_delayslot_o),
		.io_step_o(step_o),

		// �Ƿ���Ҫ��ת���Լ���ת��ַ����ӵ�ַ
		.io_branch_flag_o(id_branch_flag_o),
		.io_branch_target_address_o(branch_target_address),
		.io_link_addr_o(id_link_address_o),
		
		// ����ָ���Ƿ����ӳٲ���
		.io_is_in_delayslot_o(id_is_in_delayslot_o),

		.io_excepttype_o(id_excepttype_o),
		.io_current_inst_address_o(id_current_inst_address_o),
		.io_not_stall_o(id_not_stall_o),
		.io_csr_reg_read_o(id_csr_reg_re_o),
		.io_csr_reg_we_o(id_csr_reg_we_o),
		.io_csr_reg_addr_o(id_csr_reg_addr_o),
		.io_csr_reg_data_o(id_csr_reg_data_o),
		
		// ��ͣ����
		.io_stallreq(stallreq_from_id)
	);

	//ͨ�üĴ���Regfile����
	regfile regfile1(
		.clock (clk),
		.io_rst_n (rst_n),
		.io_we	(wb_wreg_i),
		.io_waddr (wb_wd_i),
		.io_wdata (wb_wdata_i),
		.io_re1 (reg1_read),
		.io_raddr1 (reg1_addr),
		.io_rdata1 (reg1_data),
		.io_re2 (reg2_read),
		.io_raddr2 (reg2_addr),
		.io_rdata2 (reg2_data)
	);

	//ID/EX模块
	id_ex id_ex0(
		.clk(clk),
		.rst_n(rst_n),

		.stall(stall),
		.flush(flush),
		
		//从译码阶段ID模块传递的信息
		.id_aluop(id_aluop_o),
		.id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o),
		.id_reg2(id_reg2_o),
		.id_mem_addr(id_mem_addr_o),
		.id_wd(id_wd_o),
		.id_wreg(id_wreg_o),
		.id_link_address(id_link_address_o),
		.id_is_in_delayslot(id_is_in_delayslot_o),
		.id_inst(id_inst_o),
		.id_excepttype(id_excepttype_o),
		.id_current_inst_address(id_current_inst_address_o),
		.id_not_stall(id_not_stall_o),
		.id_csr_reg_we(id_csr_reg_we_o),
		.id_csr_reg_addr(id_csr_reg_addr_o),
		.id_csr_reg_data(id_csr_reg_data_o),

		// 译码阶段要传回去的信息
		.next_inst_in_delayslot_i(next_inst_in_delayslot_o),
		.step_i(step_o),
		
		//传递到执行阶段EX模块的信息
		.ex_aluop(ex_aluop_i),
		.ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i),
		.ex_reg2(ex_reg2_i),
		.ex_mem_addr(ex_mem_addr_i),
		.ex_wd(ex_wd_i),
		.ex_wreg(ex_wreg_i),
		.ex_link_address(ex_link_address_i),
		.ex_is_in_delayslot(ex_is_in_delayslot_i),
		.ex_inst(ex_inst_i),
		.ex_excepttype(ex_excepttype_i),
		.ex_current_inst_address(ex_current_inst_address_i),
		.ex_not_stall(ex_not_stall_i),
		.ex_csr_reg_we(ex_csr_reg_we_i),
		.ex_csr_reg_addr(ex_csr_reg_addr_i),
		.ex_csr_reg_data(ex_csr_reg_data_i),

		// 传回 id 阶段
		.is_in_delayslot_o(is_in_delayslot_i),
		.step_o(step_i)
	);


	//EX模块
	IExecute ex0(
		.io_rst_n(rst_n),
	
		//送到执行阶段EX模块的信息
		.io_aluop_i(ex_aluop_i),
		.io_alusel_i(ex_alusel_i),
		.io_reg1_i(ex_reg1_i),
		.io_reg2_i(ex_reg2_i),
		.io_mem_addr_i(ex_mem_addr_i),
		.io_wd_i(ex_wd_i),
		.io_wreg_i(ex_wreg_i),

		.io_inst_i(ex_inst_i),

		.io_cnt_i(cnt_i),
		.io_div_started_i(div_started_i),

		// 除法模块给的结果
		.io_div_result_rem_i(div_result_rem),
		.io_div_result_div_i(div_result_div),
		.io_div_ready_i(div_ready), 
		
		// 是否在延迟槽中、以及link address
		.io_link_address_i(ex_link_address_i),
		.io_is_in_delayslot_i(ex_is_in_delayslot_i),

		// 新检测出的异常类型
		.io_excepttype_i(ex_excepttype_i),
		.io_current_inst_address_i(ex_current_inst_address_i),
		.io_not_stall_i(ex_not_stall_i),
		.io_csr_reg_we_i(ex_csr_reg_we_i),
		.io_csr_reg_addr_i(ex_csr_reg_addr_i),
		.io_csr_reg_data_i(ex_csr_reg_data_i),
		
		.io_mem_phy_addr_i(ex_mem_phy_addr_i),
		.io_data_tlb_exception_i(ex_data_tlb_exception_i),
		
		//向下一流水级传递，用于写csr中的寄存器
		.io_csr_reg_we_o(ex_csr_reg_we_o),
		.io_csr_reg_addr_o(ex_csr_reg_addr_o),
		.io_csr_reg_data_o(ex_csr_reg_data_o),

		//EX模块的输出到EX/MEM模块信息
		.io_wd_o(ex_wd_o),
		.io_wreg_o(ex_wreg_o),
		.io_wdata_o(ex_wdata_o),

		.io_cnt_o(cnt_o),
		.io_div_started_o(div_started_o),

		// 发送给除法器的请求
		.io_div_opdata1_o(div_opdata1),
		.io_div_opdata2_o(div_opdata2),
		.io_div_start_o(div_start),
		.io_signed_div_o(signed_div),


		//下面新增的几个输出是为加载、存储指令准备的
		.io_aluop_o(ex_aluop_o),
		.io_mem_addr_o(ex_mem_addr_o),
		.io_mem_we_o(ex_mem_we_o),
		.io_mem_ce_o(ex_mem_ce_o),
		.io_reg2_o(ex_reg2_o),

		.io_excepttype_o(ex_excepttype_o),
		.io_is_in_delayslot_o(ex_is_in_delayslot_o),
		.io_current_inst_address_o(ex_current_inst_address_o),
		.io_not_stall_o(ex_not_stall_o),

		.io_mem_phy_addr_o(ex_mem_phy_addr_o),
		.io_data_tlb_r_exception_o(ex_data_tlb_r_exception_o),
		.io_data_tlb_w_exception_o(ex_data_tlb_w_exception_o),

		.io_stallreq(stallreq_from_ex)
	);

/*
	ex ex0(
		.rst_n(rst_n),
	
		//�͵�ִ�н׶�EXģ������Ϣ
		.aluop_i(ex_aluop_i),
		.alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i),
		.reg2_i(ex_reg2_i),
		.mem_addr_i(ex_mem_addr_i),
		.wd_i(ex_wd_i),
		.wreg_i(ex_wreg_i),

		.inst_i(ex_inst_i),

		.cnt_i(cnt_i),
		.div_started_i(div_started_i),

		// ����ģ�����Ľ���
		.div_result_rem_i(div_result_rem),
		.div_result_div_i(div_result_div),
		.div_ready_i(div_ready), 
		
		// �Ƿ����ӳٲ��С��Լ�link address
		.link_address_i(ex_link_address_i),
		.is_in_delayslot_i(ex_is_in_delayslot_i),

		// �¼��������쳣����
		.excepttype_i(ex_excepttype_i),
		.current_inst_address_i(ex_current_inst_address_i),
		.not_stall_i(ex_not_stall_i),
		.csr_reg_we_i(ex_csr_reg_we_i),
		.csr_reg_addr_i(ex_csr_reg_addr_i),
		.csr_reg_data_i(ex_csr_reg_data_i),
		
		.mem_phy_addr_i(ex_mem_phy_addr_i),
		.data_tlb_exception_i(ex_data_tlb_exception_i),
		
		//����һ��ˮ�����ݣ�����дcsr�еļĴ���
		.csr_reg_we_o(ex_csr_reg_we_o),
		.csr_reg_addr_o(ex_csr_reg_addr_o),
		.csr_reg_data_o(ex_csr_reg_data_o),

		//EXģ����������EX/MEMģ����Ϣ
		.wd_o(ex_wd_o),
		.wreg_o(ex_wreg_o),
		.wdata_o(ex_wdata_o),

		.cnt_o(cnt_o),
		.div_started_o(div_started_o),

		// ���͸�������������
		.div_opdata1_o(div_opdata1),
		.div_opdata2_o(div_opdata2),
		.div_start_o(div_start),
		.signed_div_o(signed_div),


		//���������ļ���������Ϊ���ء��洢ָ��׼����
		.aluop_o(ex_aluop_o),
		.mem_addr_o(ex_mem_addr_o),
		.mem_we_o(ex_mem_we_o),
		.mem_ce_o(ex_mem_ce_o),
		.reg2_o(ex_reg2_o),

		.excepttype_o(ex_excepttype_o),
		.is_in_delayslot_o(ex_is_in_delayslot_o),
		.current_inst_address_o(ex_current_inst_address_o),
		.not_stall_o(ex_not_stall_o),

		.mem_phy_addr_o(ex_mem_phy_addr_o),
		.data_tlb_r_exception_o(ex_data_tlb_r_exception_o),
		.data_tlb_w_exception_o(ex_data_tlb_w_exception_o),

		.stallreq(stallreq_from_ex)
	);
*/
	//EX/MEMģ��
	ex_mem ex_mem0(
		.clk(clk),
		.rst_n(rst_n),

		.stall(stall),
		.flush(flush),

		//���ִ�н׶�EXģ������Ϣ	
		.ex_wd(ex_wd_o),
		.ex_wreg(ex_wreg_o),
		.ex_wdata(ex_wdata_o),
		.ex_aluop(ex_aluop_o),
		.ex_mem_addr(ex_mem_addr_o),
		.ex_reg2(ex_reg2_o),
		.ex_csr_reg_we(ex_csr_reg_we_o),
		.ex_csr_reg_addr(ex_csr_reg_addr_o),
		.ex_csr_reg_data(ex_csr_reg_data_o),
		.ex_excepttype(ex_excepttype_o),
		.ex_is_in_delayslot(ex_is_in_delayslot_o),
		.ex_current_inst_address(ex_current_inst_address_o),
		.ex_not_stall(ex_not_stall_o),
		.ex_mem_phy_addr(ex_mem_phy_addr_o),
		.ex_data_tlb_r_exception(ex_data_tlb_r_exception_o),
		.ex_data_tlb_w_exception(ex_data_tlb_w_exception_o),

		.cnt_i(cnt_o),
		.div_started_i(div_started_o),


		//�͵��ô��׶�MEMģ������Ϣ
		.mem_wd(mem_wd_i),
		.mem_wreg(mem_wreg_i),
		.mem_wdata(mem_wdata_i),
		.mem_aluop(mem_aluop_i),
		.mem_mem_addr(mem_mem_addr_i),
		.mem_reg2(mem_reg2_i),
		.mem_csr_reg_we(mem_csr_reg_we_i),
		.mem_csr_reg_addr(mem_csr_reg_addr_i),
		.mem_csr_reg_data(mem_csr_reg_data_i),

		.mem_excepttype(mem_excepttype_i),
		.mem_is_in_delayslot(mem_is_in_delayslot_i),
		.mem_current_inst_address(mem_current_inst_address_i),
		.mem_not_stall(mem_not_stall_i),

		.mem_mem_phy_addr(mem_mem_phy_addr_i),
		.mem_data_tlb_r_exception(mem_data_tlb_r_exception_i),
		.mem_data_tlb_w_exception(mem_data_tlb_w_exception_i),

		.cnt_o(cnt_i),
		.div_started_o(div_started_i)
	);

	// RAM ������ַ
	wire[`PhyAddrBus] ram_phy_addr_o;

	//������ݴ洢�� data_ram ̓�M��ַ
	wire[`RegBus] ram_data_i;
	wire[`RegBus] ram_addr_o;
	wire[`RegBus] ram_data_o;
	wire ram_we_o;
	wire[`RegSel] ram_sel_o;
	wire ram_ce_o;


	//MEM模块例化

	IMemory mem0(
		.io_rst_n(rst_n),

		.io_mem_phy_addr_i(mem_mem_phy_addr_i),
		.io_data_tlb_r_exception_i(mem_data_tlb_r_exception_i),
		.io_data_tlb_w_exception_i(mem_data_tlb_w_exception_i),
	
		//来自EX/MEM模块的信息	
		.io_wd_i(mem_wd_i),
		.io_wreg_i(mem_wreg_i),
		.io_wdata_i(mem_wdata_i),
		.io_aluop_i(mem_aluop_i),
		.io_mem_addr_i(mem_mem_addr_i),
		.io_reg2_i(mem_reg2_i),

		.io_csr_reg_we_i(`CSRWriteDisable),
		.io_csr_reg_addr_i(`ZeroWord),
		.io_csr_reg_data_i(`ZeroWord),

		.io_excepttype_i(mem_excepttype_i),
		.io_is_in_delayslot_i(mem_is_in_delayslot_i),
		.io_current_inst_address_i(mem_current_inst_address_i),
		.io_not_stall_i(mem_not_stall_i),
		
		//来自memory的信息
		.io_mem_data_i(ram_data_i),

		//LLbit_i是LLbit寄存器的值
		//但不一定是最新值，回写阶段可能要写LLbit，所以还要进一步判断
		// 回写阶段如果要写llbit, 则 llbit_o 会马上变化，提前一周期传过去，起到了类似于数据旁路的作用
		.io_LLbit_i(LLbit_o),
		.io_LLbit_addr_i(LLbit_addr_o),

		.io_stallreq_from_mem_i(stallreq_from_dwishbone),
		.io_cnt_i(mem_cnt_i),
		.io_original_data_i(mem_original_data_i),

		//送到MEM/WB模块的信息
		.io_wd_o(mem_wd_o),
		.io_wreg_o(mem_wreg_o),
		.io_wdata_o(mem_wdata_o),
		// LLbit 的输出
		.io_LLbit_we_o(mem_LLbit_we_o),
		.io_LLbit_value_o(mem_LLbit_value_o),
		.io_LLbit_addr_o(mem_LLbit_addr_o),

		.io_stallreq(stallreq_from_mem),
		.io_cnt_o(mem_cnt_o),
		.io_original_data_o(mem_original_data_o),

		.io_csr_reg_we_o(mem_csr_reg_we_o),
		.io_csr_reg_addr_o(mem_csr_reg_addr_o),
		.io_csr_reg_data_o(mem_csr_reg_data_o),
		
		// 最终确认的异常类型
		.io_excepttype_o(mem_excepttype_o),
		.io_is_in_delayslot_o(mem_is_in_delayslot_o),
		// 当前指令的地址
		.io_current_inst_address_o(mem_current_inst_address_o),
		.io_current_data_address_o(mem_current_data_address_o),
		.io_not_stall_o(mem_not_stall_o),

		
		// 最新的 EPC 值
		//.csr_epc_o(),
		
	
		//送到memory的信息
		.io_mem_addr_o(ram_addr_o),
		.io_mem_phy_addr_o(ram_phy_addr_o),
		.io_mem_we_o(ram_we_o),
		.io_mem_sel_o(ram_sel_o),
		.io_mem_data_o(ram_data_o),
		.io_mem_ce_o(ram_ce_o)
	);



/*	
	//MEM模块例化

	mem mem0(
		.rst_n(rst_n),

		.mem_phy_addr_i(mem_mem_phy_addr_i),
		.data_tlb_r_exception_i(mem_data_tlb_r_exception_i),
		.data_tlb_w_exception_i(mem_data_tlb_w_exception_i),
	
		//来自EX/MEM模块的信息	
		.wd_i(mem_wd_i),
		.wreg_i(mem_wreg_i),
		.wdata_i(mem_wdata_i),
		.aluop_i(mem_aluop_i),
		.mem_addr_i(mem_mem_addr_i),
		.reg2_i(mem_reg2_i),

		.csr_reg_we_i(`CSRWriteDisable),
		.csr_reg_addr_i(`ZeroWord),
		.csr_reg_data_i(`ZeroWord),

		.excepttype_i(mem_excepttype_i),
		.is_in_delayslot_i(mem_is_in_delayslot_i),
		.current_inst_address_i(mem_current_inst_address_i),
		.not_stall_i(mem_not_stall_i),
		
		//来自memory的信息
		.mem_data_i(ram_data_i),

		//LLbit_i是LLbit寄存器的值
		//但不一定是最新值，回写阶段可能要写LLbit，所以还要进一步判断
		// 回写阶段如果要写llbit, 则 llbit_o 会马上变化，提前一周期传过去，起到了类似于数据旁路的作用
		.LLbit_i(LLbit_o),
		.LLbit_addr_i(LLbit_addr_o),

		.stallreq_from_mem_i(stallreq_from_dwishbone),
		.cnt_i(mem_cnt_i),
		.original_data_i(mem_original_data_i),

		//送到MEM/WB模块的信息
		.wd_o(mem_wd_o),
		.wreg_o(mem_wreg_o),
		.wdata_o(mem_wdata_o),
		// LLbit 的输出
		.LLbit_we_o(mem_LLbit_we_o),
		.LLbit_value_o(mem_LLbit_value_o),
		.LLbit_addr_o(mem_LLbit_addr_o),

		.stallreq(stallreq_from_mem),
		.cnt_o(mem_cnt_o),
		.original_data_o(mem_original_data_o),

		.csr_reg_we_o(mem_csr_reg_we_o),
		.csr_reg_addr_o(mem_csr_reg_addr_o),
		.csr_reg_data_o(mem_csr_reg_data_o),
		
		// 最终确认的异常类型
		.excepttype_o(mem_excepttype_o),
		.is_in_delayslot_o(mem_is_in_delayslot_o),
		// 当前指令的地址
		.current_inst_address_o(mem_current_inst_address_o),
		.current_data_address_o(mem_current_data_address_o),
		.not_stall_o(mem_not_stall_o),

		
		// 最新的 EPC 值
		//.csr_epc_o(),
		
	
		//送到memory的信息
		.mem_addr_o(ram_addr_o),
		.mem_phy_addr_o(ram_phy_addr_o),
		.mem_we_o(ram_we_o),
		.mem_sel_o(ram_sel_o),
		.mem_data_o(ram_data_o),
		.mem_ce_o(ram_ce_o)
	);
*/
	
	//MEM/WBģ��
	mem_wb mem_wb0(
		.clk(clk),
		.rst_n(rst_n),
		.stall(stall),
		.flush(flush),

		//��Էô��׶�MEMģ������Ϣ	
		.mem_wd(mem_wd_o),
		.mem_wreg(mem_wreg_o),
		.mem_wdata(mem_wdata_o),
		.mem_LLbit_we(mem_LLbit_we_o),
		.mem_LLbit_addr(mem_LLbit_addr_o),
		.mem_LLbit_value(mem_LLbit_value_o),
		.mem_csr_reg_we(mem_csr_reg_we_o),
		.mem_csr_reg_addr(mem_csr_reg_addr_o),
		.mem_csr_reg_data(mem_csr_reg_data_o),

		.mem_cnt_i(mem_cnt_o),
		.mem_original_data_i(mem_original_data_o),
	
		//�͵���д�׶ε���Ϣ
		.wb_wd(wb_wd_i),
		.wb_wreg(wb_wreg_i),
		.wb_wdata(wb_wdata_i),
		.wb_LLbit_we(wb_LLbit_we_i),
		.wb_LLbit_addr(wb_LLbit_addr_i),
		.wb_LLbit_value(wb_LLbit_value_i),
		.wb_csr_reg_we(wb_csr_reg_we_i),
		.wb_csr_reg_addr(wb_csr_reg_addr_i),
		.wb_csr_reg_data(wb_csr_reg_data_i),

		// send back to mem
		.mem_cnt_o(mem_cnt_i),
		.mem_original_data_o(mem_original_data_i)
	);

	ControlUnit ctrl0(
		.io_rst_n(rst_n),

		.io_flushreq_from_csr(flushreq_from_csr),

		//���ȡַ�׶ε���ͣ����
		.io_stallreq_from_if(stallreq_from_if),
		
		//���ִ����������ͣ����
		.io_stallreq_from_id(stallreq_from_id),
		
		//���ִ�н׶ε���ͣ����
		.io_stallreq_from_ex(stallreq_from_ex),
		
		//��Էô��׶ε���ͣ����
		.io_stallreq_from_mem(stallreq_from_mem),

		//��Ի�д�׶ε���ͣ����
		.io_stallreq_from_wb(`NoStop),

		.io_flush(flush),
		.io_stall(stall)
	);

	
	div div0(
		.clk(clk),
		.rst_n(rst_n),
	
		.signed_div_i(signed_div),
		.opdata1_i(div_opdata1),
		.opdata2_i(div_opdata2),
		.start_i(div_start),
		.annul_i(flush),
	
		.rem_o(div_result_rem),
		.div_o(div_result_div),
		.ready_o(div_ready)
	);


	llbit_reg LLbit_reg0(
		.io_clk(clk),
		.io_rst_n(rst_n),
		.io_flush(flush),
		
		//д�˿�
		.io_we_i(wb_LLbit_we_i),
		.io_LLbit_i(wb_LLbit_value_i),
		.io_LLbit_addr_i(wb_LLbit_addr_i),
		
		//��˿�1
		.io_LLbit_o(LLbit_o),
		.io_LLbit_addr_o(LLbit_addr_o)
	);

/*
	LLbit_reg LLbit_reg0(
		.clk(clk),
		.rst_n(rst_n),
		.flush(flush),
		
		//д�˿�
		.we_i(wb_LLbit_we_i),
		.LLbit_i(wb_LLbit_value_i),
		.LLbit_addr_i(wb_LLbit_addr_i),
		
		//��˿�1
		.LLbit_o(LLbit_o),
		.LLbit_addr_o(LLbit_addr_o)
	);
*/	
		CSR csr0(
		.io_clk(clk),
		.io_rst_n(rst_n),
		
		.io_we_i(mem_csr_reg_we_i),
		.io_waddr_i(mem_csr_reg_addr_i),
		.io_data_i(mem_csr_reg_data_i),

		.io_re_i(id_csr_reg_re_o),
		.io_will_write_in_mem_i(id_csr_reg_we_o),
		.io_raddr_i(id_csr_reg_addr_o),
		
		.io_excepttype_i(mem_excepttype_o),
		.io_timer_int_i(timer_int_i),
		.io_software_int_i(software_int_i),
		.io_external_int_i(external_int_i),
		.io_current_inst_addr_i(mem_current_inst_address_o),
		.io_current_data_addr_i(mem_current_data_address_o),
		.io_is_in_delayslot_i(mem_is_in_delayslot_o),
		.io_not_stall_i(mem_not_stall_o),
		
		.io_data_o(csr_data_o),
		.io_protect_o(csr_protect_o),
		
		.io_flushreq(flushreq_from_csr),
		.io_exception_new_pc_o(exception_new_pc),

		.io_prv_o(prv),


		// MMU
		.io_inst_ce_i(pc_ce_o),
		.io_inst_vir_addr_i(pc_next_inst_vir_addr),
		.io_inst_phy_addr_o(pc_next_inst_phy_addr),
		.io_inst_tlb_exception_o(pc_next_inst_tlb_exception),


		.io_data_ce_i(ex_mem_ce_o),
		.io_data_we_i(ex_mem_we_o),
		.io_data_vir_addr_i(ex_mem_addr_o),
		.io_data_phy_addr_o(ex_mem_phy_addr_i),
		.io_data_tlb_exception_o(ex_data_tlb_exception_i)
	);

/*	
	csr csr0(
		.clk(clk),
		.rst_n(rst_n),
		
		.we_i(mem_csr_reg_we_i),
		.waddr_i(mem_csr_reg_addr_i),
		.data_i(mem_csr_reg_data_i),

		.re_i(id_csr_reg_re_o),
		.will_write_in_mem_i(id_csr_reg_we_o),
		.raddr_i(id_csr_reg_addr_o),
		
		.excepttype_i(mem_excepttype_o),
		.timer_int_i(timer_int_i),
		.software_int_i(software_int_i),
		.external_int_i(external_int_i),
		.current_inst_addr_i(mem_current_inst_address_o),
		.current_data_addr_i(mem_current_data_address_o),
		.is_in_delayslot_i(mem_is_in_delayslot_o),
		.not_stall_i(mem_not_stall_o),
		
		.data_o(csr_data_o),
		.protect_o(csr_protect_o),
		
		.flushreq(flushreq_from_csr),
		.exception_new_pc_o(exception_new_pc),

		.prv_o(prv),


		// MMU
		.inst_ce_i(pc_ce_o),
		.inst_vir_addr_i(pc_next_inst_vir_addr),
		.inst_phy_addr_o(pc_next_inst_phy_addr),
		.inst_tlb_exception_o(pc_next_inst_tlb_exception),


		.data_ce_i(ex_mem_ce_o),
		.data_we_i(ex_mem_we_o),
		.data_vir_addr_i(ex_mem_addr_o),
		.data_phy_addr_o(ex_mem_phy_addr_i),
		.data_tlb_exception_o(ex_data_tlb_exception_i)
	);
*/

	wishbone_bus_if #(.delay(1), .cyc_len_log_2(1)) dwishbone_bus_if(
		.cpu_clk(clk),
		.wishbone_clk(wishbone_clk),

		.rst_n(rst_n),
	
		// ctrl
		.stall_i(stall),
		.stall_this_i(stall[4]),
		.flush_i(flush),
	
		// CPU
		.cpu_ce_i(ram_ce_o & (~(|mem_excepttype_o))),
		.cpu_data_i(ram_data_o),
		.cpu_addr_i(ram_phy_addr_o),
		.cpu_we_i(ram_we_o),
		.cpu_sel_i(ram_sel_o),
		.cpu_data_o(ram_data_i),


		// Wishbone 
		.wishbone_data_i(dwishbone_data_i),
		.wishbone_ack_i(dwishbone_ack_i),
		.wishbone_addr_o(dwishbone_addr_o),
		.wishbone_data_o(dwishbone_data_o),
		.wishbone_we_o(dwishbone_we_o),
		.wishbone_sel_o(dwishbone_sel_o),
		.wishbone_stb_o(dwishbone_stb_o),
		.wishbone_cyc_o(dwishbone_cyc_o),

		.stallreq(stallreq_from_dwishbone)
	
	);

	wire[31:0] useless;

	wishbone_bus_if #(.delay(0)) iwishbone_bus_if(
		.cpu_clk(clk),
		.wishbone_clk(wishbone_clk),

		.rst_n(rst_n),
	
		// ctrl
		.stall_i(stall),
		.stall_this_i(stall[1]),
		.flush_i(flush),
	
		// CPU
		.cpu_ce_i(if_inst_ce_o & (~(|if_excepttype_i))),
`ifdef RV32
		.cpu_data_i(`ZeroWord),
`else
		.cpu_data_i({`ZeroWord, `ZeroWord}),
`endif
		.cpu_addr_i(if_inst_phy_addr_i),
		.cpu_we_i(`WriteDisable),
`ifdef RV32
		.cpu_sel_i(4'b1111),
		.cpu_data_o(if_inst_o),
`else
		.cpu_sel_i(8'b0000_1111),
		.cpu_data_o({useless, if_inst_o}),
`endif

		// Wishbone 
		.wishbone_data_i(iwishbone_data_i),
		.wishbone_ack_i(iwishbone_ack_i),
		.wishbone_addr_o(iwishbone_addr_o),
		.wishbone_data_o(iwishbone_data_o),
		.wishbone_we_o(iwishbone_we_o),
		.wishbone_sel_o(iwishbone_sel_o),
		.wishbone_stb_o(iwishbone_stb_o),
		.wishbone_cyc_o(iwishbone_cyc_o),

		.stallreq(stallreq_from_if)
	);
endmodule
