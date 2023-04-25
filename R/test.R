source("R/_packages.R")  # Load your packages, e.g. library(drake).
source("R/_functions.R") # Define your custom code as a bunch of functions.
library(targets)

tar_load(d_main)
names(d_main)

