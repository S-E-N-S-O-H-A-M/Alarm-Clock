module alarm (clk, clr, hr, min, sec, alarm); 

input clk, clr;
output reg [7:0] hr, min, sec;
output reg alarm;
reg [7:0] hr_alm,min_alm, sec_alm; /// To set alarm time 

always @(posedge clk or clr)
begin 
    if (clr)
    begin
        hr=8'd0;
        min=8'd0; 
        sec=8'd0;
        alarm=1'b0;
    end 
end

///Sec clock

always @(posedge clk)
begin 
    if (sec>=59)
        sec=0;
    else
        sec=sec+1; 
    end

///min clock

always @(posedge clk) 
begin
if (sec>=59 && min<=59)
    min=min+1; 
else if (min>=59)
    min=0;
end

///hours clock 
always @(posedge clk)
begin
    if (min>=59 && hr<=24) 
        hr=hr+1;
    else if (hr>24)
        hr=0;
    end

always @(posedge clk)
begin
if (hr==hr_alm && min==min_alm && sec==sec_alm)
begin
    alarm=1'b1;
    $display ("hr=%d, min=%d, sec=%d alaram ringing",hr,min,sec);
end 
else
    alarm=1'b0;
end

endmodule