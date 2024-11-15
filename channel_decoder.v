`timescale 1 ns / 1 ps 

module channel_decoder (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_sample_V_V_dout,
        in_sample_V_V_empty_n,
        in_sample_V_V_read,
        ap_return_0,
        ap_return_1
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_state6 = 7'd32;
parameter    ap_ST_fsm_state7 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] in_sample_V_V_dout;
input   in_sample_V_V_empty_n;
output   in_sample_V_V_read;
output  [15:0] ap_return_0;
output  [15:0] ap_return_1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_sample_V_V_read;
reg[15:0] ap_return_0;
reg[15:0] ap_return_1;

(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    fir_pilot_inst_shift_ce0;
reg    fir_pilot_inst_shift_we0;
wire   [15:0] fir_pilot_inst_shift_q0;
reg    filter_bp_pilot_coef_ce0;
wire   [15:0] filter_bp_pilot_coef_q0;
reg    fir_mono_inst_shift_s_ce0;
reg    fir_mono_inst_shift_s_we0;
wire   [15:0] fir_mono_inst_shift_s_q0;
reg    filter_lp_mono_coeff_ce0;
wire   [15:0] filter_lp_mono_coeff_q0;
reg   [15:0] delay_inst_shift_reg_41;
reg   [15:0] delay_inst_shift_reg_30;
reg   [15:0] delay_inst_shift_reg_19;
reg   [15:0] delay_inst_shift_reg_11;
reg   [15:0] delay_inst_shift_reg_10;
reg   [15:0] delay_inst_shift_reg_9;
reg   [15:0] delay_inst_shift_reg_8;
reg   [15:0] delay_inst_shift_reg_7;
reg   [15:0] delay_inst_shift_reg_6;
reg   [15:0] delay_inst_shift_reg_40;
reg   [15:0] delay_inst_shift_reg_39;
reg   [15:0] delay_inst_shift_reg_38;
reg   [15:0] delay_inst_shift_reg_37;
reg   [15:0] delay_inst_shift_reg_36;
reg   [15:0] delay_inst_shift_reg_35;
reg   [15:0] delay_inst_shift_reg_34;
reg   [15:0] delay_inst_shift_reg_33;
reg   [15:0] delay_inst_shift_reg_32;
reg   [15:0] delay_inst_shift_reg_31;
reg   [15:0] delay_inst_shift_reg_29;
reg   [15:0] delay_inst_shift_reg_28;
reg   [15:0] delay_inst_shift_reg_27;
reg   [15:0] delay_inst_shift_reg_26;
reg   [15:0] delay_inst_shift_reg_25;
reg   [15:0] delay_inst_shift_reg_24;
reg   [15:0] delay_inst_shift_reg_23;
reg   [15:0] delay_inst_shift_reg_22;
reg   [15:0] delay_inst_shift_reg_21;
reg   [15:0] delay_inst_shift_reg_20;
reg   [15:0] delay_inst_shift_reg_18;
reg   [15:0] delay_inst_shift_reg_17;
reg   [15:0] delay_inst_shift_reg_16;
reg   [15:0] delay_inst_shift_reg_15;
reg   [15:0] delay_inst_shift_reg_14;
reg   [15:0] delay_inst_shift_reg_13;
reg   [15:0] delay_inst_shift_reg_12;
wire   [15:0] fir_lrdiff_inst_shif_q0;
wire   [15:0] filter_bp_lrdiff_coe_q0;
reg    fir_mono_inst_shift_1_ce0;
reg    fir_mono_inst_shift_1_we0;
wire   [15:0] fir_mono_inst_shift_1_q0;
reg    filter_lp_mono_coeff_1_ce0;
wire   [15:0] filter_lp_mono_coeff_1_q0;
reg    in_sample_V_V_blk_n;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_fu_214_p2;
wire   [1:0] i_2_fu_220_p2;
reg   [1:0] i_2_reg_681;
reg    ap_block_state2;
reg   [15:0] tmp_V_reg_686;
wire  signed [28:0] OP1_V_cast_fu_665_p2;
reg  signed [28:0] OP1_V_cast_reg_692;
wire    ap_CS_fsm_state3;
wire    grp_operator_s_fu_191_ap_idle;
wire    grp_operator_s_fu_191_ap_ready;
wire    grp_operator_s_fu_191_ap_done;
reg  signed [15:0] carrier_38k_V_reg_697;
wire    ap_CS_fsm_state4;
reg   [15:0] mono_delayed_V_reg_702;
wire    ap_CS_fsm_state5;
wire    grp_operator_s_fu_203_ap_idle;
wire    grp_operator_s_fu_203_ap_ready;
wire    grp_operator_s_fu_203_ap_done;
reg    ap_block_state5_on_subcall_done;
reg   [15:0] p_0_i3_reg_707;
wire   [15:0] grp_operator_s_fu_191_ap_return;
wire    ap_CS_fsm_state7;
wire    grp_operator_s_fu_191_ap_start;
wire   [6:0] grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0;
wire    grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
wire    grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
wire   [15:0] grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0;
reg   [15:0] grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0;
reg   [15:0] grp_operator_s_fu_191_x_V;
wire   [6:0] grp_operator_s_fu_191_coeff_V_address0;
wire    grp_operator_s_fu_191_coeff_V_ce0;
reg   [15:0] grp_operator_s_fu_191_coeff_V_q0;
wire    grp_operator_s_fu_203_ap_start;
wire   [6:0] grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0;
wire    grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
wire    grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
wire   [15:0] grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0;
wire   [6:0] grp_operator_s_fu_203_coeff_V_address0;
wire    grp_operator_s_fu_203_coeff_V_ce0;
wire  signed [15:0] grp_operator_s_fu_203_ap_return;
reg   [15:0] p_Val2_s_reg_158;
reg   [15:0] p_Val2_10_reg_169;
reg   [1:0] i_reg_180;
reg    grp_operator_s_fu_191_ap_start_reg;
reg    ap_block_state2_ignore_call1;
wire    ap_CS_fsm_state6;
reg    grp_operator_s_fu_203_ap_start_reg;
wire   [15:0] agg_result_L_V_write_fu_226_p2;
wire   [15:0] agg_result_R_V_write_fu_232_p2;
wire   [15:0] tmp_2_fu_250_p2;
wire   [15:0] p_Val2_i_fu_256_p2;
wire   [29:0] p_Val2_9_fu_266_p3;
wire   [29:0] addconv_i_fu_273_p2;
wire  signed [28:0] r_V_fu_671_p2;
wire  signed [15:0] OP1_V_cast_fu_665_p0;
wire  signed [28:0] tmp_1_fu_262_p1;
wire  signed [15:0] OP1_V_cast_fu_665_p1;
reg   [15:0] ap_return_0_preg;
reg   [15:0] ap_return_1_preg;
reg   [6:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 7'd1;
#0 delay_inst_shift_reg_41 = 16'd0;
#0 delay_inst_shift_reg_30 = 16'd0;
#0 delay_inst_shift_reg_19 = 16'd0;
#0 delay_inst_shift_reg_11 = 16'd0;
#0 delay_inst_shift_reg_10 = 16'd0;
#0 delay_inst_shift_reg_9 = 16'd0;
#0 delay_inst_shift_reg_8 = 16'd0;
#0 delay_inst_shift_reg_7 = 16'd0;
#0 delay_inst_shift_reg_6 = 16'd0;
#0 delay_inst_shift_reg_40 = 16'd0;
#0 delay_inst_shift_reg_39 = 16'd0;
#0 delay_inst_shift_reg_38 = 16'd0;
#0 delay_inst_shift_reg_37 = 16'd0;
#0 delay_inst_shift_reg_36 = 16'd0;
#0 delay_inst_shift_reg_35 = 16'd0;
#0 delay_inst_shift_reg_34 = 16'd0;
#0 delay_inst_shift_reg_33 = 16'd0;
#0 delay_inst_shift_reg_32 = 16'd0;
#0 delay_inst_shift_reg_31 = 16'd0;
#0 delay_inst_shift_reg_29 = 16'd0;
#0 delay_inst_shift_reg_28 = 16'd0;
#0 delay_inst_shift_reg_27 = 16'd0;
#0 delay_inst_shift_reg_26 = 16'd0;
#0 delay_inst_shift_reg_25 = 16'd0;
#0 delay_inst_shift_reg_24 = 16'd0;
#0 delay_inst_shift_reg_23 = 16'd0;
#0 delay_inst_shift_reg_22 = 16'd0;
#0 delay_inst_shift_reg_21 = 16'd0;
#0 delay_inst_shift_reg_20 = 16'd0;
#0 delay_inst_shift_reg_18 = 16'd0;
#0 delay_inst_shift_reg_17 = 16'd0;
#0 delay_inst_shift_reg_16 = 16'd0;
#0 delay_inst_shift_reg_15 = 16'd0;
#0 delay_inst_shift_reg_14 = 16'd0;
#0 delay_inst_shift_reg_13 = 16'd0;
#0 delay_inst_shift_reg_12 = 16'd0;
#0 grp_operator_s_fu_191_ap_start_reg = 1'b0;
#0 grp_operator_s_fu_203_ap_start_reg = 1'b0;
#0 ap_return_0_preg = 16'd0;
#0 ap_return_1_preg = 16'd0;
end

channel_decoder_fcud #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
fir_pilot_inst_shift_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .ce0(fir_pilot_inst_shift_ce0),
    .we0(fir_pilot_inst_shift_we0),
    .d0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .q0(fir_pilot_inst_shift_q0)
);

channel_decoder_fdEe #(
    .DataWidth( 16 ),
    .AddressRange( 73 ),
    .AddressWidth( 7 ))
filter_bp_pilot_coef_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_coeff_V_address0),
    .ce0(filter_bp_pilot_coef_ce0),
    .q0(filter_bp_pilot_coef_q0)
);

channel_decoder_fcud #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
fir_mono_inst_shift_s_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .ce0(fir_mono_inst_shift_s_ce0),
    .we0(fir_mono_inst_shift_s_we0),
    .d0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .q0(fir_mono_inst_shift_s_q0)
);

channel_decoder_ffYi #(
    .DataWidth( 16 ),
    .AddressRange( 73 ),
    .AddressWidth( 7 ))
filter_lp_mono_coeff_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_coeff_V_address0),
    .ce0(filter_lp_mono_coeff_ce0),
    .q0(filter_lp_mono_coeff_q0)
);

channel_decoder_fcud #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
fir_lrdiff_inst_shif_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .ce0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0),
    .we0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0),
    .d0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .q0(fir_lrdiff_inst_shif_q0)
);

channel_decoder_fhbi #(
    .DataWidth( 16 ),
    .AddressRange( 73 ),
    .AddressWidth( 7 ))
filter_bp_lrdiff_coe_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_203_coeff_V_address0),
    .ce0(grp_operator_s_fu_203_coeff_V_ce0),
    .q0(filter_bp_lrdiff_coe_q0)
);

channel_decoder_fcud #(
    .DataWidth( 16 ),
    .AddressRange( 72 ),
    .AddressWidth( 7 ))
fir_mono_inst_shift_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .ce0(fir_mono_inst_shift_1_ce0),
    .we0(fir_mono_inst_shift_1_we0),
    .d0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .q0(fir_mono_inst_shift_1_q0)
);

channel_decoder_ffYi #(
    .DataWidth( 16 ),
    .AddressRange( 73 ),
    .AddressWidth( 7 ))
filter_lp_mono_coeff_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(grp_operator_s_fu_191_coeff_V_address0),
    .ce0(filter_lp_mono_coeff_1_ce0),
    .q0(filter_lp_mono_coeff_1_q0)
);

operator_s grp_operator_s_fu_191(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_operator_s_fu_191_ap_start),
    .ap_done(grp_operator_s_fu_191_ap_done),
    .ap_idle(grp_operator_s_fu_191_ap_idle),
    .ap_ready(grp_operator_s_fu_191_ap_ready),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0(grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0),
    .x_V(grp_operator_s_fu_191_x_V),
    .coeff_V_address0(grp_operator_s_fu_191_coeff_V_address0),
    .coeff_V_ce0(grp_operator_s_fu_191_coeff_V_ce0),
    .coeff_V_q0(grp_operator_s_fu_191_coeff_V_q0),
    .ap_return(grp_operator_s_fu_191_ap_return)
);

operator_s grp_operator_s_fu_203(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_operator_s_fu_203_ap_start),
    .ap_done(grp_operator_s_fu_203_ap_done),
    .ap_idle(grp_operator_s_fu_203_ap_idle),
    .ap_ready(grp_operator_s_fu_203_ap_ready),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0(grp_operator_s_fu_203_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0),
    .FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0(fir_lrdiff_inst_shif_q0),
    .x_V(tmp_V_reg_686),
    .coeff_V_address0(grp_operator_s_fu_203_coeff_V_address0),
    .coeff_V_ce0(grp_operator_s_fu_203_coeff_V_ce0),
    .coeff_V_q0(filter_bp_lrdiff_coe_q0),
    .ap_return(grp_operator_s_fu_203_ap_return)
);

fm_receiver_hls_mkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 29 ))
fm_receiver_hls_mkbM_U6(
    .din0(OP1_V_cast_fu_665_p0),
    .din1(OP1_V_cast_fu_665_p1),
    .dout(OP1_V_cast_fu_665_p2)
);

fm_receiver_hls_mkbM #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 29 ))
fm_receiver_hls_mkbM_U7(
    .din0(carrier_38k_V_reg_697),
    .din1(grp_operator_s_fu_203_ap_return),
    .dout(r_V_fu_671_p2)
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
        if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
            ap_return_0_preg <= agg_result_L_V_write_fu_226_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_1_preg <= 16'd0;
    end else begin
        if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
            ap_return_1_preg <= agg_result_R_V_write_fu_232_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_operator_s_fu_191_ap_start_reg <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state4) | (~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd0)))) begin
            grp_operator_s_fu_191_ap_start_reg <= 1'b1;
        end else if ((grp_operator_s_fu_191_ap_ready == 1'b1)) begin
            grp_operator_s_fu_191_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_operator_s_fu_203_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_operator_s_fu_203_ap_start_reg <= 1'b1;
        end else if ((grp_operator_s_fu_203_ap_ready == 1'b1)) begin
            grp_operator_s_fu_203_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_operator_s_fu_191_ap_done == 1'b1))) begin
        i_reg_180 <= i_2_reg_681;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_180 <= 2'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state3) & (grp_operator_s_fu_191_ap_done == 1'b1))) begin
        OP1_V_cast_reg_692 <= OP1_V_cast_fu_665_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        carrier_38k_V_reg_697 <= {{addconv_i_fu_273_p2[29:14]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_on_subcall_done))) begin
        delay_inst_shift_reg_10 <= delay_inst_shift_reg_9;
        delay_inst_shift_reg_11 <= delay_inst_shift_reg_10;
        delay_inst_shift_reg_12 <= grp_operator_s_fu_191_ap_return;
        delay_inst_shift_reg_13 <= delay_inst_shift_reg_12;
        delay_inst_shift_reg_14 <= delay_inst_shift_reg_13;
        delay_inst_shift_reg_15 <= delay_inst_shift_reg_14;
        delay_inst_shift_reg_16 <= delay_inst_shift_reg_15;
        delay_inst_shift_reg_17 <= delay_inst_shift_reg_16;
        delay_inst_shift_reg_18 <= delay_inst_shift_reg_17;
        delay_inst_shift_reg_19 <= delay_inst_shift_reg_11;
        delay_inst_shift_reg_20 <= delay_inst_shift_reg_18;
        delay_inst_shift_reg_21 <= delay_inst_shift_reg_20;
        delay_inst_shift_reg_22 <= delay_inst_shift_reg_21;
        delay_inst_shift_reg_23 <= delay_inst_shift_reg_22;
        delay_inst_shift_reg_24 <= delay_inst_shift_reg_23;
        delay_inst_shift_reg_25 <= delay_inst_shift_reg_24;
        delay_inst_shift_reg_26 <= delay_inst_shift_reg_25;
        delay_inst_shift_reg_27 <= delay_inst_shift_reg_26;
        delay_inst_shift_reg_28 <= delay_inst_shift_reg_27;
        delay_inst_shift_reg_29 <= delay_inst_shift_reg_28;
        delay_inst_shift_reg_30 <= delay_inst_shift_reg_19;
        delay_inst_shift_reg_31 <= delay_inst_shift_reg_29;
        delay_inst_shift_reg_32 <= delay_inst_shift_reg_31;
        delay_inst_shift_reg_33 <= delay_inst_shift_reg_32;
        delay_inst_shift_reg_34 <= delay_inst_shift_reg_33;
        delay_inst_shift_reg_35 <= delay_inst_shift_reg_34;
        delay_inst_shift_reg_36 <= delay_inst_shift_reg_35;
        delay_inst_shift_reg_37 <= delay_inst_shift_reg_36;
        delay_inst_shift_reg_38 <= delay_inst_shift_reg_37;
        delay_inst_shift_reg_39 <= delay_inst_shift_reg_38;
        delay_inst_shift_reg_40 <= delay_inst_shift_reg_39;
        delay_inst_shift_reg_41 <= delay_inst_shift_reg_30;
        delay_inst_shift_reg_6 <= delay_inst_shift_reg_40;
        delay_inst_shift_reg_7 <= delay_inst_shift_reg_6;
        delay_inst_shift_reg_8 <= delay_inst_shift_reg_7;
        delay_inst_shift_reg_9 <= delay_inst_shift_reg_8;
        mono_delayed_V_reg_702 <= delay_inst_shift_reg_41;
        p_0_i3_reg_707 <= {{r_V_fu_671_p2[28:13]}};
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2))) begin
        i_2_reg_681 <= i_2_fu_220_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (grp_operator_s_fu_191_ap_done == 1'b1))) begin
        p_Val2_10_reg_169 <= grp_operator_s_fu_191_ap_return;
        p_Val2_s_reg_158 <= mono_delayed_V_reg_702;
    end
end

always @ (posedge ap_clk) begin
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd0))) begin
        tmp_V_reg_686 <= in_sample_V_V_dout;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)) | (~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1)))) begin
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
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
        ap_return_0 = agg_result_L_V_write_fu_226_p2;
    end else begin
        ap_return_0 = ap_return_0_preg;
    end
end

always @ (*) begin
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
        ap_return_1 = agg_result_R_V_write_fu_232_p2;
    end else begin
        ap_return_1 = ap_return_1_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        filter_bp_pilot_coef_ce0 = grp_operator_s_fu_191_coeff_V_ce0;
    end else begin
        filter_bp_pilot_coef_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        filter_lp_mono_coeff_1_ce0 = grp_operator_s_fu_191_coeff_V_ce0;
    end else begin
        filter_lp_mono_coeff_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        filter_lp_mono_coeff_ce0 = grp_operator_s_fu_191_coeff_V_ce0;
    end else begin
        filter_lp_mono_coeff_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        fir_mono_inst_shift_1_ce0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
    end else begin
        fir_mono_inst_shift_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        fir_mono_inst_shift_1_we0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
    end else begin
        fir_mono_inst_shift_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fir_mono_inst_shift_s_ce0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
    end else begin
        fir_mono_inst_shift_s_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        fir_mono_inst_shift_s_we0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
    end else begin
        fir_mono_inst_shift_s_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fir_pilot_inst_shift_ce0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
    end else begin
        fir_pilot_inst_shift_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        fir_pilot_inst_shift_we0 = grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
    end else begin
        fir_pilot_inst_shift_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0 = fir_mono_inst_shift_1_q0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0 = fir_mono_inst_shift_s_q0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0 = fir_pilot_inst_shift_q0;
    end else begin
        grp_operator_s_fu_191_FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_operator_s_fu_191_coeff_V_q0 = filter_lp_mono_coeff_1_q0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        grp_operator_s_fu_191_coeff_V_q0 = filter_lp_mono_coeff_q0;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_operator_s_fu_191_coeff_V_q0 = filter_bp_pilot_coef_q0;
    end else begin
        grp_operator_s_fu_191_coeff_V_q0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_operator_s_fu_191_x_V = p_0_i3_reg_707;
    end else if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state3))) begin
        grp_operator_s_fu_191_x_V = tmp_V_reg_686;
    end else begin
        grp_operator_s_fu_191_x_V = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd0))) begin
        in_sample_V_V_blk_n = in_sample_V_V_empty_n;
    end else begin
        in_sample_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd0))) begin
        in_sample_V_V_read = 1'b1;
    end else begin
        in_sample_V_V_read = 1'b0;
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
            if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if ((~((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0)) & (1'b1 == ap_CS_fsm_state2) & (tmp_fu_214_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (grp_operator_s_fu_191_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (1'b0 == ap_block_state5_on_subcall_done))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_operator_s_fu_191_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OP1_V_cast_fu_665_p0 = tmp_1_fu_262_p1;

assign OP1_V_cast_fu_665_p1 = tmp_1_fu_262_p1;

assign addconv_i_fu_273_p2 = ($signed(30'd872415232) + $signed(p_Val2_9_fu_266_p3));

assign agg_result_L_V_write_fu_226_p2 = (p_Val2_10_reg_169 + p_Val2_s_reg_158);

assign agg_result_R_V_write_fu_232_p2 = (p_Val2_s_reg_158 - p_Val2_10_reg_169);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

always @ (*) begin
    ap_block_state2 = ((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0));
end

always @ (*) begin
    ap_block_state2_ignore_call1 = ((in_sample_V_V_empty_n == 1'b0) & (tmp_fu_214_p2 == 1'd0));
end

always @ (*) begin
    ap_block_state5_on_subcall_done = ((grp_operator_s_fu_203_ap_done == 1'b0) | (grp_operator_s_fu_191_ap_done == 1'b0));
end

assign grp_operator_s_fu_191_ap_start = grp_operator_s_fu_191_ap_start_reg;

assign grp_operator_s_fu_203_ap_start = grp_operator_s_fu_203_ap_start_reg;

assign i_2_fu_220_p2 = (i_reg_180 + 2'd1);

assign p_Val2_9_fu_266_p3 = {{OP1_V_cast_reg_692}, {1'd0}};

assign p_Val2_i_fu_256_p2 = (16'd0 - tmp_2_fu_250_p2);

assign tmp_1_fu_262_p1 = $signed(p_Val2_i_fu_256_p2);

assign tmp_2_fu_250_p2 = grp_operator_s_fu_191_ap_return << 16'd3;

assign tmp_fu_214_p2 = ((i_reg_180 == 2'd3) ? 1'b1 : 1'b0);

endmodule 