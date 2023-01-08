module encoder_8bit(i,out,en,gs,eo);

    input [7:0]i;
    input en;
    output gs,eo;
    output [2:0]out;

    assign out[2] = ~((~en&~i[7]) | (~en&~i[6]) | (~en&~i[5]) | (~en&~i[4]));
    assign out[1] = ~((~en&~i[7]) | (~en&~i[6]) | (~en&i[5]&i[4]&~i[3]) | (~en&~i[2]&i[5]&i[4]));
    assign out[0] = ~((~en&~i[7]) | (~en&~i[5]&i[6]) | (~en&i[6]&i[4]&~i[3]) | (~en&i[4]&i[6]&i[2]&~i[1]));
    assign eo = ~(i[0]&i[1]&i[2]&i[3]&i[4]&i[5]&i[6]&i[7]&~en);
    assign gs = ~(eo & ~en);


endmodule