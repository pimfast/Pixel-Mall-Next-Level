/// @desc

randomise();

global.level = 1;
global.rating = 0;
global.money = 400;
global.pixelmoney = 20;
global.day = 1;

global.mode = "game";

//set requirements and specifics
global.levelmoneyreq = [0, //lvl 0 n/a
0, //lvl 1 default
500, //lvl 2 requirement: 500
3000, //lvl 3 requirement: 3000
6000, //lvl 4 requirement: 6000
10000, //lvl 5 requirement: 10000
18000, //lvl 6 requirement: 18000
30000, //lvl 7 requirement: 30000
45000, //lvl 8 requirement: 45000
60000, //lvl 9 requirement: 60000
80000, //lvl 10 requirement: 80000
100000, //lvl 11 requirement:
100500, //lvl 12 requirement:
103000, //lvl 13 requirement:
106000, //lvl 14 requirement:
110000, //lvl 15 requirement:
118000, //lvl 16 requirement:
130000, //lvl 17 requirement:
145000, //lvl 18 requirement:
160000, //lvl 19 requirement:
180000, //lvl 20 requirement:
200000, //lvl 21 requirement:
200500, //lvl 22 requirement:
203000, //lvl 23 requirement:
206000, //lvl 24 requirement:
210000, //lvl 25 requirement:
218000, //lvl 26 requirement:
230000, //lvl 27 requirement:
245000, //lvl 28 requirement:
260000, //lvl 29 requirement:
280000, //lvl 30 requirement:
300000, //lvl 31 requirement:
300500, //lvl 32 requirement:
303000, //lvl 33 requirement:
306000, //lvl 34 requirement:
310000, //lvl 35 requirement:
318000, //lvl 36 requirement:
330000, //lvl 37 requirement:
345000, //lvl 38 requirement:
360000, //lvl 39 requirement:
380000, //lvl 40 requirement:
400000, //lvl 41 requirement:
400500, //lvl 42 requirement:
403000, //lvl 43 requirement:
406000, //lvl 44 requirement:
410000, //lvl 45 requirement:
418000, //lvl 46 requirement:
430000, //lvl 47 requirement:
445000, //lvl 48 requirement:
460000, //lvl 49 requirement:
480000, //lvl 50 requirement:
500000, //lvl 51 requirement:
500500, //lvl 52 requirement:
503000, //lvl 53 requirement:
506000, //lvl 54 requirement:
510000, //lvl 55 requirement:
518000, //lvl 56 requirement:
530000, //lvl 57 requirement:
545000, //lvl 58 requirement:
560000, //lvl 59 requirement:
580000, //lvl 60 requirement:
600000, //lvl 61 requirement:
600500, //lvl 62 requirement:
603000, //lvl 63 requirement:
606000, //lvl 64 requirement:
610000, //lvl 65 requirement:
618000, //lvl 66 requirement:
630000, //lvl 67 requirement:
645000, //lvl 68 requirement:
660000, //lvl 69 requirement:
680000, //lvl 70 requirement:
700000, //lvl 71 requirement:
700500, //lvl 72 requirement:
703000, //lvl 73 requirement:
706000, //lvl 74 requirement:
710000, //lvl 75 requirement:
718000, //lvl 76 requirement:
730000, //lvl 77 requirement:
745000, //lvl 78 requirement:
760000, //lvl 79 requirement:
780000, //lvl 80 requirement:
800000, //lvl 81 requirement:
800500, //lvl 82 requirement:
803000, //lvl 83 requirement:
806000, //lvl 84 requirement:
810000, //lvl 85 requirement:
818000, //lvl 86 requirement:
830000, //lvl 87 requirement:
845000, //lvl 88 requirement:
860000, //lvl 89 requirement:
880000, //lvl 90 requirement:
900000, //lvl 91 requirement:
900500, //lvl 92 requirement:
903000, //lvl 93 requirement:
906000, //lvl 94 requirement:
910000, //lvl 95 requirement:
918000, //lvl 96 requirement:
930000, //lvl 97 requirement:
945000, //lvl 98 requirement:
960000, //lvl 99 requirement:
980000, //lvl 100 requirement:
];

