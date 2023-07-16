#include <at89c5131.h>
#include "lcd.h"
#include <string.h>
code unsigned char display_msg1[]=" ENTER PASSWORD      ";						//Display msg on 1st line of lcd
code unsigned char display_msg2[]="CORRECT PASSWORD      ";		
code unsigned char display_msg3[]=" WRONG PASSWORD      ";		
code unsigned char display_msg4[]=" ACCESS GRANTED    ";		
code unsigned char display_msg5[]=" ACCESS DENIED      ";		

void main()
{
 char buffer[1];  
 char pswd[] = "15A8*D6#";
	unsigned int a;
	unsigned int b;
	char key[8];
	unsigned int i;

	lcd_init();
	lcd_cmd(0x80);													//Move cursor to first line
	msdelay(4);
	lcd_write_string(display_msg1); //displays enter password
	lcd_cmd(0xC0);
	 for (i = 0;i<4;i++){            
        lcd_write_char(' ');
    }
	
for (i = 0; i < 8; i++){
		 P3 = 0x0F;
        while(1){                  
            b = P3;             
            while(b != 0x0F){   
               b = P3;
            }    //prev key released
            b = P3;
            while(b == 0x0F){  
                b = P3;
            }            
            msdelay(20);          //check for debounce
            b = P3;
            if (b == 0x0F){
                continue;
            }
            else {
                break;  //key is now actually pressed
            }
        }
while(1){				
P3=P3&0xef;		
P3=P3|0xe0;  //GND row 0
if(	P3!=0xef){a=P3;break;}		
else{
P3=P3&0xdf;			
P3=P3|0xd0; } //GND row 
if(	P3!=0xdf){a=P3;break;}		
else{
P3=P3&0xbf;		
P3=P3|0xb0; } //GND row 2
if(	P3!=0xbf){a=P3;break;}		
else{
P3=P3&0x7f;	;		
P3=P3|0x70; } //GND row 3
if(	P3!=0x7f){a=P3;break;}		
}			
	if(a==0xee){   //START CHECKING
	key[i]='A';
	  lcd_write_char('A');}
	else if(a==0xed){
	key[i]='3';
	 lcd_write_char('3');}
	else if(a==0xeb){
	key[i]='2';
	 lcd_write_char('2');}
	else if(a==0xe7){
	key[i]='1';
	 lcd_write_char('1');}
	
	else if(a==0xde){   //START CHECKING
	key[i]='B';
	 lcd_write_char('B');}
	else if(a==0xdd){
	key[i]='6';
	 lcd_write_char('6');}
	else if(a==0xdb){
	key[i]='5';
	 lcd_write_char('5');}
	else if(a==0xd7){
	key[i]='4';
	 lcd_write_char('4');}

	else if(a==0xbe){   //START CHECKING
	key[i]='C';
	 lcd_write_char('C');}
	else if(a==0xbd){
	key[i]='9';
	 lcd_write_char('9');}
	else if(a==0xbb){
	key[i]='8';
	 lcd_write_char('8');}
	else if(a==0xb7){
	key[i]='7';
	 lcd_write_char('7');}

else	if(a==0x7e){   //START CHECKING
	key[i]='D';
	 lcd_write_char('D');}
	else if(a==0x7d){
	key[i]='#';
	 lcd_write_char('#');}
	else if(a==0x7b){
	key[i]='0';
	 lcd_write_char('0');}
	else if(a==0x77){
	key[i]='*';
	 lcd_write_char('*');}	

} // now key has pswd
if(key[0]==pswd[0]&& key[1]==pswd[1]&&key[2]==pswd[2]&& key[3]==pswd[3]&&key[4]==pswd[4]&& key[5]==pswd[5]&&key[6]==pswd[6]&& key[7]==pswd[7]  ) {    //IF PSWD MATCHES
	lcd_init();
	lcd_cmd(0x80);													//Move cursor to first line
	msdelay(4);
	lcd_write_string(display_msg2);
	lcd_cmd(0xC0);													//Move cursor to 2nd line of LCD
	msdelay(4);
	lcd_write_string(display_msg4);     //shows access granted
	while(1);
}
else {    //IF PSWD not MATCHES
lcd_init();
	lcd_cmd(0x80);													//Move cursor to first line
	msdelay(4);
	lcd_write_string(display_msg3);
	lcd_cmd(0xC0);													//Move cursor to 2nd line of LCD
	msdelay(4);
	lcd_write_string(display_msg5);    //shows access denied
  while(1);	
}
}