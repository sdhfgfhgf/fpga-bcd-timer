// A 4-digit BCD counter with HEX3, HEX2, HEX1 and HEX0 displaying decimal counting digits with (approximately) 10, 1, 0.1, 0.01 second columns.

module Lab5II (CLOCK_50, KEY, HEX3, HEX2, HEX1, HEX0, LEDG);
 input CLOCK_50;
 input [3:0] KEY;
 output [0:6] HEX3, HEX2, HEX1, HEX0;
 output reg [7:0] LEDG;
 reg [18:0] count;
 reg [3:0] bcd0, bcd1, bcd2, bcd3;
 always @(posedge CLOCK_50)
 begin
   LEDG <= count[7:0];
   count <= count + 1'b1;
 end
 always @(posedge CLOCK_50)
   if (KEY[0] == 0)
   begin
     bcd0 <= 4'h0;
     bcd1 <= 4'h0;
     bcd2 <= 4'h0;
     bcd3 <= 4'h0;
   end
   else if (count == 0)
   begin
     if (bcd0 == 4'h9)
     begin
       bcd0 <= 4'h0;
       if (bcd1 == 4'h9)
         begin
           bcd1 <= 4'h0;
           if (bcd2 == 4'h9)
           begin
             bcd2 <= 4'h0;
              if (bcd3 == 4'h9)
              begin
                bcd3 <= 4'h0;
              end
              else
                bcd3 <= bcd3 + 1'b1;
           end
           else
           begin
            bcd2 <= bcd2 + 1'b1;
           end
         end
         else
         begin
           bcd1 <= bcd1 + 1'b1;
         end
     end
     else
     begin
       bcd0 <= bcd0 + 1'b1;
     end
   end
 bcd7seg digit3 (bcd3, HEX3); // HEX3 displays the value of bcd3.
 bcd7seg digit2 (bcd2, HEX2); // HEX2 displays the value of bcd2.
 bcd7seg digit1 (bcd1, HEX1); // HEX1 displays the value of bcd1.
 bcd7seg digit0 (bcd0, HEX0); // HEX0 displays the value of bcd0.
endmodule

// The module bcd7seg displays the bcd value on the specified 7-segment display.
module bcd7seg (bcd, display);
 input [3:0] bcd;
 output [0:6] display;
 reg [0:6] display;
 always @ (bcd)
 case (bcd)
   4'h0: display = 7'b0000001;
   4'h1: display = 7'b1001111;
   4'h2: display = 7'b0010010;
   4'h3: display = 7'b0000110;
   4'h4: display = 7'b1001100;
   4'h5: display = 7'b0100100;
   4'h6: display = 7'b1100000;
   4'h7: display = 7'b0001111;
   4'h8: display = 7'b0000000;
   4'h9: display = 7'b0001100;
   default: display = 7'b1111111;
 endcase
endmodule
