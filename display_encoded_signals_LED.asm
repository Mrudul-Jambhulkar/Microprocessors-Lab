ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL TAKE_INP
CALL QUANT_ENC
CALL LED_DISP
HERE: SJMP HERE
ORG 130H
delay_10s:
push 00h
mov r0, #2
h1: acall delay_5s
djnz r0, h1
pop 00h
ret

delay_5s:
push 00h
mov r0, #20
h2: acall delay_250ms
djnz r0, h2
pop 00h
ret

delay_250ms:
push 00h
mov r0, #250
h4: acall delay_1ms
djnz r0, h4
pop 00h
ret

delay_1ms:
push 00h
mov r0, #4
h5: acall delay_250us
djnz r0, h5
pop 00h
ret

delay_250us:
push 00h
mov r0, #244
h6: djnz r0, h6
pop 00h
ret

TAKE_INP:
CLR P1.7
CLR  P1.6
CLR  P1.5
SETB  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //1ST INPUT 1ST HALF

MOV A,P1
ANL A,#0FH
MOV B,#16
MUL AB
MOV R3,A
CLR  P1.7
CLR P1.6
SETB  P1.5
CLR  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //1ST INPUT 2ND HALF

MOV A,P1
ANL A,#0FH
ADD A,R3
MOV 60H,A
CLR P1.7
CLR P1.6
SETB  P1.5
SETB P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //2ND INPUT 1ST HALF

MOV A,P1
ANL A,#0FH
MOV B,#16
MUL AB
MOV R3,A
CLR  P1.7
SETB P1.6
CLR  P1.5
CLR  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //2ND INPUT 2ND HALF

MOV A,P1
ANL A,#0FH
ADD A,R3
MOV 61H,A
CLR  P1.7
SETB P1.6
CLR  P1.5
SETB  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //3RD INPUT 1ST HALF

MOV A,P1
ANL A,#0FH
MOV B,#16
MUL AB
MOV R3,A
CLR  P1.7
SETB P1.6
SETB  P1.5
CLR  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //3RD 2ND HALF

MOV A,P1
ANL A,#0FH
ADD A,R3
MOV 62H,A
CLR  P1.7
SETB P1.6
SETB  P1.5
SETB  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //4TH 1ST HALF

MOV A,P1
ANL A,#0FH
MOV B,#16
MUL AB
MOV R3,A
SETB  P1.7
CLR P1.6
CLR  P1.5
CLR  P1.4
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0
ACALL delay_10s //4TH 2ND HALF

MOV A,P1
ANL A,#0FH
ADD A,R3
MOV 63H,A
ACALL delay_10s


QUANT_ENC:
QUANT:
MOV R2,#4
MOV R0,#60H
MOV R1,#70H

SKY:
MOV A,@R0
CLR C
SUBB A,#10
JC HIK

MOV A,@R0
CLR C
SUBB A,#20
JC SHZ

MOV A,@R0
CLR C
SUBB A,#30
JC ITZ

JMP V1

HIK:MOV @R1,#1
LJMP GO
SHZ:MOV @R1,#2
LJMP GO
ITZ:MOV @R1,#4
LJMP GO
V1:MOV @R1,#8
LJMP GO

GO:
INC R0
INC R1
DEC R2
CJNE R2,#0,SKY

RET
LED_DISP:
MOV A,70H 
MOV C,ACC.0
MOV P1.4,C
MOV C,ACC.1
MOV P1.5,C
MOV C,ACC.2
MOV P1.6,C
MOV C,ACC.3
MOV P1.7,C

ACALL delay_5s
MOV A,71H
MOV C,ACC.0
MOV P1.4,C
MOV C,ACC.1
MOV P1.5,C
MOV C,ACC.2
MOV P1.6,C
MOV C,ACC.3
MOV P1.7,C
ACALL delay_5s

MOV A,72H
MOV C,ACC.0
MOV P1.4,C
MOV C,ACC.1
MOV P1.5,C
MOV C,ACC.2
MOV P1.6,C
MOV C,ACC.3
MOV P1.7,C
ACALL delay_5s

MOV A,73H
MOV C,ACC.0
MOV P1.4,C
MOV C,ACC.1
MOV P1.5,C
MOV C,ACC.2
MOV P1.6,C
MOV C,ACC.3
MOV P1.7,C
ACALL delay_5s
LJMP LED_DISP

RET
END

