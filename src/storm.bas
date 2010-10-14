  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 70: REM present
  40 GO SUB 510: REM init
  50 GO SUB 180: REM main
  60 STOP 
  70 REM *** present ***
  80 PRINT "STORMBRINGER"
  90 PRINT "a ... left"
 100 PRINT "d ... right"
 110 PRINT "w ... up"
 120 PRINT "s ... down"
 130 PRINT "q ... quit"
 140 PRINT "PRESS ANY KEY"
 150 PAUSE 0
 160 CLS 
 170 RETURN 
 180 REM *** main ***
 190 GO SUB 430: REM display
 200 GO SUB 390: REM getinp
 210 GO SUB 240: REM docmd
 220 IF gameon THEN GO TO 190
 230 RETURN 
 240 REM *** docmd ***
 250 IF C$="a" THEN GO SUB 310
 260 IF C$="d" THEN GO SUB 310
 270 IF C$="w" THEN GO SUB 310
 280 IF C$="s" THEN GO SUB 310
 290 IF C$="q" THEN LET gameon=0
 300 RETURN 
 310 REM *** move ***
 320 LET mx=p(p,2): LET my=p(p,3)
 330 IF C$="a" THEN LET mx=mx-1
 340 IF C$="d" THEN LET mx=mx+1
 350 IF C$="w" THEN LET my=my-1
 360 IF C$="s" THEN LET my=my+1
 370 IF m$(my+1,mx+1)=" " THEN LET p(p,2)=mx: LET p(p,3)=my
 380 RETURN 
 390 REM *** getinp ***
 400 PAUSE 0
 410 LET C$ =INKEY$
 420 RETURN 
 430 REM *** display ***
 440 FOR i = 1 TO 20: REM map
 450 PRINT AT i-1, 0;m$(i)
 460 NEXT i
 470 FOR i=1 TO 2: REM players
 480 PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 490 NEXT i
 500 RETURN 
 510 REM *** init ***
 520 LET C$ = " "
 530 LET gameon = 1
 540 DIM m$(20, 20): REM map
 550 FOR i=1 TO 20: READ m$(i): NEXT i
 560 DIM p(2, 3): REM players
 570 LET p=1
 580 LET p(1,1)=CODE "@": LET p(1,2)=10: LET p(1,3)=10
 590 LET p(2,1)=CODE "h": LET p(2,2)=7: LET p(2,3)=10
 600 RETURN 
 610 DATA "####################"
 620 DATA "#        ####     ##"
 630 DATA "#                 ##"
 640 DATA "#        ####     ##"
 650 DATA "##### ##############"
 660 DATA "#####     ##########"
 670 DATA "######### ##########"
 680 DATA "######### ##########"
 690 DATA "##             #####"
 700 DATA "##             #####"
 710 DATA "##             #####"
 720 DATA "##             #####"
 730 DATA "#### ###############"
 740 DATA "#### ###############"
 750 DATA "#### ####          #"
 760 DATA "#### ####          #"
 770 DATA "#### ####          #"
 780 DATA "#### ####          #"
 790 DATA "####               #"
 800 DATA "####################"
