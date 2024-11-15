`timescale 1 ns / 1 ps 

module operator_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0,
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0,
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0,
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0,
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0,
        x_V,
        coeff_V_address0,
        coeff_V_ce0,
        coeff_V_q0,
        ap_return
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
output  [6:0] FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0;
output   FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
output   FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
output  [15:0] FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0;
input  [15:0] FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0;
input  [15:0] x_V;
output  [6:0] coeff_V_address0;
output   coeff_V_ce0;
input  [15:0] coeff_V_q0;
output  [15:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[6:0] FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0;
reg FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0;
reg FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0;
reg[15:0] FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0;
reg coeff_V_ce0;
reg[15:0] ap_return;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire  signed [31:0] i_cast_fu_130_p1;
reg  signed [31:0] i_cast_reg_211;
wire    ap_CS_fsm_state2;
wire   [0:0] tmp_s_fu_142_p2;
reg   [0:0] tmp_s_reg_220;
wire   [0:0] tmp_fu_134_p3;
wire    ap_CS_fsm_state3;
wire   [7:0] grp_fu_123_p2;
reg   [7:0] i_1_reg_242;
reg  signed [15:0] coeff_V_load_reg_247;
wire    ap_CS_fsm_state4;
wire    ap_CS_fsm_state5;
reg   [15:0] p_Val2_s_reg_89;
wire  signed [7:0] ap_phi_mux_i_phi_fu_105_p4;
reg  signed [7:0] i_reg_101;
reg  signed [15:0] p_s_reg_113;
wire   [63:0] tmp_2_fu_148_p1;
wire   [63:0] tmp_4_fu_159_p1;
wire   [0:0] tmp_3_fu_153_p2;
wire   [63:0] tmp_5_fu_163_p1;
reg  signed [7:0] grp_fu_123_p0;
wire  signed [29:0] grp_fu_191_p3;
wire   [29:0] grp_fu_191_p2;
reg   [15:0] ap_return_preg;
reg   [4:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_return_preg = 16'd0;
end

fm_receiver_hls_mbkb #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 30 ),
    .dout_WIDTH( 30 ))
fm_receiver_hls_mbkb_U1(
    .din0(coeff_V_load_reg_247),
    .din1(p_s_reg_113),
    .din2(grp_fu_191_p2),
    .dout(grp_fu_191_p3)
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
        ap_return_preg <= 16'd0;
    end else begin
        if (((tmp_fu_134_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_return_preg <= p_Val2_s_reg_89;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_reg_101 <= i_1_reg_242;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_101 <= 8'd72;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        p_Val2_s_reg_89 <= {{grp_fu_191_p3[29:14]}};
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        p_Val2_s_reg_89 <= 16'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_s_reg_220 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        p_s_reg_113 <= FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0;
    end else if (((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        p_s_reg_113 <= x_V;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        coeff_V_load_reg_247 <= coeff_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        i_1_reg_242 <= grp_fu_123_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        i_cast_reg_211 <= i_cast_fu_130_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_134_p3 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_s_reg_220 <= tmp_s_fu_142_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0 = tmp_4_fu_159_p1;
    end else if (((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0 = 64'd0;
    end else if (((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0 = tmp_2_fu_148_p1;
    end else begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0 = 1'b1;
    end else begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0 = FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_q0;
    end else if (((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0 = x_V;
    end else begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_3_fu_153_p2 == 1'd0) & (tmp_s_reg_220 == 1'd0) & (1'b1 == ap_CS_fsm_state3)) | ((tmp_fu_134_p3 == 1'd0) & (tmp_s_fu_142_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)))) begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0 = 1'b1;
    end else begin
        FIR_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_ap_fixed_16_2_5_3_0_I_shift_reg_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_fu_134_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((tmp_fu_134_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_fu_134_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_return = p_Val2_s_reg_89;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        coeff_V_ce0 = 1'b1;
    end else begin
        coeff_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        grp_fu_123_p0 = i_reg_101;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        grp_fu_123_p0 = ap_phi_mux_i_phi_fu_105_p4;
    end else begin
        grp_fu_123_p0 = 'bx;
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
            if (((tmp_fu_134_p3 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
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

assign ap_phi_mux_i_phi_fu_105_p4 = i_reg_101;

assign coeff_V_address0 = tmp_5_fu_163_p1;

assign grp_fu_123_p2 = ($signed(grp_fu_123_p0) + $signed(8'd255));

assign grp_fu_191_p2 = {{p_Val2_s_reg_89}, {14'd0}};

assign i_cast_fu_130_p1 = i_reg_101;

assign tmp_2_fu_148_p1 = grp_fu_123_p2;

assign tmp_3_fu_153_p2 = ((i_reg_101 == 8'd72) ? 1'b1 : 1'b0);

assign tmp_4_fu_159_p1 = $unsigned(i_cast_reg_211);

assign tmp_5_fu_163_p1 = $unsigned(i_cast_reg_211);

assign tmp_fu_134_p3 = i_reg_101[32'd7];

assign tmp_s_fu_142_p2 = ((i_reg_101 == 8'd0) ? 1'b1 : 1'b0);

endmodule //operator_s