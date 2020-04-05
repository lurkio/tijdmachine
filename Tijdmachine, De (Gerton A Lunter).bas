5 *TV255,1
10 GOTO1000
20 @%=0:GOTO1010
100 CLS:RETURN
110 PRINTTAB(HO,VE);:RETURN
120 HO=POS:VE=VPOS:RETURN
200 IN$=INKEY$0:RETURN
210 IN$=GET$:RETURN
250 VDU7:RETURN
260 RV=RND(1):RETURN
270 FR=(?5-?3)*256+?4-?2:RETURN
300 SR$=STR$SR:RETURN
310 @%=&1020000+CN*256+CT:SR$=STR$SR:IFVALSR$=0SR$=STR$0
311 @%=0:IFMID$(SR$,LENSR$-CN,1)<>"."ORINSTR(SR$,"E")SR$=STRING$(CT,"*"):RETURN
312 IFCN=0SR$=LEFT$(SR$,LENSR$-1)
313 IFLENSR$>CT SR$=STRING$(CT,"*")
314 SR$=STRING$(CT-LENSR$," ")+SR$:RETURN
350 *fx3,10
351 PRINTSR$;:*fx3
352 RETURN
360 *fx3,10
361 PRINT:*fx3
362 RETURN
1000 A=400:GOTO 20:REM DE TIJDMACHINE

1010 GOSUB 10000:E$="KIJK"
1010 GOSUB 10000:E$="LOOK"

1100 PT=PT-1:IF P=6 THEN BL=BL+1
1110 DK=DR
1120 IF LP<>1 THEN 1130
1125 L$="":I$="0":GOSUB 12000:IF W=-1 THEN 4100
1130 IF P<>6 THEN 1140

1132 IF BL>8 THEN PRINT "De geur van de bloemen bedwelmt je."
1132 IF BL>8 THEN PRINT "The scent of the flowers intoxicates"'"you."

1133 IF BL>8 THEN 3990
1134 IF BL<6 THEN 1140

1135 PRINT "  De vreemde, witte bloemen ruiken"
1135 PRINT "  The strange, white flowers smell"

1136 PRINT "heel eigenaardig...":L$="witte bloemen"
1136 PRINT "very peculiar...":L$="white flowers"

1140 IF PT<=0 THEN 3990
1145 IF LP=0 THEN 1370

1150 IF W+VP=2 THEN PRINT "  Weena loopt met je mee.":WP=P
1150 IF W+VP=2 THEN PRINT "  Weena comes with you.":WP=P

1155 GOSUB 260:LM=RV
1160 IF DK=1 THEN 14000
1170 IF P=0 THEN P=6:LP=1:VP=0:GOTO 1100
1180 IF P=-1 THEN P=4:LP=1:VP=0:GOTO 1100
1185 IF P=-2 THEN P=ZX:LP=1:VP=0:GOTO 1100
1190 S=0:IF (WP=P) AND (W=0) THEN S=2
1200 VP=0:FOR A=1 TO AO
1210 IF ((G(A)<>P) OR (A-1+SC=0)) AND (S<>2) THEN 1250

1220 IF S<>1 THEN PRINT "  Je ziet hier:":S=S+1
1220 IF S<>1 THEN PRINT "  You can see:":S=S+1

1230 IF S=3 THEN S=1:PRINT "Weena":W=1:GOTO 1250
1240 PRINT G$(A)
1250 NEXT A

1270 PRINT "  Mogelijke uitgangen zijn:"
1270 PRINT "  Possible exits are:"

1280 FOR A=1 TO 10
1290 IF D(P,A)=0 THEN 1310
1300 GOSUB 19000:PRINT " ";
1310 NEXT A:PRINT
1320 IF L=0 THEN 1370
1330 GOSUB 260:IF RV>.05 THEN 1370

1340 PRINT "  Een plotselinge windvlaag blaast de"
1340 PRINT "  A sudden gust of wind blows the"

1350 PRINT "lamp uit.":L=0
1350 PRINT "lamp out.":L=0

1370 IF DK=1 THEN PRINT "  De draak kijkt je woest en hongerig"
1370 IF DK=1 THEN PRINT "  The dragon looks at you angrily"

1372 IF DK=1 THEN PRINT "aan."
1372 IF DK=1 THEN PRINT "and hungrily."

1373 Q$="  Je bent "
1373 Q$="  You are "

1374 IF PT>=5 THEN 1380

1375 PRINT Q$;"uitgeput en erg verzwakt. Je"
1375 PRINT Q$;"exhausted and very weak. You"

1378 PRINT "kunt geen stap meer verzetten.":GOTO 1400
1378 PRINT "can't take another step.":GOTO 1400

1380 IF PT<8 THEN PRINT Q$;"erg hongerig.":GOTO 1400
1380 IF PT<8 THEN PRINT Q$;"very hungry.":GOTO 1400

1390 IF PT<11 THEN PRINT Q$;"vermoeid en hongerig.":GOTO 1400
1390 IF PT<11 THEN PRINT Q$;"tired and hungry.":GOTO 1400

1396 IF PT>=15 THEN 1400

1397 PRINT "  Je zou zo zoetjesaan eens aan een"
1397 PRINT "  You should start thinking about"

1398 PRINT "maaltijd moeten gaan denken."
1398 PRINT "eating."

1400 IF (P=2) AND (W=1) THEN 5000
1405 IF LP=0 THEN 1420
1410 PRINT "======================================="
1420 PRINT:IF E$<>"" THEN LP=0:GOTO 1427

1425 PRINT "Wat wil je doen?":INPUT E$:LP=0:CP=0
1425 PRINT "What now?":INPUT E$:LP=0:CP=0

1427 GOSUB 18000:CP=1:IF C$="" THEN 1425
1430 D$=MID$(C$+"   ",1,3)

1440 A$="N  NO O  ZO Z  ZW W  NW OP NEE"
1440 A$="N  NE E  SE S  SW W  NW UP DOW"

1450 B$="n  no o  zo z  zw w  nw op nee"
1450 B$="n  ne e  se s  sw w  nw up dow"

1460 GOSUB 16000:IF C=0 THEN 1520

1470 IF D(P,C)=0 THEN PRINT "Daar kun je niet heen.":GOTO 3800
1470 IF D(P,C)=0 THEN PRINT "You can't go there.":GOTO 3800

1480 IF PT<5 THEN 1510
1490 ZX=P:P=D(P,C):LP=1:VP=1:IF P=30 THEN W=0

1500 A=C:PRINT "Je gaat ";
1500 A=C:PRINT "You go ";

1502 IF A<9 THEN PRINT "naar het ";
1502

1505 GOSUB 19000:IF A<9 THEN PRINT "en.";
1505 GOSUB 19000

1506 PRINT:FOR A=1 TO 500:NEXT A:GOTO 1100

1510 PRINT "Je bent te zwak om te lopen.":E$="":GOTO 1400
1510 PRINT "You are too weak to walk.":E$="":GOTO 1400

1520 A$="KIJOPELAMINVPAKLEGEETONDSTOHEL"
1520 A$="LOOOPELAMINVGETDROEATEXAQUIHEL"

