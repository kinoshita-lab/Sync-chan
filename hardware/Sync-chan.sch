EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR035
U 1 1 5DDE9173
P 1900 7500
F 0 "#PWR035" H 1900 7250 50  0001 C CNN
F 1 "GND" H 1905 7327 50  0000 C CNN
F 2 "" H 1900 7500 50  0001 C CNN
F 3 "" H 1900 7500 50  0001 C CNN
	1    1900 7500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1900 7450 1900 7500
$Comp
L power:GND #PWR05
U 1 1 5CDB4CC5
P 2000 1800
F 0 "#PWR05" H 2000 1550 50  0001 C CNN
F 1 "GND" H 2005 1627 50  0000 C CNN
F 2 "" H 2000 1800 50  0001 C CNN
F 3 "" H 2000 1800 50  0001 C CNN
	1    2000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1200 3400 1300
Wire Wire Line
	3400 1600 3400 1700
$Comp
L power:GND #PWR03
U 1 1 5CDB6F25
P 3400 1700
F 0 "#PWR03" H 3400 1450 50  0001 C CNN
F 1 "GND" H 3405 1527 50  0000 C CNN
F 2 "" H 3400 1700 50  0001 C CNN
F 3 "" H 3400 1700 50  0001 C CNN
	1    3400 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5CDB5ED1
P 3400 1450
F 0 "C1" H 3515 1496 50  0000 L CNN
F 1 "100u" H 3515 1405 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 3438 1300 50  0001 C CNN
F 3 "~" H 3400 1450 50  0001 C CNN
	1    3400 1450
	1    0    0    -1  
$EndComp
Connection ~ 3400 1200
$Comp
L Device:R R1
U 1 1 5CDECA44
P 4000 1250
F 0 "R1" H 4070 1296 50  0000 L CNN
F 1 "1k" H 4070 1205 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3930 1250 50  0001 C CNN
F 3 "~" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED1
U 1 1 5CDED802
P 4000 1550
F 0 "LED1" V 4039 1432 50  0000 R CNN
F 1 "LED" V 3948 1432 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 4000 1550 50  0001 C CNN
F 3 "~" H 4000 1550 50  0001 C CNN
	1    4000 1550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5CDEFAB0
P 4000 1700
F 0 "#PWR04" H 4000 1450 50  0001 C CNN
F 1 "GND" H 4005 1527 50  0000 C CNN
F 2 "" H 4000 1700 50  0001 C CNN
F 3 "" H 4000 1700 50  0001 C CNN
	1    4000 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Jack-DC J1
U 1 1 5CDC28DC
P 1600 1400
F 0 "J1" H 1657 1725 50  0000 C CNN
F 1 "Jack-DC" H 1657 1634 50  0000 C CNN
F 2 "Sync-chan:MRUSB-2B-D14NI-S306" H 1650 1360 50  0001 C CNN
F 3 "~" H 1650 1360 50  0001 C CNN
	1    1600 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1500 2000 1500
Wire Wire Line
	2000 1500 2000 1750
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5DE8A605
P 3400 1100
F 0 "#FLG01" H 3400 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 3468 1142 50  0000 L CNN
F 2 "" H 3400 1100 50  0001 C CNN
F 3 "~" H 3400 1100 50  0001 C CNN
	1    3400 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 1100 3400 1200
Wire Wire Line
	2150 1300 1900 1300
$Comp
L power:+5V #PWR01
U 1 1 5DDFF395
P 3000 1100
F 0 "#PWR01" H 3000 950 50  0001 C CNN
F 1 "+5V" H 3015 1273 50  0000 C CNN
F 2 "" H 3000 1100 50  0001 C CNN
F 3 "" H 3000 1100 50  0001 C CNN
	1    3000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1100 3000 1200
Connection ~ 3000 1200
Wire Wire Line
	3000 1200 3400 1200
$Comp
L power:+5V #PWR02
U 1 1 5DE029C3
P 4000 1100
F 0 "#PWR02" H 4000 950 50  0001 C CNN
F 1 "+5V" H 4015 1273 50  0000 C CNN
F 2 "" H 4000 1100 50  0001 C CNN
F 3 "" H 4000 1100 50  0001 C CNN
	1    4000 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5DE07A7F
P 2000 5350
F 0 "#PWR020" H 2000 5100 50  0001 C CNN
F 1 "GND" H 2005 5177 50  0000 C CNN
F 2 "" H 2000 5350 50  0001 C CNN
F 3 "" H 2000 5350 50  0001 C CNN
	1    2000 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 5300 2000 5350
$Comp
L power:GND #PWR022
U 1 1 5DE11421
P 2750 5450
F 0 "#PWR022" H 2750 5200 50  0001 C CNN
F 1 "GND" H 2755 5277 50  0000 C CNN
F 2 "" H 2750 5450 50  0001 C CNN
F 3 "" H 2750 5450 50  0001 C CNN
	1    2750 5450
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 5DE17CAC
P 3500 5300
F 0 "U1" H 3500 5667 50  0000 C CNN
F 1 "LM358MX" H 3500 5576 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3500 5300 50  0001 C CNN
F 3 "" H 3500 5300 50  0001 C CNN
	1    3500 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5200 2900 5200
$Comp
L Device:R R7
U 1 1 5DE1B984
P 3500 5600
F 0 "R7" V 3615 5600 50  0000 C CNN
F 1 "10k" V 3706 5600 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3430 5600 50  0001 C CNN
F 3 "~" H 3500 5600 50  0001 C CNN
	1    3500 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5DE1CBA3
P 3200 5800
F 0 "R8" H 3130 5754 50  0000 R CNN
F 1 "1k" H 3130 5845 50  0000 R CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3130 5800 50  0001 C CNN
F 3 "~" H 3200 5800 50  0001 C CNN
	1    3200 5800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5DE1D6C9
P 3200 5950
F 0 "#PWR025" H 3200 5700 50  0001 C CNN
F 1 "GND" H 3205 5777 50  0000 C CNN
F 2 "" H 3200 5950 50  0001 C CNN
F 3 "" H 3200 5950 50  0001 C CNN
	1    3200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 5400 3200 5600
