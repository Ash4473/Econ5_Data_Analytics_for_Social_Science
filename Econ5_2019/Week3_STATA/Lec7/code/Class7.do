** Author: Arushi Kaushik
** Date: 16th April, 2019
** Project: Econ5/Poli5D Class7



log using "Class7.txt", text replace

clear
cd "/Users/arushikaushik/Desktop/Poli:Econ5/2019/Lec7"

import excel "/Users/arushikaushik/Desktop/Poli:Econ5/2019/Lec7/titanic.xlsx", sheet("titanic") firstrow

su class

log close