1530 B$="kijopelaminvpaklegeetondstohel"
1530 B$="looopelaminvgetdroeatexaquihel"

1540 GOSUB 16000:IF C=0 THEN 1610
1550 IF C=1 THEN LP=1
1555 IF C>5 THEN 1570
1560 ON C GOTO 1100,2000,2100,2200,2300
1570 ON C-5 GOTO 2400,2500,2800,6000,7000

1610 PRINT "Ik begrijp je niet.":E$="":GOTO 1400
1610 PRINT "I don't understand.":E$="":GOTO 1400

2000 IF P=2 THEN 2010
2002 IF P=6 THEN 2040
2004 IF P=25 THEN 2080

2006 PRINT "Je kunt hier niets openen.":GOTO 3800
2006 PRINT "You can't open anything here.":GOTO 3800

2010 IF BK<>1 THEN 2006

2015 PRINT "De brandkast heeft een nummerslot."
2015 PRINT "The safe has a combination lock."

2020 PRINT "Welke combinatie wil je proberen?"
2020 PRINT "What combination will you try?"

2025 PRINT ">>>";:INPUT CO

2030 IF BC<>CO THEN PRINT "De combinatie is fout.":GOTO 1100
2030 IF BC<>CO THEN PRINT "The combination is wrong.":GOTO 1100

2031 PRINT "Het slot klikt zachtjes, en de brand-"
2031 PRINT "The lock clicks softly, and the safe"

2032 PRINT "kast gaat open. Binnen ligt een kris-"
2032 PRINT "opens. Inside is a crystal rod."
2033 PRINT "tallen staaf."
2033

2034 G(2)=P:BK=2:GOTO 1100
2040 IF G(8)<>0 THEN 2060

2045 PRINT "Je forceert het paneel met het breek-"
2045 PRINT "You force the panel with the crowbar."

2050 PRINT "ijzer. Het paneel is open."
2050 PRINT "The panel is open."

2055 LP=1:D(P,1)=5:GOSUB 15000:GOTO 1100

2060 PRINT "Je probeert het paneel open te breken."
2060 PRINT "You try to break the panel open. It's"

2070 PRINT "Met je blote handen gaat het in ieder"
2070 PRINT "impossible with your bare hands."

2075 PRINT "geval niet.":GOTO 1100
2075 GOTO 1100

2080 IF G(10)=0 THEN 2090

2085 PRINT "De deur zit op slot.":GOTO 1100
2085 PRINT "The door is locked.":GOTO 1100

2090 PRINT "Je maakt de deur open met de sleutel."
2090 PRINT "You open the door with the key."

2095 LP=1:D(P,9)=26:GOSUB 15000:GOTO 1100

2100 IF LEN(C$)<>8 THEN 1610
2100 IF LEN(C$)<>8ANDLEN(C$)<>7 THEN 1610

2110 D$=MID$(C$,6,3)

2120 IF (D$="AAN") OR (D$="aan") THEN 2150
2120 IF (D$="ON") OR (D$="on") THEN 2150

2130 IF (D$<>"UIT") AND (D$<>"uit") THEN 1610
2130 IF (D$<>"OFF") AND (D$<>"off") THEN 1610

2135 IF G(11)<>0 THEN 2155

2140 IF L=0 THEN PRINT "De lamp was al uit.":GOTO 1100
2140 IF L=0 THEN PRINT "The lamp was already off.":GOTO 1100

2145 L=0:PRINT "O.K.":GOTO 1100

2150 IF L=1 THEN PRINT "De lamp was al aan.":GOTO 1100
2150 IF L=1 THEN PRINT "The lamp was already on.":GOTO 1100

2155 IF G(11)<>0 THEN PRINT "Je hebt geen lamp.":GOTO 3800
2155 IF G(11)<>0 THEN PRINT "You don't have a lamp.":GOTO 3800

2156 IF G(14)<>0 THEN PRINT "Je hebt geen lucifers.":GOTO 3800
2156 IF G(14)<>0 THEN PRINT "You don't have any matches.":GOTO 3800

2157 IF (P<35) OR (P=42) OR (LM>.4) THEN 2160

2158 PRINT "Het waait nu te hard om de lamp aan"
2158 PRINT "It's too windy to light the lamp now."

2159 PRINT "te steken.":GOTO 3800
2159 GOTO 3800

2160 L=1:PRINT "O.K.":GOTO 1100

2200 PRINT "You have:":S=0

2210 FOR A=1 TO AO:IF G(A)<>0 THEN 2230
2220 S=1:PRINT "  ";G$(A)
2230 NEXT A

2240 IF S=0 THEN PRINT "  Niets."
2240 IF S=0 THEN PRINT "  Nothing."

2250 GOTO 1100
2300 S=0:B=0:Q=-1:FOR A=1 TO AO
2310 IF G(A)=P THEN S=S+1:Q=A
2315 IF G(A)=0 THEN B=B+1
2320 NEXT A:M=SGN(LEN(L$))

2325 IF B>=4 THEN PRINT "Je kunt niets meer dragen.":GOTO 3800
2325 IF B>=4 THEN PRINT "You can't carry anything else.":GOTO 3800

2330 IF S+M=0 THEN PRINT "Er ligt hier niets.":GOTO 3800
2330 IF S+M=0 THEN PRINT "There's nothing here.":GOTO 3800

2340 IF S+M=1 THEN 2390

2345 PRINT "Wat wil je pakken:"
2345 PRINT "What do you want to take:"

2350 I=1:FOR Q=1 TO S
2355 IF G(I)<>P THEN I=I+1:GOTO 2355
2360 PRINT " ";Q;": ";G$(I):I=I+1:NEXT Q
2362 IF M<>0 THEN PRINT " ";Q;": ";L$
2365 GOSUB 17000

2370 IF (V<1) OR (V>S+M) THEN PRINT "Je pakt niets.":GOTO 1100
2370 IF (V<1) OR (V>S+M) THEN PRINT "You don't take anything.":GOTO 1100

2372 IF V>S THEN PRINT "Je kunt dat niet pakken.":GOTO 3800
2372 IF V>S THEN PRINT "You can't take that.":GOTO 3800

2375 I=1:FOR Q=1 TO V
2380 IF G(I)<>P THEN I=I+1:GOTO 2380
2385 I=I+1:NEXT Q:Q=I-1
2390 IF (Q=1) AND (SC=0) THEN S=0:GOTO 2330
2391 IF Q=-1 THEN V=9:GOTO 2372

2392 IF Q=15 THEN PRINT "Het is te zwaar.":GOTO 3800
2392 IF Q=15 THEN PRINT "It's too heavy.":GOTO 3800

2394 PRINT "Je pakt: ";G$(Q)
2394 PRINT "You take: ";G$(Q)

2396 G(Q)=0:GOTO 1100
2400 S=0:FOR A=1 TO AO
2410 IF G(A)=0 THEN S=S+1:Q=A
2420 NEXT A

