//Top Level Module Test Bench
`timescale 1 ns / 1 ps

 module fm_receiver_hls_tb;

    // Inputs
    reg ap_clk;
    reg ap_rst_n;
    reg ap_start;
    reg iq_in_V_TVALID;
    reg audio_out_V_TREADY;
    reg [31:0] iq_in_V_TDATA;
    reg [5:0] s_axi_API_AWADDR;
    reg s_axi_API_AWVALID;
    reg [31:0] s_axi_API_WDATA;
    reg s_axi_API_WVALID;
    reg [5:0] s_axi_API_ARADDR;
    reg s_axi_API_ARVALID;
    reg s_axi_API_RREADY;
    reg s_axi_API_BREADY;

    // Outputs
    wire ap_done;
    wire ap_idle;
    wire ap_ready;
    wire iq_in_V_TREADY;
    wire [31:0] audio_out_V_TDATA;
    wire audio_out_V_TVALID;
    wire [3:0] led_out_V;
    wire s_axi_API_AWREADY;
    wire s_axi_API_WREADY;
    wire [31:0] s_axi_API_RDATA;
    wire [1:0] s_axi_API_RRESP;
    wire s_axi_API_RVALID;
    wire s_axi_API_BVALID;
    wire [1:0] s_axi_API_BRESP;

    // Instantiate the Unit Under Test (UUT)
    fm_receiver_hls uut (
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .iq_in_V_TDATA(iq_in_V_TDATA),
        .iq_in_V_TVALID(iq_in_V_TVALID),
        .iq_in_V_TREADY(iq_in_V_TREADY),
        .audio_out_V_TDATA(audio_out_V_TDATA),
        .audio_out_V_TVALID(audio_out_V_TVALID),
        .audio_out_V_TREADY(audio_out_V_TREADY),
        .led_out_V(led_out_V),
        .s_axi_API_AWADDR(s_axi_API_AWADDR),
        .s_axi_API_AWVALID(s_axi_API_AWVALID),
        .s_axi_API_AWREADY(s_axi_API_AWREADY),
        .s_axi_API_WDATA(s_axi_API_WDATA),
        .s_axi_API_WVALID(s_axi_API_WVALID),
        .s_axi_API_WREADY(s_axi_API_WREADY),
        .s_axi_API_ARADDR(s_axi_API_ARADDR),
        .s_axi_API_ARVALID(s_axi_API_ARVALID),
        .s_axi_API_ARREADY(s_axi_API_ARREADY),
        .s_axi_API_RDATA(s_axi_API_RDATA),
        .s_axi_API_RRESP(s_axi_API_RRESP),
        .s_axi_API_RVALID(s_axi_API_RVALID),
        .s_axi_API_RREADY(s_axi_API_RREADY),
        .s_axi_API_BVALID(s_axi_API_BVALID),
        .s_axi_API_BREADY(s_axi_API_BREADY),
        .s_axi_API_BRESP(s_axi_API_BRESP)
    );

    // Clock generation (100 MHz)
    initial begin
        ap_clk = 0;
        forever #5 ap_clk = ~ap_clk; // 10ns period, 100MHz frequency
    end

    // Test procedure
    initial begin
        // Initialize Inputs
        ap_rst_n = 0;
        ap_start = 0;
        iq_in_V_TVALID = 0;
        audio_out_V_TREADY = 0;
        iq_in_V_TDATA = 32'h00000000;
        s_axi_API_AWADDR = 6'b0;
        s_axi_API_AWVALID = 0;
        s_axi_API_WDATA = 32'h00000000;
        s_axi_API_WVALID = 0;
        s_axi_API_ARADDR = 6'b0;
        s_axi_API_ARVALID = 0;
        s_axi_API_RREADY = 0;
        s_axi_API_BREADY = 0;

        // Apply reset
        #20;
        ap_rst_n = 1;

        // Start the operation
        #30;
        ap_start = 1;
        #10;
        ap_start = 0;

        // Provide input samples
        iq_in_V_TDATA = 32'hABCDE123;
        iq_in_V_TVALID = 1;
        audio_out_V_TREADY = 1;
        #50;
        iq_in_V_TDATA = 32'h12345678;
        #50;
        iq_in_V_TDATA = 32'hFEDCBA98;
        #50;
        iq_in_V_TDATA = 32'h87654321;
        #50;
        iq_in_V_TVALID = 0;

        // Simulate AXI transactions
        s_axi_API_AWADDR = 6'h10;
        s_axi_API_AWVALID = 1;
        s_axi_API_WDATA = 32'h12345678;
        s_axi_API_WVALID = 1;
        s_axi_API_ARADDR = 6'h20;
        s_axi_API_ARVALID = 1;
        s_axi_API_RREADY = 1;
        s_axi_API_BREADY = 1;

        // Observe results and complete simulation
        #500;

        $display("ap_done: %b", ap_done);
        $display("audio_out_V_TDATA: %h", audio_out_V_TDATA);
        $display("led_out_V: %h", led_out_V);

        $finish;
    end

    // Monitor output signals
    initial begin
        $monitor("At time %0t: ap_done = %b, ap_idle = %b, ap_ready = %b, iq_in_V_TREADY = %b, audio_out_V_TVALID = %b, led_out_V = %h", 
                 $time, ap_done, ap_idle, ap_ready, iq_in_V_TREADY, audio_out_V_TVALID, led_out_V);
    end

endmodule
