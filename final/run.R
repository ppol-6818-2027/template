# The exhibits for the final paper, final/final.qmd.
# The root run.R runs this file. Paths start at the repository root.
#
# Save each table and figure into final/exhibits/, and show it in
# final.qmd by its path from this folder. A figure:
#   png("final/exhibits/figure1.png", width = 6.5, height = 3.6, units = "in", res = 300)
#   ... plot ...
#   dev.off()
# shown with
#   ![Your caption.](exhibits/figure1.png){#fig-design}
# A table, as Markdown:
#   writeLines(knitr::kable(table1), "final/exhibits/table1.md")
# shown with
#   ::: {#tbl-balance}
#   {{< include exhibits/table1.md >}}
#
#   Your caption.
#   :::
# Only aggregates go in exhibits/, never rows of data.

dir.create("final/exhibits", showWarnings = FALSE)
