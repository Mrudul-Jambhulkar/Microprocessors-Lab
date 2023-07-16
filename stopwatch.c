#include <at89c5131.h>
#include "lcd.h"
#include <stdio.h>

sbit T0=P3^4;
sbit ti=P1^0;

void main(void){
unsigned int a;
unsigned int m;
unsigned int min=0;
unsigned int sec=0;
char c[6];
T0=1;
TMOD=0x05;
TL0=0;
TH0=0;
TR0=0;

while(ti!=1);
while(ti==1){
TR0=1;     //now timer on
while(TF0!=1){
a=256*TH0 + TL0;  
m=a/60;    //total no. of seconds=count/60
min=m/60; //no. of min
sec=m%60; //no. of sec
}
TF0=0;  //now TF0 SET BACK TO 0 TIMES>18 MINS
TL0=0;
TH0=0;
while(1){
            if(TL0 == 60){
            sec++;
            TL0 = 0;
            }
            if (sec == 60){
                min++;
                sec = 0;
            }
            
        }
}

lcd_init();
	lcd_cmd(0x80);													//Move cursor to first line
	msdelay(4);
	sprintf(c, "%02d:%02d",min,sec);
  lcd_write_string("     ");
	lcd_write_string(c);
}
