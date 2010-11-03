  10 REM *** STORM ***
  20 REM (c) S. Reguera 2010
  30 GO SUB 90: REM present
  40 GO SUB 970: REM init
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
 270 GO SUB 800: REM vispyr
 280 GO SUB 880: REM disitems
 290 GO SUB 340: REM round
 300 IF p(1,4)=0 THEN LET gameon=0
 310 IF p(1,2)=o(1,2) AND p(1,3)=o(1,3) THEN LET gameon=0
 320 IF gameon THEN GO TO 280
 330 RETURN 
 340 REM *** round ***
 350 FOR c=1 TO nps: LET cp=c
 360 IF p(cp,4)= 0 THEN GO TO 400
 370 GO SUB 670: REM getinp
 380 GO SUB 420: REM docmd
 390 GO SUB 880: REM disitems
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
 550 IF m$(my+1,mx+1)<>"." THEN GO TO 620
 560 FOR i=1 TO nps
 570 IF i<>cp AND p(i,4)<>0 AND p(i,2)=mx AND p(i,3)=my THEN GO SUB 630: GO TO 620
 580 NEXT i
 590 IF v$(p(cp,3)+1,p(cp,2)+1)="v" THEN PRINT AT p(cp,3),p(cp,2);"."
 600 LET p(cp,2)=mx: LET p(cp,3)=my
 610 IF cp= 1 THEN GO SUB 800
 620 RETURN 
 630 REM *** attack ***
 640 LET p(i,4)=p(i,4)-1
 650 IF p(i,4)=0 THEN PRINT AT p(i,3),p(i,2);"."
 660 RETURN 
 670 REM *** getinp ***
 680 IF cp=1 THEN GO SUB 710
 690 IF cp<>1 THEN GO SUB 740
 700 RETURN 
 710 REM *** keyinp ***
 720 PAUSE 0: LET c$=INKEY$
 730 RETURN 
 740 REM *** ai_inp***
 750 IF p(1,2)< p(cp,2) THEN LET c$="a"
 760 IF p(1,2)> p(cp,2) THEN LET c$="d"
 770 IF p(1,3)< p(cp,3) THEN LET c$="w"
 780 IF p(1,3)> p(cp,3) THEN LET c$="s"
 790 RETURN 
 800 REM *** vispyr ***
 810 FOR x=p(cp,2)-1 TO p(cp,2)+1
 820 FOR y=p(cp,3)-1 TO p(cp,3)+1
 830 PRINT AT y,x;m$(y+1,x+1)
 840 LET v$(y+1,x+1)="v"
 850 NEXT y
 860 NEXT x
 870 RETURN 
 880 REM *** disitems ***
 890 FOR i=1 TO nobs
 900 IF v$(o(i,3)+1,o(i,2)+1)="v" THEN PRINT AT o(i,3),o(i,2);CHR$ o(i,1)
 910 NEXT i
 920 FOR i=1 TO nps
 930 IF p(i,4)<>0 AND v$(p(i,3)+1,p(i,2)+1)="v" THEN PRINT AT p(i,3),p(i,2);CHR$ p(i,1)
 940 NEXT i
 950 PRINT AT 0,24;"HP: ";p(1,4)
 960 RETURN 
 970 REM *** init ***
 980 RESTORE 
 990 LET c$=" "
1000 LET gameon=1
1010 REM === map data ===
1020 LET mrows=22
1030 DIM m$(mrows, 20)
1040 FOR i=1 TO mrows: READ m$(i): NEXT i
1050 DIM v$(mrows, 20)
1060 FOR i=1 TO mrows: LET v$(i)="": NEXT i
1070 REM === player data ===
1080 LET nps=2
1090 DIM p(nps, 4)
1100 LET cp=1
1110 FOR i=1 TO nps
1120 READ z$: LET p(i,1)=CODE z$
1130 READ p(i,2): READ p(i,3): READ p(i,4)
1140 NEXT i
1150 REM === object data ===
1160 LET nobs=1
1170 DIM o(nobs, 3)
1180 FOR i=1 TO nobs
1190 READ z$: LET o(i,1)=CODE z$
1200 READ o(i,2): READ o(i,3)
1210 NEXT i
1220 RETURN 
1230 REM === map ===
1240 DATA "##########   #######"
1250 DATA "#........#####.....#"
1260 DATA "#..................#"
1270 DATA "#........#####.....#"
1280 DATA "#####.#####  #######"
1290 DATA "    #.....#         "
1300 DATA "    #####.#         "
1310 DATA "#########.#####     "
1320 DATA "#.............#     "
1330 DATA "#.............#     "
1340 DATA "#.............#     "
1350 DATA "#.............#     "
1360 DATA "#.............#     "
1370 DATA "#.............#     "
1380 DATA "####.##########     "
1390 DATA "   #.#  ############"
1400 DATA "   #.#  #..........#"
1410 DATA "   #.#  #..........#"
1420 DATA "   #.#  #..........#"
1430 DATA "   #.####..........#"
1440 DATA "   #...............#"
1450 DATA "   #################"
1460 REM === players ===
1470 DATA "@", 10, 10, 5
1480 DATA "h", 7, 10, 5
1490 REM === objects ===
1500 DATA "+", 17, 2
