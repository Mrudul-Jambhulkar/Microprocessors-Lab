ORG 0H
LJMP MAIN
ORG 100H
MAIN:
CALL MUSIC
HERE: SJMP HERE
ORG 130H

delay_sa:
push 00h
mov r0, #1
lcall delay_1ms
lcall delay_250us
lcall delay_250us
lcall delay_250us
lcall delay_200us

pop 00h
ret

delay_re:
push 00h
mov r0, #1
br: acall delay_1ms
djnz r0, br

mov r1,#180
ee1:djnz r1,ee1

mov r1,#180
ee2:djnz r1,ee2

mov r1,#180
cv2:djnz r1,cv2

mov r1,#180
cv3:djnz r1,cv3

pop 00h
ret

delay_ga:
push 00h
mov r0, #1
xy: acall delay_1ms
djnz r0, xy

mov r1,#180
pyq3:djnz r1,pyq3

mov r1,#180
py4:djnz r1,py4

mov r1,#180
py5:djnz r1,py5

pop 00h
ret

delay_ma:
push 00h
mov r0, #2
uwu: lcall delay_1ms
lcall delay_250us
lcall delay_200us
pop 00h
ret


delay_1ms:
push 00h
mov r0, #4
h5: acall delay_250us
djnz r0, h5
pop 00h
ret

delay_200us:
push 00h
mov r0, #194
wai: djnz r0, wai
pop 00h
ret 


delay_250us:
push 00h
mov r0, #244
h6: djnz r0, h6
pop 00h
ret 


MUSIC:
SETB P1.3
SETB P1.2
SETB P1.1
SETB P1.0

SA:
MOV A,P1
ANL A,#0FH
CJNE A,#1,RE
LCALL delay_sa
CPL P0.7
LJMP SA

RE: 
MOV A,P1
ANL A,#0FH
CJNE A,#3,GA
LCALL delay_re
CPL P0.7
LJMP RE
 
GA:
MOV A,P1
ANL A,#0FH
CJNE A,#7,MA
LCALL delay_ga
CPL P0.7
LJMP GA

MA: 
MOV A,P1
ANL A,#0FH
CJNE A,#15,SA
LCALL delay_ma
CPL P0.7
LJMP MA

RET
END

