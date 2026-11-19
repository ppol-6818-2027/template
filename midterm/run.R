# The exhibits for the registered report, midterm/midterm.qmd.
# The root run.R runs this file. Paths start at the repository root.
#
# Save each table and figure into midterm/exhibits/, and show it in
# midterm.qmd by its path from this folder. A figure:
#   png("midterm/exhibits/figure1.png", width = 6.5, height = 3.6, units = "in", res = 300)
#   ... plot ...
#   dev.off()
# shown with
#   ![Your caption.](exhibits/figure1.png){#fig-design}
# A table, as Markdown:
#   writeLines(knitr::kable(table1), "midterm/exhibits/table1.md")
# shown with
#   ::: {#tbl-balance}
#   {{< include exhibits/table1.md >}}
#
#   Your caption.
#   :::
# Only aggregates go in exhibits/, never rows of data.

dir.create("midterm/exhibits", showWarnings = FALSE)
