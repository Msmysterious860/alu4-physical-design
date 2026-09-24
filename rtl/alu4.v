module alu4 (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire [2:0] op,
    output reg  [3:0] result,
    output reg        carry
);

reg [4:0] temp;

always @(posedge clk) begin
    if (!rst_n) begin
        result <= 4'b0000;
        carry  <= 1'b0;
    end
    else begin
        case (op)

            3'b000: begin
                temp = {1'b0, a} + {1'b0, b};
                result <= temp[3:0];
                carry  <= temp[4];
            end

            3'b001: begin
                temp = {1'b0, a} - {1'b0, b};
                result <= temp[3:0];
                carry  <= temp[4];
            end

            3'b010: begin
                result <= a & b;
                carry  <= 1'b0;
            end

            3'b011: begin
                result <= a | b;
                carry  <= 1'b0;
            end

            3'b100: begin
                result <= a ^ b;
                carry  <= 1'b0;
            end

            3'b101: begin
                result <= ~a;
                carry  <= 1'b0;
            end

            3'b110: begin
                result <= a << 1;
                carry  <= a[3];
            end

            3'b111: begin
                result <= (a > b) ? 4'b0001 : 4'b0000;
                carry  <= 1'b0;
            end

            default: begin
                result <= 4'b0000;
                carry  <= 1'b0;
            end

        endcase
    end
end

endmodule
