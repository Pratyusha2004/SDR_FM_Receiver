`timescale 1 ns / 1 ps 

module fm_receiver (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        iq_in_V_TDATA,
        iq_in_V_TVALID,
        iq_in_V_TREADY,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] iq_in_V_TDATA;
input   iq_in_V_TVALID;
output   iq_in_V_TREADY;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg iq_in_V_TREADY;
reg[15:0] ap_return_0;
reg[15:0] ap_return_1;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [15:0] delay_inst_shift_reg_5;
reg   [15:0] delay_inst_shift_reg_2;
reg   [15:0] delay_inst_shift_reg_4;
reg   [15:0] delay_inst_shift_reg_1;
reg   [15:0] delay_inst_shift_reg_3;
reg   [15:0] delay_inst_shift_reg;
reg    iq_in_V_TDATA_blk_n;
wire    ap_CS_fsm_state3;
wire   [0:0] tmp_s_fu_321_p2;
wire   [1:0] i_1_fu_315_p2;
reg   [1:0] i_1_reg_487;
wire    ap_CS_fsm_state2;
wire   [3:0] k_1_fu_327_p2;
reg   [3:0] k_1_reg_495;
reg    ap_block_state3;
reg   [15:0] p_Val2_6_reg_500;
reg   [15:0] p_Val2_7_reg_505;
wire   [0:0] tmp_2_fu_453_p2;
reg   [0:0] tmp_2_reg_510;
wire    grp_channel_decoder_fu_216_ap_start;
wire    grp_channel_decoder_fu_216_ap_done;
wire    grp_channel_decoder_fu_216_ap_idle;
wire    grp_channel_decoder_fu_216_ap_ready;
wire    grp_channel_decoder_fu_216_in_sample_V_V_read;
wire   [15:0] grp_channel_decoder_fu_216_ap_return_0;
wire   [15:0] grp_channel_decoder_fu_216_ap_return_1;
reg   [1:0] i_reg_194;
reg   [3:0] k_reg_205;
wire    ap_CS_fsm_state4;
wire   [15:0] fm_channel_data_V_V_din;
wire    fm_channel_data_V_V_full_n;
reg    fm_channel_data_V_V_write;
reg    ap_block_state4;
wire   [0:0] tmp_fu_309_p2;
reg    grp_channel_decoder_fu_216_ap_start_reg;
wire   [15:0] fm_channel_data_V_V_dout;
wire    fm_channel_data_V_V_empty_n;
reg    fm_channel_data_V_V_read;
wire    ap_CS_fsm_state5;
wire  signed [15:0] p_Val2_s_fu_333_p1;
wire  signed [15:0] p_Val2_3_fu_337_p4;
wire  signed [15:0] p_Val2_i_fu_413_p2;
wire  signed [29:0] p_Val2_4_fu_464_p2;
wire  signed [15:0] p_Val2_7_i_fu_407_p2;
wire  signed [29:0] p_Val2_5_fu_471_p2;
reg   [15:0] ap_return_0_preg;
reg   [15:0] ap_return_1_preg;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 delay_inst_shift_reg_5 = 16'd0;
#0 delay_inst_shift_reg_2 = 16'd0;
#0 delay_inst_shift_reg_4 = 16'd0;
#0 delay_inst_shift_reg_1 = 16'd0;
#0 delay_inst_shift_reg_3 = 16'd0;
#0 delay_inst_shift_reg = 16'd0;
#0 grp_channel_decoder_fu_216_ap_start_reg = 1'b0;
#0 ap_return_0_preg = 16'd0;
#0 ap_return_1_preg = 16'd0;
end

channel_decoder grp_channel_decoder_fu_216(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_channel_decoder_fu_216_ap_start),
    .ap_done(grp_channel_decoder_fu_216_ap_done),
    .ap_idle(grp_channel_decoder_fu_216_ap_idle),
    .ap_ready(grp_channel_decoder_fu_216_ap_ready),
    .in_sample_V_V_dout(fm_channel_data_V_V_dout),
    .in_sample_V_V_empty_n(fm_channel_data_V_V_empty_n),
    .in_sample_V_V_read(grp_channel_decoder_fu_216_in_sample_V_V_read),
    .ap_return_0(grp_channel_decoder_fu_216_ap_return_0),
    .ap_return_1(grp_channel_decoder_fu_216_ap_return_1)
);

fm_receiver_hls_mlbW #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
fm_receiver_hls_mlbW_U14(
    .din0(p_Val2_s_fu_333_p1),
    .din1(p_Val2_i_fu_413_p2),
    .dout(p_Val2_4_fu_464_p2)
);

fm_receiver_hls_mlbW #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
fm_receiver_hls_mlbW_U15(
    .din0(p_Val2_7_i_fu_407_p2),
    .din1(p_Val2_3_fu_337_p4),
    .dout(p_Val2_5_fu_471_p2)
);

fifo_w16_d3_A fm_channel_data_V_V_fifo_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(fm_channel_data_V_V_din),
    .if_full_n(fm_channel_data_V_V_full_n),
    .if_write(fm_channel_data_V_V_write),
    .if_dout(fm_channel_data_V_V_dout),
    .if_empty_n(fm_channel_data_V_V_empty_n),
    .if_read(fm_channel_data_V_V_read)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_0_preg <= 16'd0;
    end else begin
        if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_return_0_preg <= grp_channel_decoder_fu_216_ap_return_0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 16'd0;
    end else begin
        if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
            ap_return_1_preg <= grp_channel_decoder_fu_216_ap_return_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_channel_decoder_fu_216_ap_start_reg <= 1'b0;
    end else begin
        if (((tmp_fu_309_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_channel_decoder_fu_216_ap_start_reg <= 1'b1;
        end else if ((grp_channel_decoder_fu_216_ap_ready == 1'b1)) begin
            grp_channel_decoder_fu_216_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (tmp_s_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        i_reg_194 <= i_1_reg_487;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_194 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_309_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        k_reg_205 <= 4'd0;
    end else if ((~((tmp_2_reg_510 == 1'd1) & (fm_channel_data_V_V_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state4))) begin
        k_reg_205 <= k_1_reg_495;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (tmp_s_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        delay_inst_shift_reg <= {{iq_in_V_TDATA[31:16]}};
        delay_inst_shift_reg_1 <= delay_inst_shift_reg;
        delay_inst_shift_reg_2 <= delay_inst_shift_reg_1;
        delay_inst_shift_reg_3 <= p_Val2_s_fu_333_p1;
        delay_inst_shift_reg_4 <= delay_inst_shift_reg_3;
        delay_inst_shift_reg_5 <= delay_inst_shift_reg_4;
        p_Val2_6_reg_500 <= {{p_Val2_4_fu_464_p2[29:14]}};
        p_Val2_7_reg_505 <= {{p_Val2_5_fu_471_p2[29:14]}};
        tmp_2_reg_510 <= tmp_2_fu_453_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_1_reg_487 <= i_1_fu_315_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (1'b1 == ap_CS_fsm_state3))) begin
        k_1_reg_495 <= k_1_fu_327_p2;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | ((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5)))) begin
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
    if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_return_0 = grp_channel_decoder_fu_216_ap_return_0;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        ap_return_1 = grp_channel_decoder_fu_216_ap_return_1;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fm_channel_data_V_V_read = grp_channel_decoder_fu_216_in_sample_V_V_read;
    end else begin
        fm_channel_data_V_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((tmp_2_reg_510 == 1'd1) & (fm_channel_data_V_V_full_n == 1'b0)) & (tmp_2_reg_510 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        fm_channel_data_V_V_write = 1'b1;
    end else begin
        fm_channel_data_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_s_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        iq_in_V_TDATA_blk_n = iq_in_V_TVALID;
    end else begin
        iq_in_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (tmp_s_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        iq_in_V_TREADY = 1'b1;
    end else begin
        iq_in_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_fu_309_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state3 : begin
            if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (tmp_s_fu_321_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else if ((~((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0)) & (tmp_s_fu_321_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            if ((~((tmp_2_reg_510 == 1'd1) & (fm_channel_data_V_V_full_n == 1'b0)) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((grp_channel_decoder_fu_216_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
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

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

always @ (*) begin
    ap_block_state3 = ((tmp_s_fu_321_p2 == 1'd0) & (iq_in_V_TVALID == 1'b0));
end

always @ (*) begin
    ap_block_state4 = ((tmp_2_reg_510 == 1'd1) & (fm_channel_data_V_V_full_n == 1'b0));
end

assign fm_channel_data_V_V_din = (p_Val2_6_reg_500 - p_Val2_7_reg_505);

assign grp_channel_decoder_fu_216_ap_start = grp_channel_decoder_fu_216_ap_start_reg;

assign i_1_fu_315_p2 = (i_reg_194 + 2'd1);

assign k_1_fu_327_p2 = (k_reg_205 + 4'd1);

assign p_Val2_3_fu_337_p4 = {{iq_in_V_TDATA[31:16]}};

assign p_Val2_7_i_fu_407_p2 = ($signed(p_Val2_s_fu_333_p1) - $signed(delay_inst_shift_reg_5));

assign p_Val2_i_fu_413_p2 = ($signed(p_Val2_3_fu_337_p4) - $signed(delay_inst_shift_reg_2));

assign p_Val2_s_fu_333_p1 = iq_in_V_TDATA[15:0];

assign tmp_2_fu_453_p2 = ((k_reg_205 == 4'd7) ? 1'b1 : 1'b0);

assign tmp_fu_309_p2 = ((i_reg_194 == 2'd3) ? 1'b1 : 1'b0);

assign tmp_s_fu_321_p2 = ((k_reg_205 == 4'd8) ? 1'b1 : 1'b0);

endmodule 
