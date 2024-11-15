`timescale 1ns/1ps

module fm_receiver_hls_API_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 6,
    C_S_AXI_DATA_WIDTH = 32
)(
    // axi4 lite slave signals
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    // user signals
    output wire [3:0]                    config_led_ctrl_V,
    output wire [7:0]                    config_enable_fm_radio_ip,
    input  wire [31:0]                   status_git_hash_V,
    input  wire [47:0]                   status_build_time_V
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of config_led_ctrl_V
//        bit 3~0 - config_led_ctrl_V[3:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of config_enable_fm_radio_ip
//        bit 7~0 - config_enable_fm_radio_ip[7:0] (Read/Write)
//        others  - reserved
// 0x1c : reserved
// 0x20 : Data signal of status_git_hash_V
//        bit 31~0 - status_git_hash_V[31:0] (Read)
// 0x24 : reserved
// 0x28 : Data signal of status_build_time_V
//        bit 31~0 - status_build_time_V[31:0] (Read)
// 0x2c : Data signal of status_build_time_V
//        bit 15~0 - status_build_time_V[47:32] (Read)
//        others   - reserved
// 0x30 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_CONFIG_LED_CTRL_V_DATA_0         = 6'h10,
    ADDR_CONFIG_LED_CTRL_V_CTRL           = 6'h14,
    ADDR_CONFIG_ENABLE_FM_RADIO_IP_DATA_0 = 6'h18,
    ADDR_CONFIG_ENABLE_FM_RADIO_IP_CTRL   = 6'h1c,
    ADDR_STATUS_GIT_HASH_V_DATA_0         = 6'h20,
    ADDR_STATUS_GIT_HASH_V_CTRL           = 6'h24,
    ADDR_STATUS_BUILD_TIME_V_DATA_0       = 6'h28,
    ADDR_STATUS_BUILD_TIME_V_DATA_1       = 6'h2c,
    ADDR_STATUS_BUILD_TIME_V_CTRL         = 6'h30,
    WRIDLE                                = 2'd0,
    WRDATA                                = 2'd1,
    WRRESP                                = 2'd2,
    WRRESET                               = 2'd3,
    RDIDLE                                = 2'd0,
    RDDATA                                = 2'd1,
    RDRESET                               = 2'd2,
    ADDR_BITS         = 6;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [3:0]                    int_config_led_ctrl_V = 'b0;
    reg  [7:0]                    int_config_enable_fm_radio_ip = 'b0;
    reg  [31:0]                   int_status_git_hash_V = 'b0;
    reg  [47:0]                   int_status_build_time_V = 'b0;

//------------------------Instantiation------------------

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_CONFIG_LED_CTRL_V_DATA_0: begin
                    rdata <= int_config_led_ctrl_V[3:0];
                end
                ADDR_CONFIG_ENABLE_FM_RADIO_IP_DATA_0: begin
                    rdata <= int_config_enable_fm_radio_ip[7:0];
                end
                ADDR_STATUS_GIT_HASH_V_DATA_0: begin
                    rdata <= int_status_git_hash_V[31:0];
                end
                ADDR_STATUS_BUILD_TIME_V_DATA_0: begin
                    rdata <= int_status_build_time_V[31:0];
                end
                ADDR_STATUS_BUILD_TIME_V_DATA_1: begin
                    rdata <= int_status_build_time_V[47:32];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign config_led_ctrl_V         = int_config_led_ctrl_V;
assign config_enable_fm_radio_ip = int_config_enable_fm_radio_ip;
// int_config_led_ctrl_V[3:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_config_led_ctrl_V[3:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CONFIG_LED_CTRL_V_DATA_0)
            int_config_led_ctrl_V[3:0] <= (WDATA[31:0] & wmask) | (int_config_led_ctrl_V[3:0] & ~wmask);
    end
end

// int_config_enable_fm_radio_ip[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_config_enable_fm_radio_ip[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CONFIG_ENABLE_FM_RADIO_IP_DATA_0)
            int_config_enable_fm_radio_ip[7:0] <= (WDATA[31:0] & wmask) | (int_config_enable_fm_radio_ip[7:0] & ~wmask);
    end
end

// int_status_git_hash_V
always @(posedge ACLK) begin
    if (ARESET)
        int_status_git_hash_V <= 0;
    else if (ACLK_EN) begin
            int_status_git_hash_V <= status_git_hash_V;
    end
end

// int_status_build_time_V
always @(posedge ACLK) begin
    if (ARESET)
        int_status_build_time_V <= 0;
    else if (ACLK_EN) begin
            int_status_build_time_V <= status_build_time_V;
    end
end


//------------------------Memory logic-------------------

endmodule

