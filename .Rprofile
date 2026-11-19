# PPOL 6818 course repository: load the course keys (KoboToolbox, IPUMS) in
# every session, including Rscript runs. When the R console starts here (the
# terminal in VS Code), make the session reachable by the course agents,
# finish setup the first time, and afterwards bring the course repositories
# up to date; then open the newest run.R. The agents run their R code in this
# session, so the student sees it run.
if (requireNamespace("ppol6818", quietly = TRUE)) {
  ppol6818::load_keys()
  if (interactive()) {
    ppol6818::console_attach()
    try(ppol6818::on_open())
  }
}