2430 IF S=0 THEN PRINT "Je hebt niets.":E$="":GOTO 1400
2430 IF S=0 THEN PRINT "You have nothing.":E$="":GOTO 1400

2440 IF S=1 THEN 2490

2441 PRINT "Wat wil je neerleggen?":I=1:FOR Q=1 TO S
2441 PRINT "What do you want to drop?":I=1:FOR Q=1 TO S

2445 IF G(I)<>0 THEN I=I+1:GOTO 2445
2450 PRINT " ";Q;": ";G$(I):I=I+1
2455 NEXT Q
2460 GOSUB 17000

2465 IF (V<1) OR (V>S) THEN PRINT "Je doet niets.":GOTO 1400
2465 IF (V<1) OR (V>S) THEN PRINT "You do nothing.":GOTO 1400

2470 I=1:FOR Q=1 TO V
2475 IF G(I)<>0 THEN I=I+1:GOTO 2475
2480 I=I+1:NEXT Q:Q=I-1
2490 PRINT "O.K.":G(Q)=P
2491 DE=0:IF (Q=3) OR (Q=5) OR (Q=13) THEN DE=1
2492 IF (DE=1) AND (DR=1) THEN 3200
2493 IF Q=11 THEN L=0
2495 IF (P>29) AND (P<33) THEN 3500
2496 IF Q<>6 THEN 1100

2497 PRINT "Je zet de urn wat onhandig neer. De urn"
2497 PRINT "You clumsily drop the urn. The urn"

2498 PRINT "valt in scherven uiteen."
2498 PRINT "shatters into fragments."

2499 G(6)=-1:G(9)=P:GOTO 1100

2500 IF G(13)=0 THEN PRINT "Je eet de ";G$(13):GOTO 3100
2500 IF G(13)=0 THEN PRINT "You eat the ";G$(13):GOTO 3100

2505 IF G(3)=0 THEN PRINT "Je eet het ontbijt.":GOTO 2530
2505 IF G(3)=0 THEN PRINT "You eat breakfast.":GOTO 2530

2510 IF G(5)<>0 THEN PRINT "Je hebt niets om te eten.":GOTO 3800
2510 IF G(5)<>0 THEN PRINT "You have nothing to eat.":GOTO 3800

2515 PRINT "Je eet de vruchten."
2515 PRINT "You eat the fruits."

2520 G(5)=-1:GOTO 2540
2530 G(3)=-1
2540 PT=100:GOTO 1100
2600 IF SC=1 THEN 2870

2605 PRINT "Je haalt het schilderij weg.":SC=1
2605 PRINT "You move the painting away.":SC=1

2610 PRINT "Achter het schilderij zie je een"
2610 PRINT "Behind the painting you see a safe."

2620 PRINT "brandkast.":BK=1
2620 BK=1

2630 GOTO 1100

2700 PRINT "Je leest ze vluchtig door. Je ziet"
2700 PRINT "You read them quickly. You see"

2710 PRINT "ingewikkelde formules, en kreten als"
2710 PRINT "complicated formulas, and phrases like"

2720 PRINT "'vierde dimensie', en 'ruimte-tijd-"
2720 PRINT "'fourth dimension' and 'space-time"

2730 PRINT "continuum', en getallen, zoals 4536,"
2730 PRINT "continuum', and numbers such as 4536,"

2740 PRINT "7285,";BC;", 1435":GOTO 1100
2740 PRINT "7285,";BC;",1435":GOTO1100

2800 S=0:FOR A=1 TO AO
2802 IF (G(A)=0) OR (G(A)=P) THEN S=S+1:Q=A
2804 NEXT A
2805 LL=LEN(L$)

2806 IF S+LL=0 THEN PRINT "Je hebt niets.":GOTO 3800
2806 IF S+LL=0 THEN PRINT "You have nothing.":GOTO 3800

2807 IF S=0 THEN 3400
2808 IF (S=1) AND (LL=0) THEN 2850

2810 PRINT "Wat wil je onderzoeken?"
2810 PRINT "What do you want to examine?"

2812 I=1:FOR A=1 TO S
2814 IF (G(I)<>0) AND (G(I)<>P) THEN I=I+1:GOTO 2814
2816 PRINT " ";A;": ";G$(I):I=I+1
2818 NEXT A:IF L$<>"" THEN PRINT " ";A;": ";L$:S=A
2819 GOSUB 17000

2820 IF (V<1) OR (V>S) THEN PRINT "Je doet niets.":GOTO 3800
2820 IF (V<1) OR (V>S) THEN PRINT "You do nothing.":GOTO 3800

2822 IF V+SGN(LEN(L$))>S THEN 3400
2824 Q=0:FOR A=1 TO V:Q=Q+1
2825 IF (G(Q)<>0) AND (G(Q)<>P) THEN Q=Q+1:GOTO 2825
2826 NEXT A

2850 PRINT "Je onderzoekt: ";G$(Q):PRINT
2850 PRINT "You examine: ";G$(Q):PRINT

2851 IF Q=1 THEN 2600
2855 IF Q=4 THEN 2700
2860 IF Q=9 THEN 2900
2865 IF Q=7 THEN 3000
2866 IF Q=13 THEN 3300
2867 IF Q=15 THEN 3700

2870 PRINT "Je ziet niets bijzonders.":GOTO 1100
2870 PRINT "You see nothing special.":GOTO 1100

2900 PRINT "Tussen de scherven ligt een kleine"
2900 PRINT "There is a small key amongst the"

2910 PRINT "sleutel.":G(10)=P:GOTO 1100
2910 PRINT "fragments.":G(10)=P:GOTO 1100

3000 PRINT "Het boek is heel erg oud en stoffig. Je"
3000 PRINT "The book is very old and dusty. You can"

3010 PRINT "kunt nog net de titel ontcijferen:"
3010 PRINT "just about decipher the title:"
 
3020 PRINT "'The Time Machine', door HG Wells.":GOTO 1100
3020 PRINT "'The Time Machine', by HG Wells.":GOTO 1100

3100 PRINT "De ";G$(13);" is vergiftigd.":PT=0
3100 PRINT "The ";G$(13);" is poisoned.":PT=0

3110 GOTO 1140
3200 G(Q)=-1:IF Q=13 THEN 3210

3202 PRINT "De draak eet ";
3202 PRINT "The dragon eats ";

3204 IF Q=3 THEN PRINT "het op."
3204 IF Q=3 THEN PRINT "it."

3206 IF Q=5 THEN PRINT "ze op."
3206 IF Q=5 THEN PRINT "them."

3208 GOTO 1100

3210 PRINT "De draak eet de ";G$(13);" op."
3210 PRINT "The dragon eats the ";G$(13);"."

3215 PRINT "  De taart is vergiftigd. Met zijn"
3215 PRINT "  The cake is poisoned. With its"

3220 PRINT "laatste ademtocht slaakt hij een ver-"
3220 PRINT "last breath it gives a terrible cry,"

3225 PRINT "schrikkelijke kreet, en sterft."
3225 PRINT "and dies."

3230 G(15)=P:DR=2:I$="0":GOTO 1100

