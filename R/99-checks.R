# Outside checks. run.R sources this file last.
#
# An outside check compares a result with a number your agent did not produce:
# a published estimate, the true value in a simulation you built, a hand
# calculation on a few rows, or your partner's independent run. You choose the
# checks (the assignment sheet lists the ones each week needs); your agent may
# write the code. Each check prints PASS or FAIL, and run.R stops if any fails.

checks <- list()

record_check <- function(label, ok, detail = "") {
  ok <- isTRUE(ok)
  cat(sprintf("%s  %s%s\n", if (ok) "PASS" else "FAIL", label,
              if (nzchar(detail)) paste0("  (", detail, ")") else ""))
  checks[[label]] <<- ok
  invisible(ok)
}

# Example, to replace with your own. Write the source of every outside number.
# published <- 0.123  # Census Bureau, table S2701, Kentucky, 2013
# ours <- ...
# record_check("Kentucky 2013 uninsured rate within the published margin of error",
#              abs(ours - published) <= 0.004,
#              sprintf("ours %.3f, published %.3f", ours, published))

if (length(checks) == 0) cat("No checks yet.\n")
if (!all(unlist(checks))) stop("One or more checks failed; see FAIL above.")
