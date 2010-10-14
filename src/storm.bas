  10 REM *** STORM ***
  20 GO SUB 60: REM present
  30 GO SUB 500: REM init
  40 GO SUB 170: REM main
  50 STOP 
  60 REM *** present ***
  70 PRINT "STORMBRINGER"
  80 PRINT "a ... left"
  90 PRINT "d ... right"
 100 PRINT "w ... up"
 110 PRINT "s ... down"
 120 PRINT "q ... quit"
 130 PRINT "PRESS ANY KEY"
 140 PAUSE 0
 150 CLS 
 160 RETURN 
 170 REM *** main ***
 180 GO SUB 420: REM display
 190 GO SUB 380: REM getinp
 200 GO SUB 230: REM docmd
 210 IF gameon THEN GO TO 180
 220 RETURN 
 230 REM *** docmd ***
 240 IF C$="a" THEN GO SUB 300
 250 IF C$="d" THEN GO SUB 300
 260 IF C$="w" THEN GO SUB 300
 270 IF C$="s" THEN GO SUB 300
 280 IF C$="q" THEN LET gameon=0
 290 RETURN 
 300 REM *** move ***
 310 LET mx=p(p,2): LET my=p(p,3)
 320 IF C$="a" THEN LET mx=mx-1
 330 IF C$="d" THEN LET mx=mx+1
 340 IF C$="w" THEN LET my=my-1
 350 IF C$="s" THEN LET my=my+1
 360 IF m$(my+1,mx+1)=" " THEN LET p(p,2)=mx: LET p(p,3)=my
 370 RETURN 
 380 REM *** getinp ***
 390 PAUSE 0
 400 LET C$ =INKEY$
 410 RETURN 
 420 REM *** display ***
 430 FOR i = 1 TO 20: REM map
 440 PRINT AT i-1, 0;m$(i)
 450 NEXT i
 460 FOR i=1 TO 2: REM players
 470 PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 480 NEXT i
 490 RETURN 
 500 REM *** init ***
 510 LET C$ = " "
 520 LET gameon = 1
 530 DIM m$(20, 20): REM map
 540 FOR i=1 TO 20: READ m$(i): NEXT i
 550 DIM p(2, 3): REM players
 560 LET p=1
 570 LET p(1,1)=CODE "@": LET p(1,2)=10: LET p(1,3)=10
 580 LET p(2,1)=CODE "h": LET p(2,2)=7: LET p(2,3)=10
 590 RETURN 
 600 DATA "####################"
 610 DATA "#        ####     ##"
 620 DATA "#                 ##"
 630 DATA "#        ####     ##"
 640 DATA "##### ##############"
 650 DATA "#####     ##########"
 660 DATA "######### ##########"
 670 DATA "######### ##########"
 680 DATA "##             #####"
 690 DATA "##             #####"
 700 DATA "##             #####"
 710 DATA "##             #####"
 720 DATA "#### ###############"
 730 DATA "#### ###############"
 740 DATA "#### ####          #"
 750 DATA "#### ####          #"
 760 DATA "#### ####          #"
 770 DATA "#### ####          #"
 780 DATA "####               #"
 790 DATA "####################"