Wire Wire Line
	3350 5600 3200 5600
Connection ~ 3200 5600
Wire Wire Line
	3200 5600 3200 5650
Wire Wire Line
	3650 5600 3800 5600
Wire Wire Line
	3800 5600 3800 5300
$Comp
L Device:R R6
U 1 1 5DE239E6
P 4100 5450
F 0 "R6" H 4170 5496 50  0000 L CNN
F 1 "1k" H 4170 5405 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4030 5450 50  0001 C CNN
F 3 "~" H 4100 5450 50  0001 C CNN
	1    4100 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED2
U 1 1 5DE26251
P 4100 5750
F 0 "LED2" V 4139 5632 50  0000 R CNN
F 1 "LED" V 4048 5632 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 4100 5750 50  0001 C CNN
F 3 "~" H 4100 5750 50  0001 C CNN
	1    4100 5750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5DE26257
P 4100 5950
F 0 "#PWR026" H 4100 5700 50  0001 C CNN
F 1 "GND" H 4105 5777 50  0000 C CNN
F 2 "" H 4100 5950 50  0001 C CNN
F 3 "" H 4100 5950 50  0001 C CNN
	1    4100 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 5300 4100 5300
Connection ~ 3800 5300
Wire Wire Line
	4100 5900 4100 5950
Text GLabel 4400 5300 2    50   Output ~ 0
Ext.Sync
Wire Wire Line
	4400 5300 4100 5300
Connection ~ 4100 5300
$Comp
L power:+5V #PWR028
U 1 1 5DE337E7
P 1900 7100
F 0 "#PWR028" H 1900 6950 50  0001 C CNN
F 1 "+5V" H 1915 7273 50  0000 C CNN
F 2 "" H 1900 7100 50  0001 C CNN
F 3 "" H 1900 7100 50  0001 C CNN
	1    1900 7100
	-1   0    0    -1  
$EndComp
Text GLabel 2150 7300 2    50   Output ~ 0
Fader
Wire Wire Line
	2050 7300 2100 7300
$Comp
L power:GND #PWR040
U 1 1 5DE43B46
P 1950 8950
F 0 "#PWR040" H 1950 8700 50  0001 C CNN
F 1 "GND" H 1955 8777 50  0000 C CNN
F 2 "" H 1950 8950 50  0001 C CNN
F 3 "" H 1950 8950 50  0001 C CNN
	1    1950 8950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5DE4579E
P 2500 8950
F 0 "#PWR041" H 2500 8700 50  0001 C CNN
F 1 "GND" H 2505 8777 50  0000 C CNN
F 2 "" H 2500 8950 50  0001 C CNN
F 3 "" H 2500 8950 50  0001 C CNN
	1    2500 8950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 5DE467AF
P 3050 8950
F 0 "#PWR042" H 3050 8700 50  0001 C CNN
F 1 "GND" H 3055 8777 50  0000 C CNN
F 2 "" H 3050 8950 50  0001 C CNN
F 3 "" H 3050 8950 50  0001 C CNN
	1    3050 8950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5DE491AD
P 3200 7500
F 0 "#PWR036" H 3200 7250 50  0001 C CNN
F 1 "GND" H 3205 7327 50  0000 C CNN
F 2 "" H 3200 7500 50  0001 C CNN
F 3 "" H 3200 7500 50  0001 C CNN
	1    3200 7500
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR029
U 1 1 5DE4946D
P 3200 7100
F 0 "#PWR029" H 3200 6950 50  0001 C CNN
F 1 "+5V" H 3215 7273 50  0000 C CNN
F 2 "" H 3200 7100 50  0001 C CNN
F 3 "" H 3200 7100 50  0001 C CNN
	1    3200 7100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 7100 3200 7150
Wire Wire Line
	3200 7450 3200 7500
Text GLabel 3500 7300 2    50   Output ~ 0
Tempo
Wire Wire Line
	3450 7300 3350 7300
Text GLabel 2000 8300 2    50   Output ~ 0
Tap
Wire Wire Line
	2000 8300 1950 8300
Wire Wire Line
	1950 8300 1950 8500
Text GLabel 2550 8300 2    50   Output ~ 0
Nudge-
Wire Wire Line
	2550 8300 2500 8300
Wire Wire Line
	2500 8300 2500 8500
Text GLabel 3100 8300 2    50   Output ~ 0
Nudge+
Wire Wire Line
	3050 8500 3050 8300
Wire Wire Line
	3050 8300 3100 8300
$Comp
L Connector:TestPoint TP1
U 1 1 5DE5F0C5
P 3000 1300
F 0 "TP1" H 3000 1533 50  0000 C CNN
F 1 "TestPoint" H 3000 1624 50  0000 C CNN
F 2 "Sync-chan:TP_PAD_LARGE" H 3200 1300 50  0001 C CNN
F 3 "~" H 3200 1300 50  0001 C CNN
	1    3000 1300
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 1300 3000 1200
$Comp
L Connector:TestPoint TP2
U 1 1 5DE615D1
P 2100 1750
F 0 "TP2" V 2054 1938 50  0000 L CNN
F 1 "TestPoint" V 2145 1938 50  0000 L CNN
F 2 "Sync-chan:TP_PAD_LARGE" H 2300 1750 50  0001 C CNN
F 3 "~" H 2300 1750 50  0001 C CNN
	1    2100 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 1750 2000 1750
Connection ~ 2000 1750
Wire Wire Line
	2000 1750 2000 1800
$Comp
L Connector:TestPoint TP4
U 1 1 5DE634AD
P 2100 7050
F 0 "TP4" H 2158 7168 50  0000 L CNN
F 1 "TestPoint" H 2158 7077 50  0000 L CNN
F 2 "Sync-chan:TP_1PAD" H 2300 7050 50  0001 C CNN
F 3 "~" H 2300 7050 50  0001 C CNN
	1    2100 7050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5DE641C2