3300 PRINT "De taart ruikt naar amandelen.":GOTO 1100
3300 PRINT "The cake smells of almonds.":GOTO 1100

3400 PRINT "Je onderzoekt: ";L$:PRINT
3400 PRINT "You examine: ";L$:PRINT

3401 IF (L$="paneel") AND (D(6,1)=0) THEN 3430
3401 IF (L$="panel") AND (D(6,1)=0) THEN 3430

3402 IF L$="put" THEN 3440
3402 IF L$="well" THEN 3440

3403 IF L$="luik" THEN 3710
3403 IF L$="hatch" THEN 3710

3404 IF L$="witte bloemen" THEN 3750
3404 IF L$="white flowers" THEN 3750

3405 IF L$="tijdmachine" THEN 3720
3405 IF L$="time machine" THEN 3720

3406 IF L$<>"vitrine" THEN 2870
3406 IF L$<>"display case" THEN 2870

3409 IF G(14)<>-1 THEN 2870

3410 PRINT "In de ";L$;" ligt een doosje lucifers."
3410 PRINT "In the ";L$;" there's a box of"'"matches."

3420 G(14)=P:GOTO 1100

3430 PRINT "Het paneel zit goed dicht. Je ziet aan"
3430 PRINT "The panel is shut tight. You see a"

3435 PRINT "de linkerkant een scharnier.":GOTO 1100
3435 PRINT "hinge on the left.":GOTO 1100

3440 PRINT "Je kijkt omlaag. De put lijkt ontzet-"
3440 PRINT "You look down. The well seems incredibly";

3445 PRINT "tend diep. Je ziet een ladder naar"
3445 PRINT "deep. You see a ladder going down."

3450 GOTO 1100

3500 IF P=30 THEN 3550
3510 IF (LK=0) AND (P=31) THEN 3600

3520 PRINT "Het valt naar beneden.":G(Q)=33:GOTO 1100
3520 PRINT "It falls down.":G(Q)=33:GOTO 1100

3550 PRINT "Het valt naar beneden.":G(Q)=31+2*LK
3550 PRINT "It falls down.":G(Q)=31+2*LK

3555 PRINT "Onder je hoor je een luid";
3555 PRINT "From below, you hear a loud";

3560 IF Q<>8 THEN PRINT "e plof.":GOTO 1100
3560 IF Q<>8 THEN PRINT "thud.":GOTO 1100

3570 PRINT " gekraak."
3570 PRINT " crash."

3580 G(Q)=33:LK=1:D(31,10)=32
3590 FOR A=1 TO AO:IF G(A)=31 THEN G(A)=33
3595 NEXT A:GOTO 1100
3600 S=0:FOR A=1 TO AO
3610 IF G(A)=P THEN S=S+1
3620 NEXT A:IF L=0 THEN 3640

3630 IF S<=2 THEN PRINT "Het luikje buigt vervaarlijk door..."
3630 IF S<=2 THEN PRINT "The hatch bends dangerously..."

3640 IF S<>3 THEN 1100

3650 PRINT "Het luikje begeeft het onder het grote"
3650 PRINT "The hatch collapses under the great"

3660 PRINT "gewicht. Je valt in de afgrond.":PT=0
3660 PRINT "weight. You fall into the abyss.":PT=0
 
3670 GOTO 1140

3700 PRINT "De draak kijkt een beetje treurig.":GOTO 1100
3700 PRINT "The dragon looks a bit sad.":GOTO 1100

3710 PRINT "Het ziet er niet al te stevig uit.":GOTO 1100
3710 PRINT "It doesn't look too firm.":GOTO 1100

3720 PRINT "Hoewel je geen expert op het gebied van"
3720 PRINT "Although you're not an expert on the"

3730 PRINT "tijdmachines bent, zie je toch al gauw"
3730 PRINT "subject of time machines, you soon see"

3740 PRINT "dat hier waarschijnlijk nog een"
3740 PRINT "that there's probably still a"

3745 PRINT G$(2);" mist.":GOTO 1100
3745 PRINT G$(2);" missing.":GOTO 1100

3750 PRINT "Je kunt de bloemen niet goed thuis-"
3750 PRINT "You don't really recognise the"

3760 PRINT "brengen. Ze ruiken erg sterk.":GOTO 1100
3760 PRINT "flowers. They smell very strong.":GOTO 1100

3800 E$="":GOTO 1100

3990 FOR W=1 TO 600:NEXT W:PRINT "Je bent dood."
3990 FOR W=1 TO 600:NEXT W:PRINT "You are dead."

4000 PRINT:PRINT:PRINT "Wil je het nog een keer proberen?"
4000 PRINT:PRINT:PRINT "Do you want to try again?"

4010 GOSUB 210

4020 IF (IN$="J") OR (IN$="j") THEN RUN
4020 IF (IN$="Y") OR (IN$="y") THEN RUN

4030 IF (IN$<>"N") AND (IN$<>"n") THEN 4010
4040 END

4100 PRINT:PRINT "  Je hebt de opdracht helaas niet kunnen"
4100 PRINT:PRINT "  Unfortunately, you didn't complete the"

4110 PRINT "volbrengen. Pas de volgende keer een"
4110 PRINT "assignment. Next time, take better care"

4120 PRINT "beetje beter op Weena!":GOTO 4000
4120 PRINT "of Weena!":GOTO 4000

5000 PRINT
5010 PRINT "Je bent weer thuis. Je bent naar de"
5010 PRINT "You are back home. You went to the"

5020 PRINT "toekomst gegaan, en je hebt Weena ge-"
5020 PRINT "future, and you saved Weena. Humanity"

5030 PRINT "red. De mensheid is trots op je."
5030 PRINT "is proud of you."

5040 PRINT "GEFELICITEERD!!!"
5040 PRINT "CONGRATULATIONS!!!"

5050 GOTO 4000
6000 GOSUB 100

6010 PRINT "WEET JE HET ZEKER?"
6010 PRINT "ARE YOU SURE?"

6020 GOSUB 210

6030 IF (IN$="J") OR (IN$="j") THEN RUN
6030 IF (IN$="Y") OR (IN$="y") THEN RUN

6040 LP=1:GOTO 1100
7000 IF PT>=5 THEN 7030

7010 PRINT "Wat dacht je van een lekkere, stevige"
7010 PRINT "How about a nice, hearty meal..."

7020 PRINT "maaltijd...":GOTO 1400
7020 GOTO 1400

7030 IF LEN(I$)<>1 THEN PRINT I$:GOTO 1400
7040 IF I$<>"1" THEN 7070

7050 PRINT "In het noordoosten wacht je een akelige"
7050 PRINT "In the northeast a horrible death"

7060 PRINT "dood...":GOTO 1400
7060 PRINT "awaits...":GOTO 1400

7070 IF I$<>"2" THEN 7100

7080 PRINT "Je bent ergens anders dan waar je denkt"
7080 PRINT "You aren't where you think you are."

7090 PRINT "te zijn. Weest gewaarschuwd!":GOTO 1400
7090 PRINT "Be warned!":GOTO 1400

7100 IF I$<>"4" THEN 7200

