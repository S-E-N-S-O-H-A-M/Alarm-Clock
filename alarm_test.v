`include "alarm.v"
module alarm_test;

//Inputs
reg clk,clr;

//Outputs
wire [7:0] hr,min,sec;
wire alarm;

//Instantiate the Unit Under Test
alarm uut(
    .clk(clk),
    .clr(clr),
    .hr(hr),
    .min(min),
    .sec(sec)
);

always #10 clk=~clk;

initial begin
    $dumpfile("alarm_test.vcd");
    $dumpvars(0,alarm_test);
    //Initialize Inputs
    clk=0;clr=1;uut.hr_alm=8'd0;uut.min_alm=8'd0;uut.sec_alm=8'd7;
  	

    //Wait for 100ns for global reset to finish
    #40;clr=0;
    #300;
    $finish();

    //Add stimulus here
end
endmodule