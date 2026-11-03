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

## Data

- IPUMS data never goes into git: the IPUMS terms forbid redistributing it. Everything under `data/` is ignored. Download extracts in `run.R` with `ipumsr`, which reads the student's key from `IPUMS_API_KEY` in `~/.Renviron` (course setup saved it). Never print or commit the key.
- KoboToolbox forms and submissions: use the `kobo` tools connected to this agent (list, get, deploy and export forms; get submissions). The student's own account holds the forms.

## How the repository runs

- `run.R` runs everything from a fresh clone: it downloads the data, then sources the scripts in order. Keep it that way; a new script gets a line in `run.R`.
- Paths are relative to the repository root. No `setwd()`, no absolute paths.
- Commit small steps with clear messages, and push when a piece works. The repository is public and belongs to the course organization.