7105 PRINT "Op dit moment zou de draak zich elk"
7105 PRINT "At this point the dragon would make"

7110 PRINT "hapje lekker doen smaken...":GOTO 1400
7110 PRINT "any snack taste good...":GOTO 1400

7200 IF I$="0" THEN 7230

7210 PRINT "De Eloi schijnen een goede smaak te"
7210 PRINT "The Eloi seem to have good taste"

7220 PRINT "hebben, wat eten betreft.":GOTO 1400
7220 PRINT "when it comes to food.":GOTO 1400
 
7230 PRINT "Je doet het prima. Ga zo door!":GOTO 1400
7230 PRINT "You're doing fine. Keep it up!":GOTO 1400

10000 GOSUB 100

10010 PRINT "UITLEG 'DE TIJDMACHINE'"
10010 PRINT "PLAYING 'THE TIME MACHINE'"

10020 PRINT
10030 PRINT "  De bedoeling van dit spel is, dat je,"
10030 PRINT "  The aim of this game is to type in" 

10040 PRINT "door opdrachten in te typen, naar de"
10040 PRINT "commands and travel to the future. There"; 

10050 PRINT "toekomst reist. Daar moet je Weena"
10050 PRINT "you have to find Weena and bring her"

10060 PRINT "vinden en naar het heden terugbrengen."
10060 PRINT "back to the present. Weena is a girl"
 
10070 PRINT "Weena is een meisje, dat als een van de"
10070 PRINT "who is one of the last people left after";

10080 PRINT "laatsten van alle mensen nog over is,"
10080 PRINT "the horrible Morlocks conquered the"

10090 PRINT "sinds de afschuwelijke Morlochs de"
10090 PRINT "earth."

10100 PRINT "aarde aan het veroveren zijn."
10100

10110 PRINT "  The commands you can use to complete"
10120 PRINT "this task are:"
10130 GOSUB 10900

10140 PRINT "N, NO, NW, Z, ZO, ZW, W, O, OP, NEER,"
10140 PRINT "N, NE, NW, S, SE, SW, W, E, UP, DOWN,"

10150 PRINT

10160 PRINT "PAK       LAMP AAN"
10160 PRINT "GET       LAMP ON"

10170 PRINT "LEG       LAMP UIT"
10170 PRINT "DROP      LAMP OFF"

10180 PRINT "OPEN      INVENTARIS"
10180 PRINT "OPEN      INVENTORY"

10190 PRINT "EET       ONDERZOEK"
10190 PRINT "EAT       EXAMINE"

10200 PRINT "KIJK      STOP"
10200 PRINT "LOOK      QUIT"

10210 PRINT:PRINT "and HELP.":PRINT

10220 PRINT "De opdrachten mogen in hoofd- en kleine"
10220 PRINT "The commands can be typed in in upper or";

10230 PRINT "letters worden ingetikt. Ze mogen wor-"
10230 PRINT "lower case. A command may be abbreviated";
 
10240 PRINT "den afgekort tot de eerste drie letters"
10240 PRINT "to its first three letters, except LAMP" 

10250 PRINT "van die opdracht, behalve LAMP AAN en"
10250 PRINT "ON and LAMP OFF."

10255 PRINT "LAMP UIT."
10255

10256 PRINT "Je kunt ook meerdere opdrachten ineens"
10256 PRINT "You can also enter multiple commands at" 

10257 PRINT "ingeven. De opdrachten moeten dan van"
10257 PRINT "once. The commands must be separated by"

10258 PRINT "elkaar gescheiden worden door komma's"
10258 PRINT "commas or semicolons."
 
10259 PRINT "of puntkomma's."
10259

10260 HO=0:VE=20:GOSUB 110

10270 PRINT "Even geduld A.U.B.":GOSUB 11000
10270 PRINT "Please wait.":GOSUB 11000

10280 GOSUB 110:GOTO 10910
10900 PRINT:PRINT:PRINT

10910 PRINT "...toets...       ":GOSUB 210:GOSUB 100:RETURN
10910 PRINT "....key....       ":GOSUB 210:GOSUB 100:RETURN

11000 RESTORE
11010 DIM D(42,10)
11020 FOR L=1 TO 42:I=1
11030 IF I>10 THEN NEXT L:GOTO 11036
11031 READ S:IF S=-1 THEN S=I-11
11032 IF S<0 THEN 11034
11033 D(L,I)=S:I=I+1:GOTO 11030
11034 D(L,I)=0:I=I+1:S=S+1:IF S<>0 THEN 11034
11035 GOTO 11030
11036 AO=16
11040 DIM G$(AO),G(AO):FOR A=1 TO AO
11050 READ G$(A),G(A):NEXT A
11060 CP=0:F=1:PT=40:W=0:WP=28:LP=0:BK=0:LK=0
11070 VP=0:AM=0:BL=0:DR=0:SC=0:P=2:L=0:D=0
11080 GOSUB 260:BC=INT(RV*9000)+1000:RETURN

12000 GOSUB 100:J$="Je bent in "
12000 GOSUB 100:J$="You are in "

12003 IF P>24 THEN 12060
12007 ON INT((P+5)/6) GOTO 12010,12020,13120,12040
12010 ON P GOTO 13000,13010,13020,13030,13040,13050
12020 ON P-6 GOTO 13060,13070,13080,13090,13100,13110
12040 IF P<21 THEN 13120
12050 ON P-20 GOTO 13140,13150,13160,13170
12060 IF P>29 THEN 12070
12065 ON P-24 GOTO 13180,13190,13200,13210,13220
12070 IF P<34 THEN 13500
12075 IF P=34 THEN 13400
12076 IF P=42 THEN 13230
12080 IF L<>0 THEN 12200

12090 GOSUB 260:I$="Weg hier!"
12090 GOSUB 260:I$="Get out of here!"

12100 PRINT "Je ziet niet veel. Het is donker."
12100 PRINT "You can't see much. It's dark."

12110 IF RV<.7 THEN 12150

12130 PRINT "  Je voelt een harige hand langs je"
12130 PRINT "  You feel a hairy hand brushing your"

12140 PRINT "gezicht strijken...":RETURN
12140 PRINT "face...":RETURN
 
12150 PRINT "  De Morlochs vallen je aan, maar je"
12150 PRINT "  The Morlocks attack you, but you"

12160 PRINT "verweert je dapper.":PT=PT-10
12160 PRINT "bravely defend yourself.":PT=PT-10

12165 PRINT "Je voelt je krachten snel afnemen."
12165 PRINT "You can feel your strength quickly"'"ebbing away."

12170 IF (G(8)<>0) OR (RV<.3) THEN 12180

12175 PRINT "Je doodt enkele Morlochs met het breek-"
12175 PRINT "You kill some Morlocks with the crowbar."

12176 PRINT "ijzer."
12176

12180 IF PT<=0 THEN PRINT "De Morlochs overmeesteren je."
12180 IF PT<=0 THEN PRINT "The Morlocks overpower you."

12190 RETURN
12200 GOSUB 260
12202 IF P=39 THEN I$="2"

