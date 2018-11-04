module  triangle(inclk,freq,Qout );
  //�������ROM�ĵ�ַ
output[7:0]  Qout;
input			inclk;  //ϵͳʼ�գ�ʱ��Ӧ�ñ�֤D/A��ת�����
reg[1:0]		select=2'd0; //����ѡ�񣬾���ֵ����Ĳ��μ����涨��
input		freq;  //����������ε�Ƶ��
reg[3:0]  count=4'd0;
wire[7:0]			Qout;
wire[7:0]            q;
reg[8:0]			address=9'd0;

always @(posedge freq)
begin
  select=select+1;
  if(select>=3)
   
   select<=2'd0;
  end
always @(posedge inclk)
  begin
  if(count>=10)
     begin
  count<=0;
	case(select)
		0:begin				
			if(address>=256)
			    address<=9'd0;
			 			    
			 else
			     address<=address+9'd1;
			    
			 end 
			 1:begin				
			if(address>=383)
			    address<=9'd257;
			    
			 else if(address<256)
			     address<=256;
			   else
			     address<=address+9'd1;
			     
			 end    
			 2:begin				
			if(address>=512)
			    address<=9'd384;
			  else if(address<384)
			     address<=384;  
			 else
			     address<=address+9'd1;
			     
			 end       					
	endcase
	end
	else
	count<=count+1;

  end 
  bo1 U_ROM(
	.address(address),
	.clock(inclk),
	.q(Qout));
endmodule