P 3450 7050
F 0 "TP5" H 3508 7168 50  0000 L CNN
F 1 "TestPoint" H 3508 7077 50  0000 L CNN
F 2 "Sync-chan:TP_1PAD" H 3650 7050 50  0001 C CNN
F 3 "~" H 3650 7050 50  0001 C CNN
	1    3450 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 7050 2100 7300
Connection ~ 2100 7300
Wire Wire Line
	2100 7300 2150 7300
Wire Wire Line
	3450 7050 3450 7300
Wire Wire Line
	3500 7300 3450 7300
Connection ~ 3450 7300
$Comp
L Connector:TestPoint TP3
U 1 1 5DE72041
P 2400 4750
F 0 "TP3" H 2458 4868 50  0000 L CNN
F 1 "TestPoint" H 2458 4777 50  0000 L CNN
F 2 "Sync-chan:TP_1PAD" H 2600 4750 50  0001 C CNN
F 3 "~" H 2600 4750 50  0001 C CNN
	1    2400 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4750 2400 4900
Connection ~ 2400 4900
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 5DEC82AC
P 3950 4400
F 0 "U1" H 3763 4446 50  0000 R CNN
F 1 "LM358MX" H 3763 4355 50  0000 R CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3950 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 3950 4400 50  0001 C CNN
	3    3950 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5DECE2A1
P 3850 4050
F 0 "#PWR010" H 3850 3900 50  0001 C CNN
F 1 "+5V" H 3865 4223 50  0000 C CNN
F 2 "" H 3850 4050 50  0001 C CNN
F 3 "" H 3850 4050 50  0001 C CNN
	1    3850 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DECEEAE
P 4200 4400
F 0 "C2" H 4315 4446 50  0000 L CNN
F 1 "0.1u" H 4315 4355 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4238 4250 50  0001 C CNN
F 3 "~" H 4200 4400 50  0001 C CNN
	1    4200 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5DED8466
P 3850 4750
F 0 "#PWR014" H 3850 4500 50  0001 C CNN
F 1 "GND" H 3855 4577 50  0000 C CNN
F 2 "" H 3850 4750 50  0001 C CNN
F 3 "" H 3850 4750 50  0001 C CNN
	1    3850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4700 3850 4750
Wire Wire Line
	3850 4050 3850 4100
Wire Wire Line
	4200 4250 4200 4050
Wire Wire Line
	4200 4050 3850 4050
Connection ~ 3850 4050
Wire Wire Line
	4200 4550 4200 4700
Wire Wire Line
	4200 4700 3850 4700
Connection ~ 3850 4700
Text Notes 1750 4400 0    100  ~ 20
Sync In
Text GLabel 3200 9450 0    50   Input ~ 0
LED_Internal
Text GLabel 3800 9450 0    50   Input ~ 0
LED_Ext.
$Comp
L Device:R R11
U 1 1 5DF4D123
P 3200 9750
F 0 "R11" H 3270 9796 50  0000 L CNN
F 1 "1k" H 3270 9705 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3130 9750 50  0001 C CNN
F 3 "~" H 3200 9750 50  0001 C CNN
	1    3200 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED5
U 1 1 5DF4E250
P 3200 10050
F 0 "LED5" V 3239 9932 50  0000 R CNN
F 1 "LED" V 3148 9932 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 3200 10050 50  0001 C CNN
F 3 "~" H 3200 10050 50  0001 C CNN
	1    3200 10050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5DF4EF18
P 3200 10200
F 0 "#PWR048" H 3200 9950 50  0001 C CNN
F 1 "GND" H 3205 10027 50  0000 C CNN
F 2 "" H 3200 10200 50  0001 C CNN
F 3 "" H 3200 10200 50  0001 C CNN
	1    3200 10200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 9450 3200 9600
$Comp
L Device:R R12
U 1 1 5DF5E0B8
P 3850 9750
F 0 "R12" H 3920 9796 50  0000 L CNN
F 1 "1k" H 3920 9705 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3780 9750 50  0001 C CNN
F 3 "~" H 3850 9750 50  0001 C CNN
	1    3850 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED6
U 1 1 5DF5E0BE
P 3850 10050
F 0 "LED6" V 3889 9932 50  0000 R CNN
F 1 "LED" V 3798 9932 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 3850 10050 50  0001 C CNN
F 3 "~" H 3850 10050 50  0001 C CNN
	1    3850 10050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR049
U 1 1 5DF5E0C4
P 3850 10200
F 0 "#PWR049" H 3850 9950 50  0001 C CNN
F 1 "GND" H 3855 10027 50  0000 C CNN
F 2 "" H 3850 10200 50  0001 C CNN
F 3 "" H 3850 10200 50  0001 C CNN
	1    3850 10200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 9450 3850 9450
Wire Wire Line
	3850 9450 3850 9600
Text GLabel 2400 9450 0    50   Input ~ 0
LED_Tap
$Comp
L Device:R R10
U 1 1 5DFF53A1
P 2400 9750
F 0 "R10" H 2470 9796 50  0000 L CNN
F 1 "1k" H 2470 9705 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2330 9750 50  0001 C CNN
F 3 "~" H 2400 9750 50  0001 C CNN
	1    2400 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED4
U 1 1 5DFF53A7
P 2400 10050
F 0 "LED4" V 2439 9932 50  0000 R CNN
F 1 "LED" V 2348 9932 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 2400 10050 50  0001 C CNN
F 3 "~" H 2400 10050 50  0001 C CNN
	1    2400 10050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5DFF53AD
P 2400 10200
F 0 "#PWR047" H 2400 9950 50  0001 C CNN
F 1 "GND" H 2405 10027 50  0000 C CNN
F 2 "" H 2400 10200 50  0001 C CNN
F 3 "" H 2400 10200 50  0001 C CNN
	1    2400 10200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2400 9450 2400 9600
$Comp
L Device:R R9
U 1 1 5E07F7A1
P 1800 9750
F 0 "R9" H 1870 9796 50  0000 L CNN
F 1 "1k" H 1870 9705 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1730 9750 50  0001 C CNN
F 3 "~" H 1800 9750 50  0001 C CNN
	1    1800 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED3