12204 IF P=40 THEN I$="Iene miene mutte..."
12204 IF P=40 THEN I$="Eeeny, meeny, miney, mo...."

12206 IF P=41 THEN I$="1"

12210 PRINT J$;"een lange, muffe tunnel."
12210 PRINT J$;"a long, musty tunnel."

12220 IF RV<.8 THEN RETURN

12230 PRINT "Je ziet een Morloch haastig wegvluchten"
12230 PRINT "You see a Morlock running away from the"

12240 PRINT "voor het licht.":RETURN
12240 PRINT "light.":RETURN

13000 PRINT J$;"de eetkamer. In het midden"
13000 PRINT J$;"the dining room. In the"

13001 PRINT "van de kamer staat een tafel."
13001 PRINT "middle of the room is a table."
 
13002 L$="tafel":I$="Zoek het zelf maar uit.":RETURN
13002 L$="table":I$="Find out for yourself.":RETURN

13010 PRINT J$;"de woonkamer van een groot"
13010 PRINT J$;"the living room of a large"

13011 I$="Onderzoek eens wat.":IF SC=1 THEN 13014
13011 I$="Examine something.":IF SC=1 THEN 13014

13012 PRINT "huis. Aan de wand hangt een mooi schil-"
13012 PRINT "house. A beautiful painting hangs on"

13013 PRINT "derij.":RETURN
13013 PRINT "the wall.":RETURN

13014 PRINT "huis. Op de plaats waar het schilderij"
13014 PRINT "house. Where the painting used to hang,"

13015 PRINT "hing, zie je nu een brandkast.":RETURN
13015 PRINT "you now see a safe.":RETURN

13020 PRINT J$;"het laboratorium.":RETURN
13020 PRINT J$;"the laboratory.":RETURN

13030 PRINT "Je zit in de tijdmachine.":IF F=0 THEN RETURN
13030 PRINT "You are in the time machine.":IF F=0 THEN RETURN

13031 L$="tijdmachine":IF G(2)=0 THEN 13034
13031 L$="time machine":IF G(2)=0 THEN 13034

13032 PRINT "De tijdmachine is nog niet helemaal"
13032 PRINT "The time machine is not quite ready"

13033 PRINT "klaar.":I$="Zoek overal.":RETURN
13033 PRINT "yet.":I$="Search everywhere.":RETURN

13034 PRINT "Je monteert de kristallen staaf op de"
13034 PRINT "You mount the crystal rod in the right" 

13035 PRINT "juiste plaats, en haalt de handle over."
13035 PRINT "place and pull the handle. A deafening" 

13036 PRINT "Een oorverdovend geraas klinkt in je"
13036 PRINT "roar rings in your ears. When the time"

13037 PRINT "oren. Als je de tijdmachine stopt, raak"
13037 PRINT "machine stops, you are unconscious."
 
13038 PRINT "je bewusteloos."
13038

13039 GOSUB 15000:P=0:G(2)=-1:RETURN

13040 PRINT "Je bevindt je in de sphinx. Hier is ook"
13040 PRINT "You are in the sphinx. The time machine"

13041 PRINT "de tijdmachine!! Je neemt plaats, maar"
13041 PRINT "is here too!! You take a seat, but"

13042 PRINT "plotseling klapt de deur dicht en zit"
13042 PRINT "suddenly the door closes and you are"
 
13043 PRINT "je gevangen. De Morlochs vallen je aan."
13043 PRINT "trapped. The Morlocks attack you. You" 

13044 PRINT "Je probeert de tijdmachine te starten,"
13044 PRINT "try to start the time machine, but the"

13045 PRINT "maar de Morlochs hebben de starthandle"
13045 PRINT "Morlocks have removed the starter"

13046 PRINT "eraf gehaald!":IF G(12)=0 THEN 13300
13046 PRINT "handle!":IF G(12)=0 THEN 13300

13047 PRINT "De Morlochs overmeesteren je."
13047 PRINT "The Morlocks overpower you."

13048 PT=0:RETURN

13050 PRINT J$;"een tuin met vreemde bloemen"
13050 PRINT J$;"a garden with strange flowers";

13051 PRINT "Aan de noordkant staat een witte sphinx"
13051 PRINT "On the north side is a white sphinx"

13053 L$="panel":IF F<>1 THEN RETURN

13054 PRINT "Je bent nog een beetje verdwaasd."
13054 PRINT "You are still a bit dazed."

13055 PRINT "Als je weer wat bent bijgekomen, bemerk"
13055 PRINT "When you recover you notice that the" 

13056 PRINT "je, dat de tijdmachine weg is! Je ziet"
13056 PRINT "time machine is gone! You see a panel in"; 

13057 PRINT "een paneel in de onderkant van de"
13057 PRINT "the bottom of the sphinx close..."

13058 PRINT "sphinx dichtklappen..."
13058

13059 F=0:RETURN

13060 PRINT J$;"de eetzaal van de Eloi, de"
13060 PRINT J$;"the dining room of the Eloi,"

13061 PRINT "bewoners van de aarde in het jaar"
13061 PRINT "the inhabitants of the earth in the"
 
13062 PRINT "802.701":I$="3":RETURN
13062 PRINT "year 802,701":I$="3":RETURN

13070 PRINT J$;"de slaapzaal. Langs de muren"
13070 PRINT J$;"the dormitory. Soft cushions"

13071 PRINT "liggen zachte kussens.":L$="kussen":RETURN
13071 PRINT "line the walls.":L$="cushions":RETURN

13080 PRINT "Je bent aan de zuidelijke oever van"
13080 PRINT "You are on the south bank of a fast-"

13081 PRINT "een snelstromende rivier.":IF WP<>28 THEN RETURN
13081 PRINT "flowing river.":IF WP<>28 THEN RETURN

13082 PRINT "Sommige Eloi zijn aan het zwemmen."
13082 PRINT "Some Eloi are swimming."

13083 IF (WP<>28) OR (W=1) THEN RETURN

13084 PRINT "Je ziet er een bijna verdrinken!!!"
13084 PRINT "You see one drowning!!!"

13085 I$="Probeer haar te redden!":RETURN
13085 I$="Try to save her!":RETURN

13090 PRINT J$;"de stad. Overal staan mooie,"
13090 PRINT J$;"the city. There are beautiful";

13091 PRINT "maar vervallen huizen. Er schijnt geen"
13091 PRINT "but dilapidated houses everywhere. There";

13092 PRINT "duidelijk stratenplan te zijn.":RETURN
13092 PRINT "doesn't seem to be a clear street-plan.":RETURN

13100 PRINT "Je bent op een pleintje. In het midden"
13100 PRINT "You are in a square. In the middle is" 

13101 PRINT "staat iets, dat lijkt op een waterput."
13101 PRINT "something that looks like a well."

13102 L$="put":IF W=0 THEN RETURN
13102 L$="well":IF W=0 THEN RETURN

13103 PRINT "Weena kruipt plotseling dicht tegen"
13103 PRINT "Weena suddenly crawls up close to you."

