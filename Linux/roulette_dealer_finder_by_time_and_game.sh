#!/bin/bash
echo
echo Lucky Duck Dealer Look Up
echo
echo Please input date of incident as:
echo mmdd
read dateInput
resultDate=${dateInput:0:2}"/"${dateInput:2:2}

echo
echo Please input hour of incident as:
echo hh
read timeInput
echo AM or PM?
read AM_PM
AM_PM=${AM_PM^^}
resultTime=${timeInput:0:2}":00:00 "$AM_PM

echo
echo Please choose a game:
echo B-Blackjack R-Roulette T-Texas Holdem
read gameInput

if [ $gameInput = "B" ] || [ $gameInput = "b" ];
then
	resultDealer=$(grep "$resultTime" $dateInput"_Dealer_schedule" | awk -F' ' '{print $3, $4}')
	resultGame="Blackjack"
fi

if [ $gameInput = "R" ] || [ $gameInput = "r" ];
then
	resultDealer=$(grep "$resultTime" $dateInput"_Dealer_schedule" | awk -F' ' '{print $5, $6}')
	resultGame="Roulette"
fi

if [ $gameInput = "T" ] || [ $gameInput = "t" ];
then
	resultDealer=$(grep "$resultTime" $dateInput"_Dealer_schedule" | awk -F' ' '{print $7, $8}')
	resultGame="Texas Holdem"
fi

echo
echo Here are your results:
echo
echo $resultDealer was dealing $resultGame at $resultTime on $resultDate
echo
