#!/bin/bash
dateInput=$2
grep "$dateInput" $1_Dealer_schedule | awk -F' ' '{print $1, $2, $5, $6}'
