//Top Level Module

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fm_receiver_hls,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.457000,HLS_SYN_LAT=1358,HLS_SYN_TPT=none,HLS_SYN_MEM=8,HLS_SYN_DSP=6,HLS_SYN_FF=1491,HLS_SYN_LUT=1309,HLS_VERSION=2018_2}" *)

module fm_receiver_hls (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        iq_in_V_TDATA,
        iq_in_V_TVALID,
        iq_in_V_TREADY,
        audio_out_V_TDATA,
        audio_out_V_TVALID,
        audio_out_V_TREADY,
        led_out_V,
        s_axi_API_AWVALID,
        s_axi_API_AWREADY,
        s_axi_API_AWADDR,
        s_axi_API_WVALID,
        s_axi_API_WREADY,
        s_axi_API_WDATA,
        s_axi_API_WSTRB,
        s_axi_API_ARVALID,
        s_axi_API_ARREADY,
        s_axi_API_ARADDR,
        s_axi_API_RVALID,
        s_axi_API_RREADY,
        s_axi_API_RDATA,
        s_axi_API_RRESP,
        s_axi_API_BVALID,
        s_axi_API_BREADY,
        s_axi_API_BRESP
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_state3 = 4'd4;
parameter    ap_ST_fsm_state4 = 4'd8;
parameter    C_S_AXI_API_DATA_WIDTH = 32;
parameter    C_S_AXI_API_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_API_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] iq_in_V_TDATA;
input   iq_in_V_TVALID;
output   iq_in_V_TREADY;
output  [31:0] audio_out_V_TDATA;
output   audio_out_V_TVALID;
input   audio_out_V_TREADY;
output  [3:0] led_out_V;
input   s_axi_API_AWVALID;
output   s_axi_API_AWREADY;
input  [C_S_AXI_API_ADDR_WIDTH - 1:0] s_axi_API_AWADDR;
input   s_axi_API_WVALID;
output   s_axi_API_WREADY;
input  [C_S_AXI_API_DATA_WIDTH - 1:0] s_axi_API_WDATA;
input  [C_S_AXI_API_WSTRB_WIDTH - 1:0] s_axi_API_WSTRB;
input   s_axi_API_ARVALID;
output   s_axi_API_ARREADY;
input  [C_S_AXI_API_ADDR_WIDTH - 1:0] s_axi_API_ARADDR;
output   s_axi_API_RVALID;
input   s_axi_API_RREADY;
output  [C_S_AXI_API_DATA_WIDTH - 1:0] s_axi_API_RDATA;
output  [1:0] s_axi_API_RRESP;
output   s_axi_API_BVALID;
input   s_axi_API_BREADY;
output  [1:0] s_axi_API_BRESP;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[3:0] led_out_V;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] iq_in_V_0_data_out;
wire    iq_in_V_0_vld_in;
wire    iq_in_V_0_vld_out;
wire    iq_in_V_0_ack_in;
reg    iq_in_V_0_ack_out;
reg   [31:0] iq_in_V_0_payload_A;
reg   [31:0] iq_in_V_0_payload_B;
reg    iq_in_V_0_sel_rd;
reg    iq_in_V_0_sel_wr;
wire    iq_in_V_0_sel;
wire    iq_in_V_0_load_A;
wire    iq_in_V_0_load_B;
reg   [1:0] iq_in_V_0_state;
wire    iq_in_V_0_state_cmp_full;
reg   [31:0] audio_out_V_1_data_in;
reg   [31:0] audio_out_V_1_data_out;
reg    audio_out_V_1_vld_in;
wire    audio_out_V_1_vld_out;
wire    audio_out_V_1_ack_in;
wire    audio_out_V_1_ack_out;
reg   [31:0] audio_out_V_1_payload_A;
reg   [31:0] audio_out_V_1_payload_B;
reg    audio_out_V_1_sel_rd;
reg    audio_out_V_1_sel_wr;
wire    audio_out_V_1_sel;
wire    audio_out_V_1_load_A;
wire    audio_out_V_1_load_B;
reg   [1:0] audio_out_V_1_state;
wire    audio_out_V_1_state_cmp_full;
wire   [3:0] config_led_ctrl_V;
wire   [7:0] config_enable_fm_radio_ip;
reg   [31:0] status_git_hash_V;
reg   [47:0] status_build_time_V;
reg   [0:0] toggle;
reg    iq_in_V_TDATA_blk_n;
wire    ap_CS_fsm_state2;
reg    audio_out_V_TDATA_blk_n;
wire    ap_CS_fsm_state3;
reg   [0:0] tmp_reg_377;
wire    ap_CS_fsm_state4;
wire   [0:0] tmp_fu_354_p2;
wire   [31:0] tmp5_fu_368_p3;
wire    grp_fm_receiver_fu_221_ap_idle;
wire    grp_fm_receiver_fu_221_ap_ready;
wire    grp_fm_receiver_fu_221_ap_done;
wire    grp_fm_receiver_fu_221_ap_start;
wire    grp_fm_receiver_fu_221_iq_in_V_TVALID;
wire    grp_fm_receiver_fu_221_iq_in_V_TREADY;
wire   [15:0] grp_fm_receiver_fu_221_ap_return_0;
wire   [15:0] grp_fm_receiver_fu_221_ap_return_1;
reg    grp_fm_receiver_fu_221_ap_start_reg;
wire   [0:0] toggle_assign_fu_331_p2;
reg   [31:0] status_git_hash_V_preg;
reg   [47:0] status_build_time_V_preg;
reg   [3:0] p_s_fu_343_p4;
reg   [3:0] led_out_V_preg;
reg    ap_block_state3_io;
reg   [3:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 iq_in_V_0_sel_rd = 1'b0;
#0 iq_in_V_0_sel_wr = 1'b0;
#0 iq_in_V_0_state = 2'd0;
#0 audio_out_V_1_sel_rd = 1'b0;
#0 audio_out_V_1_sel_wr = 1'b0;
#0 audio_out_V_1_state = 2'd0;
#0 toggle = 1'd0;
#0 grp_fm_receiver_fu_221_ap_start_reg = 1'b0;
#0 status_git_hash_V_preg = 32'd0;
#0 status_build_time_V_preg = 48'd0;
#0 led_out_V_preg = 4'd0;
end

fm_receiver_hls_API_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_API_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_API_DATA_WIDTH ))
fm_receiver_hls_API_s_axi_U(
    .AWVALID(s_axi_API_AWVALID),
    .AWREADY(s_axi_API_AWREADY),
    .AWADDR(s_axi_API_AWADDR),
    .WVALID(s_axi_API_WVALID),
    .WREADY(s_axi_API_WREADY),
    .WDATA(s_axi_API_WDATA),
    .WSTRB(s_axi_API_WSTRB),
    .ARVALID(s_axi_API_ARVALID),
    .ARREADY(s_axi_API_ARREADY),
    .ARADDR(s_axi_API_ARADDR),
    .RVALID(s_axi_API_RVALID),
    .RREADY(s_axi_API_RREADY),
    .RDATA(s_axi_API_RDATA),
    .RRESP(s_axi_API_RRESP),
    .BVALID(s_axi_API_BVALID),
    .BREADY(s_axi_API_BREADY),
    .BRESP(s_axi_API_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .config_led_ctrl_V(config_led_ctrl_V),
    .config_enable_fm_radio_ip(config_enable_fm_radio_ip),
    .status_git_hash_V(status_git_hash_V),
    .status_build_time_V(status_build_time_V)
);

fm_receiver grp_fm_receiver_fu_221(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_fm_receiver_fu_221_ap_start),
    .ap_done(grp_fm_receiver_fu_221_ap_done),
    .ap_idle(grp_fm_receiver_fu_221_ap_idle),
    .ap_ready(grp_fm_receiver_fu_221_ap_ready),
    .iq_in_V_TDATA(iq_in_V_0_data_out),
    .iq_in_V_TVALID(grp_fm_receiver_fu_221_iq_in_V_TVALID),
    .iq_in_V_TREADY(grp_fm_receiver_fu_221_iq_in_V_TREADY),
    .ap_return_0(grp_fm_receiver_fu_221_ap_return_0),
    .ap_return_1(grp_fm_receiver_fu_221_ap_return_1)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        audio_out_V_1_sel_rd <= 1'b0;
    end else begin
        if (((audio_out_V_1_ack_out == 1'b1) & (audio_out_V_1_vld_out == 1'b1))) begin
            audio_out_V_1_sel_rd <= ~audio_out_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        audio_out_V_1_sel_wr <= 1'b0;
    end else begin
        if (((audio_out_V_1_vld_in == 1'b1) & (audio_out_V_1_ack_in == 1'b1))) begin
            audio_out_V_1_sel_wr <= ~audio_out_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        audio_out_V_1_state <= 2'd0;
    end else begin
        if ((((audio_out_V_1_state == 2'd2) & (audio_out_V_1_vld_in == 1'b0)) | ((audio_out_V_1_state == 2'd3) & (audio_out_V_1_vld_in == 1'b0) & (audio_out_V_1_ack_out == 1'b1)))) begin
            audio_out_V_1_state <= 2'd2;
        end else if ((((audio_out_V_1_state == 2'd1) & (audio_out_V_1_ack_out == 1'b0)) | ((audio_out_V_1_state == 2'd3) & (audio_out_V_1_ack_out == 1'b0) & (audio_out_V_1_vld_in == 1'b1)))) begin
            audio_out_V_1_state <= 2'd1;
        end else if (((~((audio_out_V_1_vld_in == 1'b0) & (audio_out_V_1_ack_out == 1'b1)) & ~((audio_out_V_1_ack_out == 1'b0) & (audio_out_V_1_vld_in == 1'b1)) & (audio_out_V_1_state == 2'd3)) | ((audio_out_V_1_state == 2'd1) & (audio_out_V_1_ack_out == 1'b1)) | ((audio_out_V_1_state == 2'd2) & (audio_out_V_1_vld_in == 1'b1)))) begin
            audio_out_V_1_state <= 2'd3;
        end else begin
            audio_out_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_fm_receiver_fu_221_ap_start_reg <= 1'b0;
    end else begin
        if (((tmp_fu_354_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            grp_fm_receiver_fu_221_ap_start_reg <= 1'b1;
        end else if ((grp_fm_receiver_fu_221_ap_ready == 1'b1)) begin
            grp_fm_receiver_fu_221_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        iq_in_V_0_sel_rd <= 1'b0;
    end else begin
        if (((iq_in_V_0_ack_out == 1'b1) & (iq_in_V_0_vld_out == 1'b1))) begin
            iq_in_V_0_sel_rd <= ~iq_in_V_0_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        iq_in_V_0_sel_wr <= 1'b0;
    end else begin
        if (((iq_in_V_0_ack_in == 1'b1) & (iq_in_V_0_vld_in == 1'b1))) begin
            iq_in_V_0_sel_wr <= ~iq_in_V_0_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        iq_in_V_0_state <= 2'd0;
    end else begin
        if ((((iq_in_V_0_state == 2'd2) & (iq_in_V_0_vld_in == 1'b0)) | ((iq_in_V_0_state == 2'd3) & (iq_in_V_0_vld_in == 1'b0) & (iq_in_V_0_ack_out == 1'b1)))) begin
            iq_in_V_0_state <= 2'd2;
        end else if ((((iq_in_V_0_state == 2'd1) & (iq_in_V_0_ack_out == 1'b0)) | ((iq_in_V_0_state == 2'd3) & (iq_in_V_0_ack_out == 1'b0) & (iq_in_V_0_vld_in == 1'b1)))) begin
            iq_in_V_0_state <= 2'd1;
        end else if (((~((iq_in_V_0_vld_in == 1'b0) & (iq_in_V_0_ack_out == 1'b1)) & ~((iq_in_V_0_ack_out == 1'b0) & (iq_in_V_0_vld_in == 1'b1)) & (iq_in_V_0_state == 2'd3)) | ((iq_in_V_0_state == 2'd1) & (iq_in_V_0_ack_out == 1'b1)) | ((iq_in_V_0_state == 2'd2) & (iq_in_V_0_vld_in == 1'b1)))) begin
            iq_in_V_0_state <= 2'd3;
        end else begin
            iq_in_V_0_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        led_out_V_preg <= 4'd0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            led_out_V_preg <= p_s_fu_343_p4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
                status_build_time_V_preg[0] <= 1'b0;
        status_build_time_V_preg[2] <= 1'b0;
        status_build_time_V_preg[4] <= 1'b0;
        status_build_time_V_preg[5] <= 1'b0;
        status_build_time_V_preg[9] <= 1'b0;
        status_build_time_V_preg[10] <= 1'b0;
        status_build_time_V_preg[16] <= 1'b0;
        status_build_time_V_preg[21] <= 1'b0;
        status_build_time_V_preg[24] <= 1'b0;
        status_build_time_V_preg[27] <= 1'b0;
        status_build_time_V_preg[29] <= 1'b0;
        status_build_time_V_preg[33] <= 1'b0;
        status_build_time_V_preg[34] <= 1'b0;
        status_build_time_V_preg[40] <= 1'b0;
        status_build_time_V_preg[45] <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                        status_build_time_V_preg[0] <= 1'b1;
            status_build_time_V_preg[2] <= 1'b1;
            status_build_time_V_preg[4] <= 1'b1;
            status_build_time_V_preg[5] <= 1'b1;
            status_build_time_V_preg[9] <= 1'b1;
            status_build_time_V_preg[10] <= 1'b1;
            status_build_time_V_preg[16] <= 1'b1;
            status_build_time_V_preg[21] <= 1'b1;
            status_build_time_V_preg[24] <= 1'b1;
            status_build_time_V_preg[27] <= 1'b1;
            status_build_time_V_preg[29] <= 1'b1;
            status_build_time_V_preg[33] <= 1'b1;
            status_build_time_V_preg[34] <= 1'b1;
            status_build_time_V_preg[40] <= 1'b1;
            status_build_time_V_preg[45] <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
                status_git_hash_V_preg[0] <= 1'b0;
        status_git_hash_V_preg[1] <= 1'b0;
        status_git_hash_V_preg[4] <= 1'b0;
        status_git_hash_V_preg[6] <= 1'b0;
        status_git_hash_V_preg[7] <= 1'b0;
        status_git_hash_V_preg[8] <= 1'b0;
        status_git_hash_V_preg[10] <= 1'b0;
        status_git_hash_V_preg[11] <= 1'b0;
        status_git_hash_V_preg[13] <= 1'b0;
        status_git_hash_V_preg[16] <= 1'b0;
        status_git_hash_V_preg[20] <= 1'b0;
        status_git_hash_V_preg[21] <= 1'b0;
        status_git_hash_V_preg[22] <= 1'b0;
        status_git_hash_V_preg[23] <= 1'b0;
        status_git_hash_V_preg[25] <= 1'b0;
        status_git_hash_V_preg[28] <= 1'b0;
        status_git_hash_V_preg[29] <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                        status_git_hash_V_preg[0] <= 1'b1;
            status_git_hash_V_preg[1] <= 1'b1;
            status_git_hash_V_preg[4] <= 1'b1;
            status_git_hash_V_preg[6] <= 1'b1;
            status_git_hash_V_preg[7] <= 1'b1;
            status_git_hash_V_preg[8] <= 1'b1;
            status_git_hash_V_preg[10] <= 1'b1;
            status_git_hash_V_preg[11] <= 1'b1;
            status_git_hash_V_preg[13] <= 1'b1;
            status_git_hash_V_preg[16] <= 1'b1;
            status_git_hash_V_preg[20] <= 1'b1;
            status_git_hash_V_preg[21] <= 1'b1;
            status_git_hash_V_preg[22] <= 1'b1;
            status_git_hash_V_preg[23] <= 1'b1;
            status_git_hash_V_preg[25] <= 1'b1;
            status_git_hash_V_preg[28] <= 1'b1;
            status_git_hash_V_preg[29] <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((audio_out_V_1_load_A == 1'b1)) begin
        audio_out_V_1_payload_A <= audio_out_V_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((audio_out_V_1_load_B == 1'b1)) begin
        audio_out_V_1_payload_B <= audio_out_V_1_data_in;
    end
end

always @ (posedge ap_clk) begin
    if ((iq_in_V_0_load_A == 1'b1)) begin
        iq_in_V_0_payload_A <= iq_in_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if ((iq_in_V_0_load_B == 1'b1)) begin
        iq_in_V_0_payload_B <= iq_in_V_TDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        tmp_reg_377 <= tmp_fu_354_p2;
        toggle <= toggle_assign_fu_331_p2;
    end
end

always @ (*) begin
    if ((~((audio_out_V_1_ack_in == 1'b0) | (1'b1 == ap_block_state3_io)) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((audio_out_V_1_ack_in == 1'b0) | (1'b1 == ap_block_state3_io)) & (1'b1 == ap_CS_fsm_state3))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((grp_fm_receiver_fu_221_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
        audio_out_V_1_data_in = tmp5_fu_368_p3;
    end else if (((iq_in_V_0_vld_out == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        audio_out_V_1_data_in = iq_in_V_0_data_out;
    end else begin
        audio_out_V_1_data_in = 'bx;
    end
end

always @ (*) begin
    if ((audio_out_V_1_sel == 1'b1)) begin
        audio_out_V_1_data_out = audio_out_V_1_payload_B;
    end else begin
        audio_out_V_1_data_out = audio_out_V_1_payload_A;
    end
end

always @ (*) begin
    if (((~((grp_fm_receiver_fu_221_ap_done == 1'b0) | (audio_out_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state4)) | (~((iq_in_V_0_vld_out == 1'b0) | (audio_out_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state2)))) begin
        audio_out_V_1_vld_in = 1'b1;
    end else begin
        audio_out_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state2) | ((tmp_reg_377 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_reg_377 == 1'd1) & (1'b1 == ap_CS_fsm_state3)))) begin
        audio_out_V_TDATA_blk_n = audio_out_V_1_state[1'd1];
    end else begin
        audio_out_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((iq_in_V_0_vld_out == 1'b0) | (audio_out_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
        iq_in_V_0_ack_out = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        iq_in_V_0_ack_out = grp_fm_receiver_fu_221_iq_in_V_TREADY;
    end else begin
        iq_in_V_0_ack_out = 1'b0;
    end
end

always @ (*) begin
    if ((iq_in_V_0_sel == 1'b1)) begin
        iq_in_V_0_data_out = iq_in_V_0_payload_B;
    end else begin
        iq_in_V_0_data_out = iq_in_V_0_payload_A;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        iq_in_V_TDATA_blk_n = iq_in_V_0_state[1'd0];
    end else begin
        iq_in_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        led_out_V = p_s_fu_343_p4;
    end else begin
        led_out_V = led_out_V_preg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        status_build_time_V = 48'd36310343550517;
    end else begin
        status_build_time_V = status_build_time_V_preg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        status_git_hash_V = 32'd854666707;
    end else begin
        status_git_hash_V = status_git_hash_V_preg;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((tmp_fu_354_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else if (((tmp_fu_354_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if ((~((iq_in_V_0_vld_out == 1'b0) | (audio_out_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((audio_out_V_1_ack_in == 1'b0) | (1'b1 == ap_block_state3_io)) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((grp_fm_receiver_fu_221_ap_done == 1'b0) | (audio_out_V_1_ack_in == 1'b0)) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

always @ (*) begin
    ap_block_state3_io = (((tmp_reg_377 == 1'd0) & (audio_out_V_1_ack_in == 1'b0)) | ((tmp_reg_377 == 1'd1) & (audio_out_V_1_ack_in == 1'b0)));
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign audio_out_V_1_ack_in = audio_out_V_1_state[1'd1];

assign audio_out_V_1_ack_out = audio_out_V_TREADY;

assign audio_out_V_1_load_A = (~audio_out_V_1_sel_wr & audio_out_V_1_state_cmp_full);

assign audio_out_V_1_load_B = (audio_out_V_1_state_cmp_full & audio_out_V_1_sel_wr);

assign audio_out_V_1_sel = audio_out_V_1_sel_rd;

assign audio_out_V_1_state_cmp_full = ((audio_out_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign audio_out_V_1_vld_out = audio_out_V_1_state[1'd0];

assign audio_out_V_TDATA = audio_out_V_1_data_out;

assign audio_out_V_TVALID = audio_out_V_1_state[1'd0];

assign grp_fm_receiver_fu_221_ap_start = grp_fm_receiver_fu_221_ap_start_reg;

assign grp_fm_receiver_fu_221_iq_in_V_TVALID = iq_in_V_0_state[1'd0];

assign iq_in_V_0_ack_in = iq_in_V_0_state[1'd1];

assign iq_in_V_0_load_A = (iq_in_V_0_state_cmp_full & ~iq_in_V_0_sel_wr);

assign iq_in_V_0_load_B = (iq_in_V_0_state_cmp_full & iq_in_V_0_sel_wr);

assign iq_in_V_0_sel = iq_in_V_0_sel_rd;

assign iq_in_V_0_state_cmp_full = ((iq_in_V_0_state != 2'd1) ? 1'b1 : 1'b0);

assign iq_in_V_0_vld_in = iq_in_V_TVALID;

assign iq_in_V_0_vld_out = iq_in_V_0_state[1'd0];

assign iq_in_V_TREADY = iq_in_V_0_state[1'd1];

always @ (*) begin
    p_s_fu_343_p4 = config_led_ctrl_V;
    p_s_fu_343_p4[4'd2] = |(toggle_assign_fu_331_p2);
end

assign tmp5_fu_368_p3 = {{grp_fm_receiver_fu_221_ap_return_1}, {grp_fm_receiver_fu_221_ap_return_0}};

assign tmp_fu_354_p2 = ((config_enable_fm_radio_ip == 8'd1) ? 1'b1 : 1'b0);

assign toggle_assign_fu_331_p2 = (toggle ^ 1'd1);

always @ (posedge ap_clk) begin
    status_git_hash_V_preg[3:2] <= 2'b00;
    status_git_hash_V_preg[5:5] <= 1'b0;
    status_git_hash_V_preg[9:9] <= 1'b0;
    status_git_hash_V_preg[12:12] <= 1'b0;
    status_git_hash_V_preg[15:14] <= 2'b00;
    status_git_hash_V_preg[19:17] <= 3'b000;
    status_git_hash_V_preg[24:24] <= 1'b0;
    status_git_hash_V_preg[27:26] <= 2'b00;
    status_git_hash_V_preg[31:30] <= 2'b00;
    status_build_time_V_preg[1] <= 1'b0;
    status_build_time_V_preg[3:3] <= 1'b0;
    status_build_time_V_preg[8:6] <= 3'b000;
    status_build_time_V_preg[15:11] <= 5'b00000;
    status_build_time_V_preg[20:17] <= 4'b0000;
    status_build_time_V_preg[23:22] <= 2'b00;
    status_build_time_V_preg[26:25] <= 2'b00;
    status_build_time_V_preg[28:28] <= 1'b0;
    status_build_time_V_preg[32:30] <= 3'b000;
    status_build_time_V_preg[39:35] <= 5'b00000;
    status_build_time_V_preg[44:41] <= 4'b0000;
    status_build_time_V_preg[47:46] <= 2'b00;
end

endmodule 