U 1 1 5E07F7A7
P 1800 10050
F 0 "LED3" V 1839 9932 50  0000 R CNN
F 1 "LED" V 1748 9932 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 1800 10050 50  0001 C CNN
F 3 "~" H 1800 10050 50  0001 C CNN
	1    1800 10050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR046
U 1 1 5E07F7AD
P 1800 10200
F 0 "#PWR046" H 1800 9950 50  0001 C CNN
F 1 "GND" H 1805 10027 50  0000 C CNN
F 2 "" H 1800 10200 50  0001 C CNN
F 3 "" H 1800 10200 50  0001 C CNN
	1    1800 10200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1800 9450 1800 9600
Text GLabel 4800 9450 0    50   Input ~ 0
LED_Fader_Center
$Comp
L Device:R R13
U 1 1 5E097642
P 4900 9750
F 0 "R13" H 4970 9796 50  0000 L CNN
F 1 "1k" H 4970 9705 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4830 9750 50  0001 C CNN
F 3 "~" H 4900 9750 50  0001 C CNN
	1    4900 9750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED LED7
U 1 1 5E097648
P 4900 10050
F 0 "LED7" V 4939 9932 50  0000 R CNN
F 1 "LED" V 4848 9932 50  0000 R CNN
F 2 "Sync-chan:LED_0603_HandSoldering_easier" H 4900 10050 50  0001 C CNN
F 3 "~" H 4900 10050 50  0001 C CNN
	1    4900 10050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR050
U 1 1 5E09764E
P 4900 10200
F 0 "#PWR050" H 4900 9950 50  0001 C CNN
F 1 "GND" H 4905 10027 50  0000 C CNN
F 2 "" H 4900 10200 50  0001 C CNN
F 3 "" H 4900 10200 50  0001 C CNN
	1    4900 10200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 9450 4900 9600
Wire Wire Line
	4800 9450 4900 9450
$Comp
L dk_Tactile-Switches:B3U-1000P S1
U 1 1 5E0CCFF2
P 1950 8700
F 0 "S1" V 2003 8656 60  0000 R CNN
F 1 "Tactile" V 1897 8656 60  0000 R CNN
F 2 "Sync-chan:SW_Tactile_Akizuki" H 2150 8900 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 2150 9000 60  0001 L CNN
F 4 "SW1020CT-ND" H 2150 9100 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 2150 9200 60  0001 L CNN "MPN"
F 6 "Switches" H 2150 9300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 2150 9400 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 2150 9500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 2150 9600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 2150 9700 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 2150 9800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2150 9900 60  0001 L CNN "Status"
	1    1950 8700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 8900 1950 8950
$Comp
L dk_Tactile-Switches:B3U-1000P S2
U 1 1 5E0E2582
P 2500 8700
F 0 "S2" V 2553 8656 60  0000 R CNN
F 1 "Tactile" V 2447 8656 60  0000 R CNN
F 2 "Sync-chan:SW_Tactile_Akizuki" H 2700 8900 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 2700 9000 60  0001 L CNN
F 4 "SW1020CT-ND" H 2700 9100 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 2700 9200 60  0001 L CNN "MPN"
F 6 "Switches" H 2700 9300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 2700 9400 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 2700 9500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 2700 9600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 2700 9700 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 2700 9800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2700 9900 60  0001 L CNN "Status"
	1    2500 8700
	0    -1   -1   0   
$EndComp
$Comp
L dk_Tactile-Switches:B3U-1000P S3
U 1 1 5E0E364D
P 3050 8700
F 0 "S3" V 3103 8656 60  0000 R CNN
F 1 "Tactile" V 2997 8656 60  0000 R CNN
F 2 "Sync-chan:SW_Tactile_Akizuki" H 3250 8900 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 3250 9000 60  0001 L CNN
F 4 "SW1020CT-ND" H 3250 9100 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 3250 9200 60  0001 L CNN "MPN"
F 6 "Switches" H 3250 9300 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 3250 9400 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 3250 9500 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 3250 9600 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 3250 9700 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 3250 9800 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3250 9900 60  0001 L CNN "Status"
	1    3050 8700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 8900 2500 8950
Wire Wire Line
	3050 8900 3050 8950
Text GLabel 10750 6700 0    50   Input ~ 0
Sync_Out
$Comp
L 4xxx:4050 U4
U 7 1 5E218C07
P 10750 7650
F 0 "U4" H 10980 7696 50  0000 L CNN
F 1 "74HC4050" H 10980 7605 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 10750 7650 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 10750 7650 50  0001 C CNN
	7    10750 7650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5E219D1A
P 10750 7150
F 0 "#PWR032" H 10750 7000 50  0001 C CNN
F 1 "+5V" H 10765 7323 50  0000 C CNN
F 2 "" H 10750 7150 50  0001 C CNN
F 3 "" H 10750 7150 50  0001 C CNN
	1    10750 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 5E21A46D
P 10750 8150
F 0 "#PWR038" H 10750 7900 50  0001 C CNN
F 1 "GND" H 10755 7977 50  0000 C CNN
F 2 "" H 10750 8150 50  0001 C CNN
F 3 "" H 10750 8150 50  0001 C CNN
	1    10750 8150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5E21A92E
P 10200 7650
F 0 "C8" H 10315 7696 50  0000 L CNN
F 1 "0.1u" H 10315 7605 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10238 7500 50  0001 C CNN
F 3 "~" H 10200 7650 50  0001 C CNN
	1    10200 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 7150 10200 7150
Wire Wire Line
	10200 7150 10200 7500
Connection ~ 10750 7150
Wire Wire Line
	10750 8150 10200 8150
Wire Wire Line
	10200 8150 10200 7800
