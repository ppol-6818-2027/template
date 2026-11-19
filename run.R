# Run everything in this repository from a fresh clone.
# Data is downloaded here with ppol6818::ipums_get() and never committed.

dir.create("data", showWarnings = FALSE)

# 1. Get data (example: see ppol6818's inst/examples/ipums-extract.R)
# source("R/01-download.R")

# 2. Build the analysis data
# source("R/02-build.R")

# 3. Tables and figures for the minisite, written into exhibits/
#    (aggregates only: exhibits/ is published with the minisite)
dir.create("exhibits", showWarnings = FALSE)
# source("R/03-exhibits.R")

# 4. The exhibits for the registered report and the final paper, written
#    into midterm/exhibits/ and final/exhibits/
source("midterm/run.R")
source("final/run.R")

# 5. Build the minisite into docs/: Build minisite in the PPOL 6818 panel,
#    or ppol6818::build_site() in the R console
# ppol6818::build_site()

