ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL SORT
HERE: SJMP HERE
ORG 130H
// *****************
SORT:
MOV R1,#8H
FADE:
MOV A,60H
CLR C
SUBB A,61H
JC JETT
ADD A,61H
MOV R0,61H
MOV 61H,A
MOV 60H,R0


JETT:
MOV A,61H
CLR C
SUBB A,62H
JC JET

ADD A,62H
MOV R0,62H
MOV 62H,A
MOV 61H,R0

JET:
MOV A,62H
CLR C
SUBB A,63H
JC PH

ADD A,63H
MOV R0,63H
MOV 63H,A
MOV 62H,R0

PH:
MOV A,63H
CLR C
SUBB A,64H
JC RAZ
ADD A,64H
MOV R0,64H
MOV 64H,A
MOV 63H,R0

RAZ:
MOV A,64H
CLR C
SUBB A,65H
JC PHX
ADD A,65H
MOV R0,65H
MOV 65H,A
MOV 64H,R0

PHX:
MOV A,65H
CLR C
SUBB A,66H
JC KJ
ADD A,66H
MOV R0,66H
MOV 66H,A
MOV 65H,R0

KJ:
MOV A,66H
CLR C
SUBB A,67H
JC VIP
ADD A,67H
MOV R0,67H
MOV 67H,A
MOV 66H,R0

VIP:
DEC R1
CJNE R1,#0,FADE

MOV 70H,60H
MOV 71H,61H
MOV 72H,62H
MOV 73H,63H
MOV 74H,64H
MOV 75H,65H
MOV 76H,66H
MOV 77H,67H

RET
END