Connection ~ 10750 8150
$Comp
L 4xxx:4050 U4
U 1 1 5E2277FB
P 11750 6700
F 0 "U4" H 11750 7017 50  0000 C CNN
F 1 "74HC4050" H 11750 6926 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11750 6700 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 11750 6700 50  0001 C CNN
	1    11750 6700
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 2 1 5E2293EC
P 11750 7350
F 0 "U4" H 11750 7667 50  0000 C CNN
F 1 "74HC4050" H 11750 7576 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11750 7350 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 11750 7350 50  0001 C CNN
	2    11750 7350
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 3 1 5E229A2B
P 11750 8000
F 0 "U4" H 11750 8317 50  0000 C CNN
F 1 "74HC4050" H 11750 8226 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11750 8000 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 11750 8000 50  0001 C CNN
	3    11750 8000
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 4 1 5E22A5D0
P 11750 8650
F 0 "U4" H 11750 8967 50  0000 C CNN
F 1 "74HC4050" H 11750 8876 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11750 8650 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 11750 8650 50  0001 C CNN
	4    11750 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	11450 7350 11250 7350
Wire Wire Line
	12050 6700 12900 6700
Wire Wire Line
	12900 7350 12050 7350
Wire Wire Line
	12900 8000 12050 8000
Wire Wire Line
	12900 8650 12050 8650
Wire Wire Line
	11450 8000 11250 8000
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5E95032E
P 2000 1750
F 0 "#FLG02" H 2000 1825 50  0001 C CNN
F 1 "PWR_FLAG" V 2000 1877 50  0000 L CNN
F 2 "" H 2000 1750 50  0001 C CNN
F 3 "~" H 2000 1750 50  0001 C CNN
	1    2000 1750
	0    -1   -1   0   
$EndComp
Text Notes 12950 6300 0    100  ~ 20
Sync Out
$Comp
L power:+5V #PWR018
U 1 1 5E9714F9
P 5600 4250
F 0 "#PWR018" H 5600 4100 50  0001 C CNN
F 1 "+5V" H 5615 4423 50  0000 C CNN
F 2 "" H 5600 4250 50  0001 C CNN
F 3 "" H 5600 4250 50  0001 C CNN
	1    5600 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5E9714FF
P 6000 4400
F 0 "C6" H 6115 4446 50  0000 L CNN
F 1 "0.1u" H 6115 4355 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6038 4250 50  0001 C CNN
F 3 "~" H 6000 4400 50  0001 C CNN
	1    6000 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5E971505
P 5600 4550
F 0 "#PWR023" H 5600 4300 50  0001 C CNN
F 1 "GND" H 5605 4377 50  0000 C CNN
F 2 "" H 5600 4550 50  0001 C CNN
F 3 "" H 5600 4550 50  0001 C CNN
	1    5600 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C7
U 1 1 5E97DEBC
P 5600 4400
F 0 "C7" H 5715 4446 50  0000 L CNN
F 1 "100u" H 5715 4355 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 5638 4250 50  0001 C CNN
F 3 "~" H 5600 4400 50  0001 C CNN
	1    5600 4400
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 5 1 5E98B646
P 12050 9450
F 0 "U4" H 12050 9767 50  0000 C CNN
F 1 "74HC4050" H 12050 9676 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 12050 9450 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 12050 9450 50  0001 C CNN
	5    12050 9450
	1    0    0    -1  
$EndComp
$Comp
L 4xxx:4050 U4
U 6 1 5E98C6AA
P 11050 9450
F 0 "U4" H 11050 9767 50  0000 C CNN
F 1 "74HC4050" H 11050 9676 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 11050 9450 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/intersil/documents/cd40/cd4050bms.pdf" H 11050 9450 50  0001 C CNN
	6    11050 9450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5E98EB4B
P 10650 9450
F 0 "#PWR044" H 10650 9200 50  0001 C CNN
F 1 "GND" H 10655 9277 50  0000 C CNN
F 2 "" H 10650 9450 50  0001 C CNN
F 3 "" H 10650 9450 50  0001 C CNN
	1    10650 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 9450 10650 9450
$Comp
L power:GND #PWR045
U 1 1 5E99BB7A
P 11650 9450
F 0 "#PWR045" H 11650 9200 50  0001 C CNN
F 1 "GND" H 11655 9277 50  0000 C CNN
F 2 "" H 11650 9450 50  0001 C CNN
F 3 "" H 11650 9450 50  0001 C CNN
	1    11650 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11650 9450 11750 9450
NoConn ~ 11350 9450
NoConn ~ 12350 9450
$Comp
L Switch:SW_SPDT SW1
U 1 1 5EAA7773
P 2350 1300
F 0 "SW1" H 2350 1585 50  0000 C CNN
F 1 "SW_SPDT" H 2350 1494 50  0000 C CNN
F 2 "Sync-chan:SW_SPDT_2.5mm" H 2350 1300 50  0001 C CNN
F 3 "~" H 2350 1300 50  0001 C CNN
	1    2350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1200 3000 1200
NoConn ~ 2550 1400
$Comp
L Sync-chan:R_POT_W_GND RV2
U 1 1 5EB00A0D
P 1900 7300
F 0 "RV2" H 1756 7254 50  0000 R CNN
F 1 "10k" H 1756 7345 50  0000 R CNN
F 2 "Sync-chan:POT_Slide_SL4515N" H 1900 7300 50  0001 C CNN
F 3 "~" H 1900 7300 50  0001 C CNN
	1    1900 7300
	1    0    0    1   
$EndComp
Wire Wire Line
	2750 4900 2400 4900
Wire Wire Line
	2750 4900 2750 5050
Wire Wire Line
	2750 5350 2750 5450
$Comp
L power:GND #PWR027
U 1 1 5EB8160D
P 1700 7100
F 0 "#PWR027" H 1700 6850 50  0001 C CNN
F 1 "GND" V 1705 6972 50  0000 R CNN
F 2 "" H 1700 7100 50  0001 C CNN
F 3 "" H 1700 7100 50  0001 C CNN
	1    1700 7100
	0    1    -1   0   
$EndComp
Wire Wire Line
	1700 7100 1800 7100
Wire Wire Line
	1800 7100 1800 7150
Wire Wire Line
	1900 7100 1900 7150