13104 PRINT "je aan. Ze ziet er bang uit."
13104 PRINT "She looks scared.""

13105 I$="Laat haar hier maar achter.":RETURN
13105 I$="Leave her here.":RETURN

13110 PRINT "Je staat op een hoge heuvel. In het"
13110 PRINT "You are high up on a hill. To the"

13111 PRINT "westen zie je de stad liggen, en ver"
13111 PRINT "west you can see the city and far away"

13112 PRINT "in het oosten een groot, groen gebouw.":RETURN
13112 PRINT "to the east a large, green building.":RETURN 

13120 PRINT "Je bent op een kronkelig bospad, in een"
13120 PRINT "You are on a winding forest path, in a"

13121 PRINT "woest en donker woud."
13121 PRINT "wild and dark wood."

13122 I$="Zoek je weg door het bos.":GOSUB 260
13122 I$="Find your way through the forest.":GOSUB 260

13123 IF RV>.2 THEN 13130

13124 PRINT "In de verte zie je wat Morlochs lopen.":RETURN
13124 PRINT "In the distance you see some Morlocks"'"walking.":RETURN

13130 IF RV<.85 THEN RETURN

13131 PRINT "  Plotseling vallen enkele Morlochs je"
13131 PRINT "  Suddenly some Morlocks attack you."

13132 AM=AM+1:IF AM>8 THEN 13135

13133 PRINT "aan. Maar je was op je hoede, en je"
13133 PRINT "But you were on your guard, and you"

13134 PRINT "verjaagt ze.":RETURN
13134 PRINT "drive them away.":RETURN

13135 IF W=0 THEN 13133
13136 PRINT "aan. Voor je er erg in hebt, ontvoeren"
13136 PRINT "Before you know it, they've kidnapped"

13137 PRINT "ze Weena, en ben je alleen."
13137 PRINT "Weena, and you're alone."

13138 W=-1:RETURN

13140 PRINT "Je staat voor de ingang van een oud en"
13140 PRINT "You are standing at the entrance to an"

13141 PRINT "in onbruik geraakt groen porceleinen"
13141 PRINT "old and disused green porcelain"

13142 PRINT "museum.":RETURN

13150 PRINT "Je staat in een grote museumhal. Er"
13150 PRINT "You are in a large museum hall. There"

13151 PRINT "ligt een dikke laag stof op de vloer.":RETURN
13151 PRINT "is a thick layer of dust on the floor.":RETURN
 
13160 PRINT "Je staat in een kleine zaal, met vele"
13160 PRINT "You are in a small room, with many"

13161 PRINT "kapotte vitrines.":L$="vitrine":RETURN
13161 PRINT "broken display cases.":L$="display case":RETURN

13170 PRINT J$;"een enorme zaal, met grote"
13170 PRINT J$;"a huge hall, with large"

13171 PRINT "machines. De machines zien er oud en"
13171 PRINT "machines. The machines look old and"
 
13172 PRINT "verwaarloosd uit.":L$="machine":RETURN
13172 PRINT "neglected.":L$="machine":RETURN

13180 PRINT J$;"een kleine museumzaal."
13180 PRINT J$;"a small museum hall."

13181 PRINT "Je kunt omhoog, via een trap achter"
13181 PRINT "You can go up, via a staircase behind"

13182 PRINT "een deur."
13182 PRINT "a door."

13183 I$="Zoek de sleutel op.":RETURN
13183 I$="Find the key.":RETURN

13190 PRINT "Je bent op de museumzolder. Het is hier"
13190 PRINT "You are in the museum attic. It is very"

13191 PRINT "erg stoffig. Vreemde dieren op sterk"
13191 PRINT "dusty here. Strange animals in"

13192 PRINT "water kijken je glazig aan."
13192 PRINT "formaldehyde stare at you"'"with glassy eyes."

13193 L$="dier op sterk water":RETURN
13193 L$="animal in formaldehyde":RETURN

13200 PRINT J$;"een grote museumzaal,"
13200 PRINT J$;"a large museum hall,"

13201 PRINT "met grote, glazen vitrines.":L$="vitrines"
13201 PRINT "with big glass display cases.":L$="display cases"

13202 RETURN
13210 IF WP<>28 THEN 13214
13211 PRINT "Je waadt de rivier in, en redt het"
13211 PRINT "You wade into the river and save the"

13212 PRINT "meisje. Ze is je erg dankbaar."
13212 PRINT "girl. She is very grateful."

13213 W=1:RETURN

13214 PRINT "Je waadt de rivier in. De stroom grijpt"
13214 PRINT "You wade into the river. The current grabs"

13215 PRINT "je, je verliest je evenwicht, en"
13215 PRINT "you, you lose your balance, and"

13216 PRINT "verdrinkt.":PT=0:RETURN
13216 PRINT "you drown.":PT=0:RETURN

13220 PRINT J$;"een klein en rommelig"
13220 PRINT J$;"a small and messy study."

13221 PRINT "studeervertrek. Overal liggen openge-"
13221 PRINT "Everywhere there are open books"

13222 PRINT "slagen boeken, en stapels papieren.":RETURN
13222 PRINT "and piles of papers.":RETURN

13230 GOSUB 13120:IF DR<>0 THEN RETURN

13231 PRINT "  Je ziet een grote, hongerige draak."
13231 PRINT "  You see a big, hungry dragon."

13232 PRINT "De draak komt langzaam op je af.":DR=1
13232 PRINT "The dragon slowly approaches.":DR=1

13233 I$="4":RETURN

13300 PRINT "Wat een geluk, dat je 'm bij je hebt!!"
13300 PRINT "How lucky that you have it with you!!"

13305 PRINT "Je monteert de handle, en haalt hem"
13305 PRINT "You attach the handle, and pull it..."

13310 PRINT "over...."
13310

13320 P=-1:GOTO 15000

13400 PRINT "Je valt plotseling in een ijskoud meer."
13400 PRINT "You suddenly fall into an ice-cold lake."

13405 IF G(16)=0 THEN 13480

13410 PRINT "Je probeert tegen de kant op te klim-"
13410 PRINT "You try to climb up the side, but it"

13420 PRINT "men, maar die is veel te steil."
13420 PRINT "is far too steep. You feel your"

13430 PRINT "Je voelt je krachten langzaam wegebben."
13430 PRINT "strength slowly ebbing away. With one"

13440 PRINT "Met een laatste krachtsinspanning pro-"
13440 PRINT "last effort you try to pull yourself"

13450 PRINT "beer je je nog op te trekken, maar"
13450 PRINT "up, but in vain. The waters inexorably"
 
13460 PRINT "tevergeefs. Het water sluit zich onver-"
13460 PRINT "close above you..."
 
13470 PRINT "biddelijk boven je...":PT=0:RETURN
13470 PRINT PT=0:RETURN

13480 PRINT "Gelukkig heb je de autoband bij je,"
13480 PRINT "Luckily you have the car tyre with you,"

13481 PRINT "waarmee je toch een beetje blijft drij-"
13481 PRINT "which allows you to float a bit."
 
13482 PRINT "ven. Na enig proberen lukt het je tegen"
13482 PRINT "After a few tries you manage to climb"

