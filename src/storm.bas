  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 70: REM present
  40 GO SUB 660: REM init
  50 GO SUB 190: REM main
  60 STOP 
  70 REM *** present ***
  80 BORDER 0: PAPER 0: INK 7: CLS 
  90 PRINT AT 4,9;"STORMBRINGER"
 100 PRINT AT 7,10;"a ... left"
 110 PRINT AT 8,10;"d ... right"
 120 PRINT AT 9,10;"w ... up"
 130 PRINT AT 10,10;"s ... down"
 140 PRINT AT 11,10;"q ... quit"
 150 PRINT AT 14,9;"PRESS ANY KEY"
 160 PAUSE 0
 170 CLS 
 180 RETURN 
 190 REM *** main ***
 200 GO SUB 590: REM dismap
 210 GO SUB 620: REM disitems
 220 GO SUB 250: REM round
 230 IF gameon THEN GO TO 210
 240 RETURN 
 250 REM *** round ***
 260 FOR c=1 TO nps: LET cp=c
 270 GO SUB 550: REM getinp
 280 GO SUB 320: REM docmd
 290 GO SUB 620: REM disitems
 300 NEXT c
 310 RETURN 
 320 REM *** docmd ***
 330 IF c$="a" THEN GO SUB 390
 340 IF c$="d" THEN GO SUB 390
 350 IF c$="w" THEN GO SUB 390
 360 IF c$="s" THEN GO SUB 390
 370 IF c$="q" THEN LET gameon=0
 380 RETURN 
 390 REM *** move ***
 400 LET mx=p(cp,2): LET my=p(cp,3)
 410 IF c$="a" THEN LET mx=mx-1
 420 IF c$="d" THEN LET mx=mx+1
 430 IF c$="w" THEN LET my=my-1
 440 IF c$="s" THEN LET my=my+1
 450 IF m$(my+1,mx+1)<>" " THEN GO TO 510
 460 FOR i=1 TO nps
 470 IF i<>cp AND p(i,2)=mx AND p(i,3)=my THEN GO SUB 520: GO TO 510
 480 NEXT i
 490 PRINT AT p(cp,3),p(cp,2);" "
 500 LET p(cp,2)=mx: LET p(cp,3)=my
 510 RETURN 
 520 REM *** attack ***
 530 LET p(1,4)=p(1,4)-1
 540 RETURN 
 550 REM *** getinp ***
 560 IF cp=1 THEN PAUSE 0: LET c$=INKEY$
 570 IF cp<>1 THEN LET c$=" "
 580 RETURN 
 590 REM *** dismap ***
 600 FOR i=1 TO mrows: PRINT AT i-1,0;m$(i): NEXT i
 610 RETURN 
 620 REM *** disitems ***
 630 FOR i=1 TO nps: PRINT AT p(i,3),p(i,2);CHR$ p(i,1): NEXT i
 640 PRINT AT 0,24;"HP: ";p(1,4)
 650 RETURN 
 660 REM *** init ***
 670 LET c$=" "
 680 LET gameon=1
 690 REM === map data ===
 700 LET mrows=22
 710 DIM m$(mrows, 20)
 720 FOR i=1 TO mrows: READ m$(i): NEXT i
 730 REM === player data ===
 740 LET nps=2
 750 DIM p(nps, 4)
 760 LET cp=1
 770 FOR i=1 TO nps
 780 READ z$: LET p(i,1)=CODE z$
 790 READ p(i,2): READ p(i,3): READ p(i,4)
 800 NEXT i
 810 RETURN 
 820 REM === map ===
 830 DATA "##########   #######"
 840 DATA "#        #####     #"
 850 DATA "#                  #"
 860 DATA "#        #####     #"
 870 DATA "##### #####  #######"
 880 DATA "    #     #         "
 890 DATA "    ##### #         "
 900 DATA "######### #####     "
 910 DATA "#             #     "
 920 DATA "#             #     "
 930 DATA "#             #     "
 940 DATA "#             #     "
 950 DATA "#             #     "
 960 DATA "#             #     "
 970 DATA "#### ##########     "
 980 DATA "   # #  ############"
 990 DATA "   # #  #          #"
1000 DATA "   # #  #          #"
1010 DATA "   # #  #          #"
1020 DATA "   # ####          #"
1030 DATA "   #               #"
1040 DATA "   #################"
1050 REM === players ===
1060 DATA "@", 10, 10, 5
1070 DATA "h", 7, 10, 5