$Comp
L Sync-chan:R_POT_W_GND RV3
U 1 1 5EB9D626
P 3200 7300
F 0 "RV3" H 3056 7254 50  0000 R CNN
F 1 "10k" H 3056 7345 50  0000 R CNN
F 2 "Sync-chan:Potentiometer_Alps_RK09K_Horizontal_CORRECTED" H 3200 7300 50  0001 C CNN
F 3 "~" H 3200 7300 50  0001 C CNN
	1    3200 7300
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5EB9DC9E
P 3000 7150
F 0 "#PWR031" H 3000 6900 50  0001 C CNN
F 1 "GND" V 3005 7022 50  0000 R CNN
F 2 "" H 3000 7150 50  0001 C CNN
F 3 "" H 3000 7150 50  0001 C CNN
	1    3000 7150
	0    1    -1   0   
$EndComp
Wire Wire Line
	3000 7150 3100 7150
$Comp
L Sync-chan:AudioJack3_Ring_Switch J3
U 1 1 5EC4AB69
P 13100 6900
F 0 "J3" H 12820 6808 50  0000 R CNN
F 1 "AudioJack3_Ring_Switch" H 12820 6899 50  0000 R CNN
F 2 "Sync-chan:3.5mm_Stereo_Molex_0472570001" H 13100 6900 50  0001 C CNN
F 3 "~" H 13100 6900 50  0001 C CNN
	1    13100 6900
	-1   0    0    1   
$EndComp
NoConn ~ 12900 6800
NoConn ~ 12900 6900
$Comp
L power:GND #PWR030
U 1 1 5EC9B199
P 12900 7100
F 0 "#PWR030" H 12900 6850 50  0001 C CNN
F 1 "GND" V 12905 6972 50  0000 R CNN
F 2 "" H 12900 7100 50  0001 C CNN
F 3 "" H 12900 7100 50  0001 C CNN
	1    12900 7100
	0    1    1    0   
$EndComp
Wire Wire Line
	10750 6700 11250 6700
Wire Wire Line
	11250 6700 11250 7350
Connection ~ 11250 6700
Wire Wire Line
	11250 6700 11450 6700
Wire Wire Line
	11250 7350 11250 8000
Connection ~ 11250 7350
Wire Wire Line
	11250 8000 11250 8650
Wire Wire Line
	11250 8650 11450 8650
Connection ~ 11250 8000
$Comp
L power:GND #PWR037
U 1 1 5ED42DBB
P 12900 7750
F 0 "#PWR037" H 12900 7500 50  0001 C CNN
F 1 "GND" V 12905 7622 50  0000 R CNN
F 2 "" H 12900 7750 50  0001 C CNN
F 3 "" H 12900 7750 50  0001 C CNN
	1    12900 7750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5ED43537
P 12900 8400
F 0 "#PWR039" H 12900 8150 50  0001 C CNN
F 1 "GND" V 12905 8272 50  0000 R CNN
F 2 "" H 12900 8400 50  0001 C CNN
F 3 "" H 12900 8400 50  0001 C CNN
	1    12900 8400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5ED43D97
P 12900 9050
F 0 "#PWR043" H 12900 8800 50  0001 C CNN
F 1 "GND" V 12905 8922 50  0000 R CNN
F 2 "" H 12900 9050 50  0001 C CNN
F 3 "" H 12900 9050 50  0001 C CNN
	1    12900 9050
	0    1    1    0   
$EndComp
NoConn ~ 12900 7450
NoConn ~ 12900 7550
NoConn ~ 12900 8100
NoConn ~ 12900 8200
NoConn ~ 12900 8750
NoConn ~ 12900 8850
$Comp
L Mechanical:MountingHole H1
U 1 1 5EDAA58E
P 15250 6500
F 0 "H1" H 15350 6546 50  0000 L CNN
F 1 "MountingHole" H 15350 6455 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 6500 50  0001 C CNN
F 3 "~" H 15250 6500 50  0001 C CNN
	1    15250 6500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EDAB148
P 15250 6750
F 0 "H2" H 15350 6796 50  0000 L CNN
F 1 "MountingHole" H 15350 6705 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 6750 50  0001 C CNN
F 3 "~" H 15250 6750 50  0001 C CNN
	1    15250 6750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EDB7D17
P 15250 7000
F 0 "H3" H 15350 7046 50  0000 L CNN
F 1 "MountingHole" H 15350 6955 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 7000 50  0001 C CNN
F 3 "~" H 15250 7000 50  0001 C CNN
	1    15250 7000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EDC488F
P 15250 7250
F 0 "H4" H 15350 7296 50  0000 L CNN
F 1 "MountingHole" H 15350 7205 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 7250 50  0001 C CNN
F 3 "~" H 15250 7250 50  0001 C CNN
	1    15250 7250
	1    0    0    -1  
$EndComp
$Comp
L Sync-chan:AudioJack3_Ring_Switch J2
U 1 1 5DE0A758
P 1800 5100
F 0 "J2" H 1520 5008 50  0000 R CNN
F 1 "AudioJack3_Ring_Switch" H 1520 5099 50  0000 R CNN
F 2 "Sync-chan:3.5mm_Stereo_Molex_0472570001" H 1800 5100 50  0001 C CNN
F 3 "~" H 1800 5100 50  0001 C CNN
	1    1800 5100
	1    0    0    1   
$EndComp
Wire Wire Line
	2000 4900 2400 4900
NoConn ~ 2000 5000
NoConn ~ 2000 5100
$Comp
L MCU_Module:Arduino_Nano_v3.x U3
U 1 1 5DEC6BEF
P 7100 7500
F 0 "U3" H 7100 8850 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 7100 8750 50  0000 C CNN
F 2 "Modules:Arduino_Nano" H 7250 6550 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 7100 6500 50  0001 C CNN
	1    7100 7500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5DEE6821
P 7300 6500
F 0 "#PWR017" H 7300 6350 50  0001 C CNN
F 1 "+5V" H 7315 6673 50  0000 C CNN
F 2 "" H 7300 6500 50  0001 C CNN
F 3 "" H 7300 6500 50  0001 C CNN
	1    7300 6500
	1    0    0    -1  
