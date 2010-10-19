  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 70: REM present
  40 GO SUB 800: REM init
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
 200 GO SUB 710: REM dismap
 210 GO SUB 740: REM disitems
 220 GO SUB 260: REM round
 230 IF p(1,4)=0 THEN LET gameon=0
 240 IF gameon THEN GO TO 210
 250 RETURN 
 260 REM *** round ***
 270 FOR c=1 TO nps: LET cp=c
 280 IF p(cp,4)= 0 THEN GO TO 320
 290 GO SUB 580: REM getinp
 300 GO SUB 340: REM docmd
 310 GO SUB 740: REM disitems
 320 NEXT c
 330 RETURN 
 340 REM *** docmd ***
 350 IF c$="a" THEN GO SUB 410
 360 IF c$="d" THEN GO SUB 410
 370 IF c$="w" THEN GO SUB 410
 380 IF c$="s" THEN GO SUB 410
 390 IF c$="q" THEN LET gameon=0
 400 RETURN 
 410 REM *** move ***
 420 LET mx=p(cp,2): LET my=p(cp,3)
 430 IF c$="a" THEN LET mx=mx-1
 440 IF c$="d" THEN LET mx=mx+1
 450 IF c$="w" THEN LET my=my-1
 460 IF c$="s" THEN LET my=my+1
 470 IF m$(my+1,mx+1)<>" " THEN GO TO 530
 480 FOR i=1 TO nps
 490 IF i<>cp AND p(i,4)<>0 AND p(i,2)=mx AND p(i,3)=my THEN GO SUB 540: GO TO 530
 500 NEXT i
 510 PRINT AT p(cp,3),p(cp,2);" "
 520 LET p(cp,2)=mx: LET p(cp,3)=my
 530 RETURN 
 540 REM *** attack ***
 550 LET p(i,4)=p(i,4)-1
 560 IF p(i,4)=0 THEN PRINT AT p(i,3),p(i,2);" "
 570 RETURN 
 580 REM *** getinp ***
 590 IF cp=1 THEN GO SUB 620
 600 IF cp<>1 THEN GO SUB 650
 610 RETURN 
 620 REM *** keyinp ***
 630 PAUSE 0: LET c$=INKEY$
 640 RETURN 
 650 REM *** ai_inp***
 660 IF p(1,2)< p(cp,2) THEN LET c$="a"
 670 IF p(1,2)> p(cp,2) THEN LET c$="d"
 680 IF p(1,3)< p(cp,3) THEN LET c$="w"
 690 IF p(1,3)> p(cp,3) THEN LET c$="s"
 700 RETURN 
 710 REM *** dismap ***
 720 FOR i=1 TO mrows: PRINT AT i-1,0;m$(i): NEXT i
 730 RETURN 
 740 REM *** disitems ***
 750 FOR i=1 TO nps
 760 IF p(i,4)<>0 THEN PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 770 NEXT i
 780 PRINT AT 0,24;"HP: ";p(1,4)
 790 RETURN 
 800 REM *** init ***
 810 LET c$=" "
 820 LET gameon=1
 830 REM === map data ===
 840 LET mrows=22
 850 DIM m$(mrows, 20)
 860 FOR i=1 TO mrows: READ m$(i): NEXT i
 870 REM === player data ===
 880 LET nps=2
 890 DIM p(nps, 4)
 900 LET cp=1
 910 FOR i=1 TO nps
 920 READ z$: LET p(i,1)=CODE z$
 930 READ p(i,2): READ p(i,3): READ p(i,4)
 940 NEXT i
 950 RETURN 
 960 REM === map ===
 970 DATA "##########   #######"
 980 DATA "#        #####     #"
 990 DATA "#                  #"
1000 DATA "#        #####     #"
1010 DATA "##### #####  #######"
1020 DATA "    #     #         "
1030 DATA "    ##### #         "
1040 DATA "######### #####     "
1050 DATA "#             #     "
1060 DATA "#             #     "
1070 DATA "#             #     "
1080 DATA "#             #     "
1090 DATA "#             #     "
1100 DATA "#             #     "
1110 DATA "#### ##########     "
1120 DATA "   # #  ############"
1130 DATA "   # #  #          #"
1140 DATA "   # #  #          #"
1150 DATA "   # #  #          #"
1160 DATA "   # ####          #"
1170 DATA "   #               #"
1180 DATA "   #################"
1190 REM === players ===
1200 DATA "@", 10, 10, 5
1210 DATA "h", 7, 10, 5