global.levelratingreq = [0, //lvl 0 n/a
0, //lvl 1 default
2, //lvl 2 requirement: 2.00
10, //lvl 3 requirement: 10.00
30, //lvl 4 requirement: 30.00
70, //lvl 5 requirement: 70.00
150, //lvl 6 requirement: 150.00
300, //lvl 7 requirement: 300.00
500, //lvl 8 requirement: 500.00
1000, //lvl 9 requirement: 1000.00
1500, //lvl 10 requirement: 1500.00
3000, //lvl 11 requirement:
3002, //lvl 12 requirement:
3010, //lvl 13 requirement:
3030, //lvl 14 requirement:
3070, //lvl 15 requirement:
3150, //lvl 16 requirement:
3300, //lvl 17 requirement:
3500, //lvl 18 requirement:
4000, //lvl 19 requirement:
4500, //lvl 20 requirement:
6000, //lvl 21 requirement:
6002, //lvl 22 requirement:
6010, //lvl 23 requirement:
6030, //lvl 24 requirement:
6070, //lvl 25 requirement:
6150, //lvl 26 requirement:
6300, //lvl 27 requirement:
6500, //lvl 28 requirement:
7000, //lvl 29 requirement:
7500, //lvl 30 requirement:
9000, //lvl 31 requirement:
9002, //lvl 32 requirement:
9010, //lvl 33 requirement:
9030, //lvl 34 requirement:
9070, //lvl 35 requirement:
9150, //lvl 36 requirement:
9300, //lvl 37 requirement:
9500, //lvl 38 requirement:
10000, //lvl 39 requirement:
10500, //lvl 40 requirement:
12000, //lvl 41 requirement:
12002, //lvl 42 requirement:
12010, //lvl 43 requirement:
12030, //lvl 44 requirement:
12070, //lvl 45 requirement:
12150, //lvl 46 requirement:
12300, //lvl 47 requirement:
12500, //lvl 48 requirement:
13000, //lvl 49 requirement:
13500, //lvl 50 requirement:
15000, //lvl 51 requirement:
15002, //lvl 52 requirement:
15010, //lvl 53 requirement:
15030, //lvl 54 requirement:
15070, //lvl 55 requirement:
15150, //lvl 56 requirement:
15300, //lvl 57 requirement:
15500, //lvl 58 requirement:
16000, //lvl 59 requirement:
16500, //lvl 60 requirement:
18000, //lvl 61 requirement:
18002, //lvl 62 requirement:
18010, //lvl 63 requirement:
18030, //lvl 64 requirement:
18070, //lvl 65 requirement:
18150, //lvl 66 requirement:
18300, //lvl 67 requirement:
18500, //lvl 68 requirement:
19000, //lvl 69 requirement:
19500, //lvl 70 requirement:
21000, //lvl 71 requirement:
21002, //lvl 72 requirement:
21010, //lvl 73 requirement:
21030, //lvl 74 requirement:
21070, //lvl 75 requirement:
21150, //lvl 76 requirement:
21300, //lvl 77 requirement:
21500, //lvl 78 requirement:
22000, //lvl 79 requirement:
22500, //lvl 80 requirement:
24000, //lvl 81 requirement:
24002, //lvl 82 requirement:
24010, //lvl 83 requirement:
24030, //lvl 84 requirement:
24070, //lvl 85 requirement:
24150, //lvl 86 requirement:
24300, //lvl 87 requirement:
24500, //lvl 88 requirement:
25000, //lvl 89 requirement:
25500, //lvl 90 requirement:
27000, //lvl 91 requirement:
27002, //lvl 92 requirement:
27010, //lvl 93 requirement:
27030, //lvl 94 requirement:
27070, //lvl 95 requirement:
27150, //lvl 96 requirement:
27300, //lvl 97 requirement:
27500, //lvl 98 requirement:
28000, //lvl 99 requirement:
28500, //lvl 100 requirement:
];

levelmincustomerinterval = [0,
14, //1.5
8.5, //2
8, //1.5
7.5, //3.5
6.5, //3
6, //2.75
5.5, //2.5
4.5, //2.5
4, //2.25
3.5 //2
];

levelcustomerinterval = [0,
14, //4
8.5, //1	
8, //4
7.5, //3
6.5, //3
6, //2.5
5.5, //2
4.5, //1.5
4, //1.5
3.5 //1.5
];