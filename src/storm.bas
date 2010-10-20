  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 90: REM present
  40 GO SUB 860: REM init
  50 GO SUB 250: REM main
  60 GO SUB 210: REM finish
  70 GO TO 30
  80 STOP 
  90 REM *** present ***
 100 BORDER 0: PAPER 0: INK 7: CLS 
 110 PRINT AT 4,9;"STORMBRINGER"
 120 PRINT AT 7,10;"a ... left"
 130 PRINT AT 8,10;"d ... right"
 140 PRINT AT 9,10;"w ... up"
 150 PRINT AT 10,10;"s ... down"
 160 PRINT AT 11,10;"q ... quit"
 170 PRINT AT 14,9;"PRESS ANY KEY"
 180 PAUSE 0
 190 CLS 
 200 RETURN 
 210 REM *** finish ***
 220 CLS : PRINT AT 4,12;"R.I.P."
 230 PAUSE 0: CLS 
 240 RETURN 
 250 REM *** main ***
 260 GO SUB 770: REM dismap
 270 GO SUB 800: REM disitems
 280 GO SUB 320: REM round
 290 IF p(1,4)=0 THEN LET gameon=0
 300 IF gameon THEN GO TO 270
 310 RETURN 
 320 REM *** round ***
 330 FOR c=1 TO nps: LET cp=c
 340 IF p(cp,4)= 0 THEN GO TO 380
 350 GO SUB 640: REM getinp
 360 GO SUB 400: REM docmd
 370 GO SUB 800: REM disitems
 380 NEXT c
 390 RETURN 
 400 REM *** docmd ***
 410 IF c$="a" THEN GO SUB 470
 420 IF c$="d" THEN GO SUB 470
 430 IF c$="w" THEN GO SUB 470
 440 IF c$="s" THEN GO SUB 470
 450 IF c$="q" THEN LET gameon=0
 460 RETURN 
 470 REM *** move ***
 480 LET mx=p(cp,2): LET my=p(cp,3)
 490 IF c$="a" THEN LET mx=mx-1
 500 IF c$="d" THEN LET mx=mx+1
 510 IF c$="w" THEN LET my=my-1
 520 IF c$="s" THEN LET my=my+1
 530 IF m$(my+1,mx+1)<>" " THEN GO TO 590
 540 FOR i=1 TO nps
 550 IF i<>cp AND p(i,4)<>0 AND p(i,2)=mx AND p(i,3)=my THEN GO SUB 600: GO TO 590
 560 NEXT i
 570 PRINT AT p(cp,3),p(cp,2);" "
 580 LET p(cp,2)=mx: LET p(cp,3)=my
 590 RETURN 
 600 REM *** attack ***
 610 LET p(i,4)=p(i,4)-1
 620 IF p(i,4)=0 THEN PRINT AT p(i,3),p(i,2);" "
 630 RETURN 
 640 REM *** getinp ***
 650 IF cp=1 THEN GO SUB 680
 660 IF cp<>1 THEN GO SUB 710
 670 RETURN 
 680 REM *** keyinp ***
 690 PAUSE 0: LET c$=INKEY$
 700 RETURN 
 710 REM *** ai_inp***
 720 IF p(1,2)< p(cp,2) THEN LET c$="a"
 730 IF p(1,2)> p(cp,2) THEN LET c$="d"
 740 IF p(1,3)< p(cp,3) THEN LET c$="w"
 750 IF p(1,3)> p(cp,3) THEN LET c$="s"
 760 RETURN 
 770 REM *** dismap ***
 780 FOR i=1 TO mrows: PRINT AT i-1,0;m$(i): NEXT i
 790 RETURN 
 800 REM *** disitems ***
 810 FOR i=1 TO nps
 820 IF p(i,4)<>0 THEN PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 830 NEXT i
 840 PRINT AT 0,24;"HP: ";p(1,4)
 850 RETURN 
 860 REM *** init ***
 870 RESTORE 
 880 LET c$=" "
 890 LET gameon=1
 900 REM === map data ===
 910 LET mrows=22
 920 DIM m$(mrows, 20)
 930 FOR i=1 TO mrows: READ m$(i): NEXT i
 940 REM === player data ===
 950 LET nps=2
 960 DIM p(nps, 4)
 970 LET cp=1
 980 FOR i=1 TO nps
 990 READ z$: LET p(i,1)=CODE z$
1000 READ p(i,2): READ p(i,3): READ p(i,4)
1010 NEXT i
1020 RETURN 
1030 REM === map ===
1040 DATA "##########   #######"
1050 DATA "#        #####     #"
1060 DATA "#                  #"
1070 DATA "#        #####     #"
1080 DATA "##### #####  #######"
1090 DATA "    #     #         "
1100 DATA "    ##### #         "
1110 DATA "######### #####     "
1120 DATA "#             #     "
1130 DATA "#             #     "
1140 DATA "#             #     "
1150 DATA "#             #     "
1160 DATA "#             #     "
1170 DATA "#             #     "
1180 DATA "#### ##########     "
1190 DATA "   # #  ############"
1200 DATA "   # #  #          #"
1210 DATA "   # #  #          #"
1220 DATA "   # #  #          #"
1230 DATA "   # ####          #"
1240 DATA "   #               #"
1250 DATA "   #################"
1260 REM === players ===
1270 DATA "@", 10, 10, 5
1280 DATA "h", 7, 10, 5
