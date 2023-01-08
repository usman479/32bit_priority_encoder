`include "encoder_8bit.v"

module encoder(i,out,gs);

    input [31:0]i;
    output [4:0]out;
    output gs;

    wire eo1,eo2,eo3,gs1,gs2,gs3,gs4;
    wire [2:0] out1,out2,out3,out4;
    

    // assign out[4] = i[16]|i[17]|i[18]|i[19]|i[20]|i[21]|i[22]|i[23]|i[24]|i[25]|i[26]|i[27]|i[28]|i[29]|i[30]|i[31];
    // assign out[3] = (~i[16]&~i[17]&~i[18]&~i[19]&~i[20]&~i[21]&~i[22]&~i[23])&(i[8]|i[9]|i[10]|i[11]|i[12]|i[13]|i[14]|i[15])|i[24]|i[25]|i[26]|i[27]|i[28]|i[29]|i[30]|i[31];
    // assign out[2] = (~i[24]&~i[25]&~i[26]&~i[26])&(())
    // assign out[1] = 1'b0;
    // assign out[0] = 1'b0;

    encoder_8bit encoder1(.i(i[31:24]),.out(out1),.en(1'b0),.gs(gs1),.eo(eo1));

    encoder_8bit encoder2(.i(i[23:16]),.out(out2),.en(eo1),.gs(gs2),.eo(eo2));

    encoder_8bit encoder3(.i(i[15:8]),.out(out3),.en(eo2),.gs(gs3),.eo(eo3));

    encoder_8bit encoder4(.i(i[7:0]),.out(out4),.en(eo3),.gs(gs4),.eo());

    assign out[4] = (~gs2|~gs1);
    assign out[3] = (~gs1|~gs3);
    assign out[2] = (~out1[2]|~out2[2]|~out3[2]|~out4[2]);
    assign out[1] = (~out1[1]|~out2[1]|~out3[1]|~out4[1]);
    assign out[0] = (~out1[0]|~out2[0]|~out3[0]|~out4[0]);
    assign gs = ~gs1|~gs2|~gs3|~gs4;


endmodule