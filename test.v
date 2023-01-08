module tb();

    reg [31:0]inp;
    wire [4:0]out;

    encoder dut(.i(inp),.out(out));

    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end

    initial begin
        inp <= 32'b01111111111111111110111111111111;
        
        #100;
        inp <= 32'b11101111111111111111111111111111;
        
        #100;
        inp <= 32'b11111111111111111111111111111110;
        
        #100;
        inp <= 32'b11111111111111111111111111111101;
        
        #100;
        inp <= 32'b11111111111111111111111111111111;
        
        #100;
        $finish;
    end


endmodule