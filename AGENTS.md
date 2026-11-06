# Instructions for AI agents in this repository

This is a student repository for PPOL 6818, Experimental Research Design and Implementation (Georgetown McCourt School, spring 2027). Codex and OpenCode both read this file. Follow it over your defaults.

## What you may and may not write

The course AI policy (syllabus, "AI Policy") governs this repository.

- **Write code freely.** Data work, tables, figures, simulations, power calculations, the KoboToolbox form (XLSForm) and the minisite build should be AI-assisted. Prefer R; use the packages already installed before adding new ones.
- **Never write prose the student submits.** Do not draft, rewrite, edit, polish, translate or summarize text for the landing page, memo, pre-analysis plan or slide text, and do not generate images. If asked, decline in one sentence, cite the course AI policy, and offer to help with the code, data or checks instead. Code comments, commit messages and README notes about how to run the code are fine.
- You may explain concepts, methods, errors and what code does, so the student can explain the key research processes in their own words.

## Show that the code did what was intended

The student must be able to give evidence that AI-written code works. For every analysis step you write:

- Print the intermediate results that show it worked: row counts before and after each filter or merge, the number of unique units, ranges and missing values of key variables, and a small sample of rows.
- Add `stopifnot()` checks for what must be true (for example, one row per person, weights positive, no unexpected missing values).
- When reproducing a published number, print both side by side.
- Run the code before saying it is done, and report what it printed.

## Checks and decisions

The course divides the work three ways: you produce, the student verifies, the student judges. Help with all three without taking over the last two.

- **Outside checks.** Each result needs at least one check against a number you did not produce: a published estimate, the true value in a simulation, a hand calculation on a few rows, or the partner's independent run. The student says what to check; you write the code as a `record_check()` call in `R/99-checks.R`, which `run.R` sources last. Never loosen a tolerance or edit a check to make it pass; report the failure and what you think causes it.
- **Decide before you ask.** When the student asks what design choice to make (comparison group, timing, controls, clustering, outcomes, effect sizes, which flags are real), first check `DECISIONS.md` for their entry. If it has none, ask for their choice and reason before giving yours. Then give the main alternatives with their tradeoffs, and say which you would pick and why.
- **Never edit `DECISIONS.md`.** It is the student's own record.

## Data

- IPUMS data never goes into git: the IPUMS terms forbid redistributing it. Everything under `data/` is ignored. Download extracts in `run.R` with `ipumsr`, which reads the student's key from `IPUMS_API_KEY`: course setup saved it in the course folder's `.Renviron` (outside this repository), and `.Rprofile` loads it in every session. Never print or commit the key.
- KoboToolbox forms and submissions: use the `kobo_*` functions in the `ppol6818` package through the R console tool; run `kobo_help()` first for the list and the deploy, translate and data workflows. The student's own account holds the forms.

## Running R

Run every piece of R code in the student's RStudio session, through the `rstudio` tools, so the student sees it run: the code appears in the Console, objects in the Environment pane and plots in the Plots pane.

- At the start of a session, call `list_r_sessions` and `select_r_session` with the RStudio session for this project.
- Run code with `run_in_console`, then call `console_output` to read what it printed; call `console_output` again while it says the code is still running.
- Never run R yourself through `Rscript`, `R` or the shell. If the `rstudio` tools are not connected, say so and ask the student to rerun Addins > Course setup.

## How the repository runs

- `run.R` runs everything from a fresh clone: it downloads the data, sources the scripts in order, and ends with `R/99-checks.R`. Keep it that way; a new script gets a line in `run.R` before the checks.
- Paths are relative to the repository root. No `setwd()`, no absolute paths.
- Commit small steps with clear messages, and push when a piece works. The repository is private and belongs to the course organization.
- The minisite is built into `docs/` and only `docs/` is published, publicly, by GitHub Pages. With Quarto, set `output-dir: docs`. Nothing in `docs/` may include data, keys or anything the student has not chosen to publish.
