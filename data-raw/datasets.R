cereal <- read.csv('cereal.csv', sep= ";")
Tomato <- read.csv('Tomato.csv')

library(devtools)
use_data(cereal)
use_data(Tomato)
