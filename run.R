# Run everything in this repository from a fresh clone.
# Data is downloaded here, with your own IPUMS key, and never committed.

dir.create("data", showWarnings = FALSE)

# 1. Download data (example: see ppol6818's inst/examples/ipums-extract.R)
# source("R/01-download.R")

# 2. Build the analysis data
# source("R/02-build.R")

# 3. Tables and figures for the minisite, written into exhibits/
#    (aggregates only: exhibits/ is published with the minisite)
dir.create("exhibits", showWarnings = FALSE)
# source("R/03-exhibits.R")

# 4. Build the minisite into docs/ (or Addins > Build minisite)
# ppol6818::build_site()