13483 PRINT "de kant op te klimmen.":GOSUB 15000
13483 PRINT "up the side.":GOSUB 15000
 
13484 P=-2:RETURN

13500 IF L=0 THEN PRINT "Het is donker.":RETURN
13500 IF L=0 THEN PRINT "It is dark.":RETURN

13510 IF P=31 THEN 13600
13520 IF P=33 THEN 13700
13525 P$=""

13530 PRINT J$;"een diepe put. Ver boven je"
13530 PRINT J$;"a deep well. Far above, you"

13540 PRINT "zie je nog een klein stukje van de"
13540 PRINT "see a small patch of blue sky."

13550 PRINT "blauwe lucht.":IF P$<>"" THEN PRINT P$
13550 IF P$<>"" THEN PRINT P$

13560 RETURN

13600 P$="Je kunt omlaag door een kapot luik."
13600 P$="You can go down through a broken hatch."

13605 IF LK=1 THEN L$="versplinterd luik":GOTO 13530
13605 IF LK=1 THEN L$="splintered hatch":GOTO 13530

13610 L$="luik":I$="Heb je niks zwaars bij je?"
13610 L$="hatch":I$="Don't you have anything heavy with you?"

13620 PRINT J$;"een diepe put. Je staat op"
13620 PRINT J$;"a deep well. You are standing"

13630 PRINT "een luikje, dat doorbuigt onder je"
13630 PRINT "on a hatch that bends under your"

13640 PRINT "gewicht.":RETURN
13640 PRINT "weight.":RETURN

13700 PRINT "Je staat op de bodem van een diepe put."
13700 PRINT "You are at the bottom of a deep well."

13710 I$="Zoek het eens wat hogerop.":RETURN
13710 I$="Look a little higher up.":RETURN

14000 PRINT "De draak komt op je af. Hij ziet er"
14000 PRINT "The dragon charges at you. It looks"

14001 PRINT "woest en hongerig uit. Je probeert nog"
14001 PRINT "ferocious and hungry. You keep trying"

14002 PRINT "weg te rennen, maar tevergeefs. De"
14002 PRINT "to run away, but in vain. The dragon"
 
14003 PRINT "draak eet je op."
14003 PRINT "eats you up."

14010 PRINT "Je bent dood.":GOTO 4000
14010 PRINT "You are dead.":GOTO 4000

15000 PRINT:PRINT "<TOETS>":GOSUB 210:RETURN
15000 PRINT:PRINT "< KEY >":GOSUB 210:RETURN

16000 C=0:FOR A=1 TO LEN(A$)-2 STEP 3
16010 IF (MID$(A$,A,3)=D$) OR (MID$(B$,A,3)=D$) THEN C=(A+2)/3
16020 NEXT A:RETURN
17000 PRINT ">>>";:INPUT V:RETURN
18000 IF E$="" THEN C$="":RETURN
18010 A=1
18020 IF (MID$(E$,A,1)=",") OR (MID$(E$,A,1)=";") THEN 18040
18030 A=A+1:IF A<=LEN(E$) THEN 18020
18035 C$=E$:E$="":GOTO 18060
18040 C$="":IF A<>1 THEN C$=LEFT$(E$,A-1)
18045 IF A=LEN(E$) THEN E$="":GOTO 18060
18050 E$=RIGHT$(E$,LEN(E$)-A)
18060 IF LEN(C$)<2 THEN 18070
18063 IF LEFT$(C$,1)<>" " THEN 18070
18065 C$=RIGHT$(E$,LEN(E$)-1):GOTO 18060
18070 IF CP=1 THEN PRINT " ";C$
18080 RETURN

19000 IF (A<=2) OR (A=8) THEN PRINT "noord";
19000 IF (A<=2) OR (A=8) THEN PRINT "north";

19010 IF (A>3) AND (A<7) THEN PRINT "zuid";
19010 IF (A>3) AND (A<7) THEN PRINT "south";

19020 IF (A>1) AND (A<5) THEN PRINT "oost";
19020 IF (A>1) AND (A<5) THEN PRINT "east";

19030 IF (A>5) AND (A<9) THEN PRINT "west";

19040 IF A=9 THEN PRINT "op";
19040 IF A=9 THEN PRINT "up";

19050 IF A=10 THEN PRINT "neer";
19050 IF A=10 THEN PRINT "down";

19060 RETURN
25000 DATA -6,2,-1,-2,1,29,3,-1,2,-5,4,-1,-2,3,-1,-1,-2,10,0
25010 DATA 7,-1,6,-3,8,-1,7,-1,28,-3,10,-1,9,13,12,0,11,0,6
25020 DATA -1,10,0,14,15,-5,30,-2,18,-2,14,10,13,-1,-3,12,-2
25030 DATA 10,-1,-4,15,0,11,12,-1,14,19,-4,11,-1,-4,42,18,20
25040 DATA -1,20,-3,18,0,13,-1,0,17,-2,19,0,12,-1,18,-3,15,0
25050 DATA 14,-1,-3,16,17,-1,-4,22,0,42,-1,21,-3,23,-1,22,0
25060 DATA 25,-1,-4,25,0,22,27,-1,24,-5,23,-1,-9,25,-4,24,-1
25070 DATA -4,9,-1,-7,2,-1,-8,11,31,-8,30,-1,-6,35,0,31,33,36
25080 DATA -7,32,-1,-1,-4,41,36,41,-1,35,41,0,38,-1,-3,39,0
25090 DATA 36,35,-1,41,37,-4,36,-1,40,32,0,34,-1,0,34,-4,34
25100 DATA 35,-1,35,34,0,36,-1,0,21,18,-2,18,-1

26000 DATA "schilderij",2,"kristallen staaf",-1
26000 DATA "painting",2,"crystal rod",-1

26010 DATA "ontbijt",1,"stapeltje papieren",29
26010 DATA "breakfast",1,"stack of papers",29

26020 DATA "vruchten",7,"urn",27
26020 DATA "fruits",7,"urn",27

26030 DATA "boek",27,"zwaar breekijzer",24
26030 DATA "book",27,"heavy crowbar",24

26040 DATA "gebroken urn",-1,"sleutel",-1
26040 DATA "broken urn",-1,"key",-1

26050 DATA "lamp",26,"handle van tijdmachine",40
26050 DATA "lamp",26,"time machine handle",40

26060 DATA "amandeltaart",7,"lucifers",-1
26060 DATA "almond cake",7,"matches",-1

26070 DATA "dode draak",-1,"autoband",15
26070 DATA "dead dragon",-1,"car tyre",15

30000 REM
30010 REM      DE  TIJDMACHINE
30020 REM       EEN ADVENTURE
30030 REM
30040 REM GESCHREVEN DOOR G.A. LUNTER
30050 REM         BORDINE 44
30060 REM       8604 AD  SNEEK
30070 REM
30080 REM OP EEN SINCLAIR ZX SPECTRUM
30090 REM         MAART 1988
30100 REM
30110 REM   COPYRIGHT NOS HILVERSUM
