module multiplexor(
    input wire select,
    input wire data0,
    input wire data1,
    output wire result
);

    assign result = select ? data1 : data0;

endmodule 