$EndComp
NoConn ~ 7000 6500
NoConn ~ 7200 6500
NoConn ~ 7600 6900
NoConn ~ 7600 7000
Text GLabel 6600 8000 0    50   Output ~ 0
DIN
Text GLabel 6600 8100 0    50   Output ~ 0
SCLK
Text GLabel 6600 7100 0    50   Input ~ 0
Ext.Sync
Text GLabel 7650 7600 2    50   Input ~ 0
Fader
Wire Wire Line
	7650 7600 7600 7600
Text GLabel 7650 7700 2    50   Input ~ 0
Tempo
Wire Wire Line
	7650 7700 7600 7700
Text GLabel 6600 7200 0    50   Input ~ 0
Tap
Text GLabel 6600 7300 0    50   Input ~ 0
Nudge-
Text GLabel 6600 7400 0    50   Input ~ 0
Nudge+
Text GLabel 6600 7700 0    50   Input ~ 0
LED_Internal
Text GLabel 6600 7800 0    50   Input ~ 0
LED_Ext.
Text GLabel 6600 7600 0    50   Input ~ 0
LED_Tap
Text GLabel 6600 7900 0    50   Input ~ 0
LED_Fader_Center
$Comp
L power:GND #PWR033
U 1 1 5E0BA634
P 7100 8500
F 0 "#PWR033" H 7100 8250 50  0001 C CNN
F 1 "GND" H 7105 8327 50  0000 C CNN
F 2 "" H 7100 8500 50  0001 C CNN
F 3 "" H 7100 8500 50  0001 C CNN
	1    7100 8500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5E0BAF41
P 7200 8500
F 0 "#PWR034" H 7200 8250 50  0001 C CNN
F 1 "GND" H 7205 8327 50  0000 C CNN
F 2 "" H 7200 8500 50  0001 C CNN
F 3 "" H 7200 8500 50  0001 C CNN
	1    7200 8500
	1    0    0    -1  
$EndComp
NoConn ~ 7600 7300
NoConn ~ 7600 7800
NoConn ~ 7600 7900
NoConn ~ 7600 8000
NoConn ~ 7600 8100
NoConn ~ 7600 8200
NoConn ~ 6600 6900
$Comp
L Sync-chan:AudioJack3_Ring_Switch J4
U 1 1 5DE6F38D
P 13100 7550
F 0 "J4" H 12820 7458 50  0000 R CNN
F 1 "AudioJack3_Ring_Switch" H 12820 7549 50  0000 R CNN
F 2 "Sync-chan:3.5mm_Stereo_Molex_0472570001" H 13100 7550 50  0001 C CNN
F 3 "~" H 13100 7550 50  0001 C CNN
	1    13100 7550
	-1   0    0    1   
$EndComp
$Comp
L Sync-chan:AudioJack3_Ring_Switch J5
U 1 1 5DE70364
P 13100 8200
F 0 "J5" H 12820 8108 50  0000 R CNN
F 1 "AudioJack3_Ring_Switch" H 12820 8199 50  0000 R CNN
F 2 "Sync-chan:3.5mm_Stereo_Molex_0472570001" H 13100 8200 50  0001 C CNN
F 3 "~" H 13100 8200 50  0001 C CNN
	1    13100 8200
	-1   0    0    1   
$EndComp
$Comp
L Sync-chan:AudioJack3_Ring_Switch J6
U 1 1 5DE709AA
P 13100 8850
F 0 "J6" H 12820 8758 50  0000 R CNN
F 1 "AudioJack3_Ring_Switch" H 12820 8849 50  0000 R CNN
F 2 "Sync-chan:3.5mm_Stereo_Molex_0472570001" H 13100 8850 50  0001 C CNN
F 3 "~" H 13100 8850 50  0001 C CNN
	1    13100 8850
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 5DECA2F0
P 2750 5200
F 0 "RV1" H 2680 5154 50  0000 R CNN
F 1 "10k" H 2680 5245 50  0000 R CNN
F 2 "Sync-chan:POT_TOCOS_GF063P1" H 2750 5200 50  0001 C CNN
F 3 "~" H 2750 5200 50  0001 C CNN
	1    2750 5200
	1    0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5DE90EA7
P 4100 5150
F 0 "TP6" H 4158 5268 50  0000 L CNN
F 1 "TestPoint" H 4158 5177 50  0000 L CNN
F 2 "Sync-chan:TP_1PAD" H 4300 5150 50  0001 C CNN
F 3 "~" H 4300 5150 50  0001 C CNN
	1    4100 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5150 4100 5300
Text GLabel 7650 7500 2    50   Output ~ 0
Sync_Out
Wire Wire Line
	7600 7500 7650 7500
NoConn ~ 6600 7000
NoConn ~ 6600 7500
Text GLabel 1800 9450 0    50   Input ~ 0
Sync_Out
$Comp
L Sync-chan:7seg_4digit_cathode_common_OSL40562-LR 7SEG-1
U 1 1 5E0D030C
P 10800 3800
F 0 "7SEG-1" H 12028 3596 50  0000 L CNN
F 1 "7seg_4digit_cathode_common_OSL40562-LR" H 12028 3505 50  0000 L CNN
F 2 "Sync-chan:7seg_4digit_cathode_common_OSL40562-LR" H 10550 3850 50  0001 C CNN
F 3 "" H 10550 3850 50  0001 C CNN
	1    10800 3800
	1    0    0    -1  
$EndComp
$Comp
L Sync-chan:TM1640_7seg_driver U2
U 1 1 5E0D3F29
P 7050 3950
F 0 "U2" H 7025 4965 50  0000 C CNN
F 1 "TM1640_7seg_driver" H 7025 4874 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-28W_7.5x18.7mm_Pitch1.27mm" H 7050 5000 50  0001 C CNN
F 3 "" H 7050 5000 50  0001 C CNN
	1    7050 3950
	1    0    0    -1  
$EndComp
NoConn ~ 6600 8200
Wire Wire Line
	6250 4300 6250 4250
Wire Wire Line
	6250 4250 6000 4250
