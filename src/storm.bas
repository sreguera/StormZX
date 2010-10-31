  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 90: REM present
  40 GO SUB 910: REM init
  50 GO SUB 260: REM main
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
 220 CLS 
 230 PRINT AT 4,12;"R.I.P."
 240 PAUSE 0: CLS 
 250 RETURN 
 260 REM *** main ***
 270 GO SUB 790: REM dismap
 280 GO SUB 820: REM disitems
 290 GO SUB 340: REM round
 300 IF p(1,4)=0 THEN LET gameon=0
 310 IF p(1,2)=o(1,2) AND p(1,3)=o(1,3) THEN LET gameon=0
 320 IF gameon THEN GO TO 280
 330 RETURN 
 340 REM *** round ***
 350 FOR c=1 TO nps: LET cp=c
 360 IF p(cp,4)= 0 THEN GO TO 400
 370 GO SUB 660: REM getinp
 380 GO SUB 420: REM docmd
 390 GO SUB 820: REM disitems
 400 NEXT c
 410 RETURN 
 420 REM *** docmd ***
 430 IF c$="a" THEN GO SUB 490
 440 IF c$="d" THEN GO SUB 490
 450 IF c$="w" THEN GO SUB 490
 460 IF c$="s" THEN GO SUB 490
 470 IF c$="q" THEN LET gameon=0
 480 RETURN 
 490 REM *** move ***
 500 LET mx=p(cp,2): LET my=p(cp,3)
 510 IF c$="a" THEN LET mx=mx-1
 520 IF c$="d" THEN LET mx=mx+1
 530 IF c$="w" THEN LET my=my-1
 540 IF c$="s" THEN LET my=my+1
 550 IF m$(my+1,mx+1)<>" " THEN GO TO 610
 560 FOR i=1 TO nps
 570 IF i<>cp AND p(i,4)<>0 AND p(i,2)=mx AND p(i,3)=my THEN GO SUB 620: GO TO 610
 580 NEXT i
 590 PRINT AT p(cp,3),p(cp,2);" "
 600 LET p(cp,2)=mx: LET p(cp,3)=my
 610 RETURN 
 620 REM *** attack ***
 630 LET p(i,4)=p(i,4)-1
 640 IF p(i,4)=0 THEN PRINT AT p(i,3),p(i,2);" "
 650 RETURN 
 660 REM *** getinp ***
 670 IF cp=1 THEN GO SUB 700
 680 IF cp<>1 THEN GO SUB 730
 690 RETURN 
 700 REM *** keyinp ***
 710 PAUSE 0: LET c$=INKEY$
 720 RETURN 
 730 REM *** ai_inp***
 740 IF p(1,2)< p(cp,2) THEN LET c$="a"
 750 IF p(1,2)> p(cp,2) THEN LET c$="d"
 760 IF p(1,3)< p(cp,3) THEN LET c$="w"
 770 IF p(1,3)> p(cp,3) THEN LET c$="s"
 780 RETURN 
 790 REM *** dismap ***
 800 FOR i=1 TO mrows: PRINT AT i-1,0;m$(i): NEXT i
 810 RETURN 
 820 REM *** disitems ***
 830 FOR i=1 TO nobs
 840 PRINT AT o(i,3),o(i,2);CHR$ o(i,1)
 850 NEXT i
 860 FOR i=1 TO nps
 870 IF p(i,4)<>0 THEN PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 880 NEXT i
 890 PRINT AT 0,24;"HP: ";p(1,4)
 900 RETURN 
 910 REM *** init ***
 920 RESTORE 
 930 LET c$=" "
 940 LET gameon=1
 950 REM === map data ===
 960 LET mrows=22
 970 DIM m$(mrows, 20)
 980 FOR i=1 TO mrows: READ m$(i): NEXT i
 990 REM === player data ===
1000 LET nps=2
1010 DIM p(nps, 4)
1020 LET cp=1
1030 FOR i=1 TO nps
1040 READ z$: LET p(i,1)=CODE z$
1050 READ p(i,2): READ p(i,3): READ p(i,4)
1060 NEXT i
1070 REM === object data ===
1080 LET nobs=1
1090 DIM o(nobs, 3)
1100 FOR i=1 TO nobs
1110 READ z$: LET o(i,1)=CODE z$
1120 READ o(i,2): READ o(i,3)
1130 NEXT i
1140 RETURN 
1150 REM === map ===
1160 DATA "##########   #######"
1170 DATA "#        #####     #"
1180 DATA "#                  #"
1190 DATA "#        #####     #"
1200 DATA "##### #####  #######"
1210 DATA "    #     #         "
1220 DATA "    ##### #         "
1230 DATA "######### #####     "
1240 DATA "#             #     "
1250 DATA "#             #     "
1260 DATA "#             #     "
1270 DATA "#             #     "
1280 DATA "#             #     "
1290 DATA "#             #     "
1300 DATA "#### ##########     "
1310 DATA "   # #  ############"
1320 DATA "   # #  #          #"
1330 DATA "   # #  #          #"
1340 DATA "   # #  #          #"
1350 DATA "   # ####          #"
1360 DATA "   #               #"
1370 DATA "   #################"
1380 REM === players ===
1390 DATA "@", 10, 10, 5
1400 DATA "h", 7, 10, 5
1410 REM === objects ===
1420 DATA "+", 17, 2