Connection ~ 6000 4250
Wire Wire Line
	6250 4550 6000 4550
Connection ~ 6000 4550
Wire Wire Line
	6000 4250 5600 4250
Wire Wire Line
	5600 4550 6000 4550
Connection ~ 5600 4250
Connection ~ 5600 4550
Text GLabel 5400 3850 0    50   Input ~ 0
DIN
Text GLabel 5400 3950 0    50   Input ~ 0
SCLK
Text GLabel 7900 3200 2    50   Output ~ 0
DIGIT1
Text GLabel 7900 3300 2    50   Output ~ 0
DIGIT2
Text GLabel 7900 3400 2    50   Output ~ 0
DIGIT3
Text GLabel 7900 3500 2    50   Output ~ 0
DIGIT4
Wire Wire Line
	7900 3200 7800 3200
Wire Wire Line
	7900 3300 7800 3300
Wire Wire Line
	7900 3400 7800 3400
Wire Wire Line
	7900 3500 7800 3500
Text GLabel 7900 4850 2    50   Output ~ 0
A
Text GLabel 7900 4950 2    50   Output ~ 0
B
Text GLabel 7900 5050 2    50   Output ~ 0
C
Text GLabel 7900 5150 2    50   Output ~ 0
D
Text GLabel 7900 5250 2    50   Output ~ 0
E
Text GLabel 7900 5350 2    50   Output ~ 0
F
Text GLabel 7900 5450 2    50   Output ~ 0
G
Text GLabel 7900 5550 2    50   Output ~ 0
DP
Wire Wire Line
	7800 4850 7900 4850
Wire Wire Line
	7800 4950 7900 4950
Wire Wire Line
	7800 5050 7900 5050
Wire Wire Line
	7800 5150 7900 5150
Wire Wire Line
	7800 5250 7900 5250
Wire Wire Line
	7900 5350 7800 5350
Wire Wire Line
	7800 5450 7900 5450
Wire Wire Line
	7800 5550 7900 5550
NoConn ~ 7800 3600
NoConn ~ 7800 3700
NoConn ~ 7800 3800
NoConn ~ 7800 3900
NoConn ~ 7800 4000
NoConn ~ 7800 4100
NoConn ~ 7800 4200
NoConn ~ 7800 4300
NoConn ~ 7800 4400
NoConn ~ 7800 4500
NoConn ~ 7800 4600
NoConn ~ 7800 4700
Text GLabel 10450 5150 3    50   Input ~ 0
A
Text GLabel 10550 5150 3    50   Input ~ 0
B
Text GLabel 10650 5150 3    50   Input ~ 0
C
Text GLabel 10750 5150 3    50   Input ~ 0
D
Text GLabel 10850 5150 3    50   Input ~ 0
E
Text GLabel 10950 5150 3    50   Input ~ 0
F
Text GLabel 11050 5150 3    50   Input ~ 0
G
Text GLabel 11150 5150 3    50   Input ~ 0
DP
Wire Wire Line
	10450 5150 10450 5100
Wire Wire Line
	10550 5150 10550 5100
Wire Wire Line
	10650 5150 10650 5100
Wire Wire Line
	10750 5150 10750 5100
Wire Wire Line
	10850 5150 10850 5100
Wire Wire Line
	10950 5150 10950 5100
Wire Wire Line
	11050 5150 11050 5100
Wire Wire Line
	11150 5150 11150 5100
Text GLabel 10400 2900 1    50   Input ~ 0
DIGIT1
Wire Wire Line
	10400 2900 10400 3000
Text GLabel 10700 2900 1    50   Input ~ 0
DIGIT2
Text GLabel 10950 2900 1    50   Input ~ 0
DIGIT3
Text GLabel 11200 2900 1    50   Input ~ 0
DIGIT4
Wire Wire Line
	10700 2900 10700 3000
Wire Wire Line
	10950 2900 10950 3000
Wire Wire Line
	11200 2900 11200 3000
$Comp
L Device:R R3
U 1 1 5E1BB303
P 6050 3550
F 0 "R3" H 6120 3596 50  0000 L CNN
F 1 "10k" H 6120 3505 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5980 3550 50  0001 C CNN
F 3 "~" H 6050 3550 50  0001 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E1BF746
P 5750 3550
F 0 "R2" H 5820 3596 50  0000 L CNN
F 1 "10k" H 5820 3505 50  0000 L CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5680 3550 50  0001 C CNN
F 3 "~" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5E1C024A
P 5750 3400
F 0 "#PWR06" H 5750 3250 50  0001 C CNN
F 1 "+5V" H 5765 3573 50  0000 C CNN
F 2 "" H 5750 3400 50  0001 C CNN
F 3 "" H 5750 3400 50  0001 C CNN
	1    5750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5E1C08E3
P 6050 3400
F 0 "#PWR07" H 6050 3250 50  0001 C CNN
F 1 "+5V" H 6065 3573 50  0000 C CNN
F 2 "" H 6050 3400 50  0001 C CNN
F 3 "" H 6050 3400 50  0001 C CNN
	1    6050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3850 5750 3850
Wire Wire Line
	5750 3700 5750 3850
Connection ~ 5750 3850
Wire Wire Line
	5750 3850 6250 3850
Wire Wire Line
	5400 3950 6050 3950
Wire Wire Line
	6050 3700 6050 3950
Connection ~ 6050 3950
Wire Wire Line
	6050 3950 6250 3950
$Comp
L Mechanical:MountingHole H5
U 1 1 5E203AEA
P 15250 7500
F 0 "H5" H 15350 7546 50  0000 L CNN
F 1 "MountingHole" H 15350 7455 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 7500 50  0001 C CNN
F 3 "~" H 15250 7500 50  0001 C CNN
	1    15250 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E203EA8
P 15250 7750
F 0 "H6" H 15350 7796 50  0000 L CNN
F 1 "MountingHole" H 15350 7705 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3" H 15250 7750 50  0001 C CNN
F 3 "~" H 15250 7750 50  0001 C CNN
	1    15250 7750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
