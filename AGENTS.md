# Instructions for AI agents in this repository

This is a student repository for PPOL 6818, Experimental Research Design and Implementation (Georgetown McCourt School, spring 2027). The course agent, Codex or Claude Code, reads this file. Follow it over your defaults.

## What you may and may not write

The course AI policy (syllabus, "AI Policy") governs this repository.

- **Write code freely.** Data work, tables, figures, simulations, power calculations, the KoboToolbox form (XLSForm) and the minisite build should be AI-assisted. Prefer R; use the packages already installed before adding new ones.
- **Never write prose the student submits.** Do not draft, rewrite, edit, polish, translate or summarize text for the landing page, memo, pre-analysis plan, slide text, registered report or final paper, and do not generate images. If asked, decline in one sentence, cite the course AI policy, and offer to help with the code or data instead. Code comments, commit messages and README notes about how to run the code are fine.
- You may explain concepts, methods, errors and what code does, so the student can explain the key research processes in their own words.

## The registered report and the final paper

The pair writes two papers: the registered report in `midterm/midterm.qmd` and the final paper in `final/final.qmd`. Each renders to a PDF (`format: paper-typst`, from `_extensions/paper/`), and the minisite shows it.

- In `midterm/` and `final/` you may write the run file (`run.R`) and the exhibits it saves in that folder's `exhibits/`.
- You may change the layout of the two papers: place an exhibit, format a table, fix a cross-reference or a citation.
- Never write or reword a sentence in `midterm.qmd` or `final.qmd`, and never write in the comments that hold the instructions. This includes captions and table notes: the student writes them.
- Keep `format: paper-typst` in each paper's front matter. Do not edit `_extensions/` or the pages that show the PDFs (`midterm/index.qmd`, `final/index.qmd`).

## Show that the code did what was intended

The student must be able to give evidence that AI-written code works. For every analysis step you write:

- Print the intermediate results that show it worked: row counts before and after each filter or merge, the number of unique units, ranges and missing values of key variables, and a small sample of rows.
- Add `stopifnot()` checks for what must be true (for example, one row per person, weights positive, no unexpected missing values).
- When reproducing a published number, print both side by side.
- Run the code before saying it is done, and report what it printed.

## Thinking it through with the student

The course divides the work three ways: you produce the code; the student verifies it and judges it. Make that thinking easy, and do not do it for them.

- **Their view first.** When the student asks what design choice to make (comparison group, timing, controls, clustering, outcomes, effect sizes, which survey flags are real problems), ask what they would choose and why before you answer. Then give the main alternatives with their tradeoffs, say which you would pick and why, and say so plainly when you disagree with them.
- **Evidence, not assurance.** When the student asks whether a result is right, show them something they can judge: a published number beside yours, a hand calculation on a few rows, a simulation where the true value is known.
- **No quiet changes.** Never change a sample restriction, an assumption or a tolerance to make a result look right without saying what you changed and why.

## Data

- IPUMS data never goes into git or the minisite: everything under `data/` is ignored, and only aggregates go in `exhibits/`. Get every extract in `run.R` with `ppol6818::ipums_get(name, samples, variables)`, never with `ipumsr::download_extract` directly: it reuses a saved or already-made extract, stores it as Parquet in `data/ipums/`, and reports its size. Keep extracts small: restrict people with `ipumsr::var_spec(..., case_selections = ...)` and ask only for the variables the analysis uses. Read with `ppol6818::ipums_read(name, columns, where)`, which filters before loading, and get value labels with `ppol6818::ipums_labels(name, var)`. The key is `IPUMS_API_KEY` (in a codespace, the course's own key, an organization secret). Never print or commit it. Example: `inst/examples/ipums-extract.R` in the ppol6818 package.
- KoboToolbox forms and submissions: use the `kobo_*` functions in the `ppol6818` package through the R console tool; run `kobo_help()` first for the list and the deploy, translate and data workflows. The student's own account holds the forms.

## Running R

Run every piece of R code in the student's R console, the R terminal in VS Code, through the `r-console` tools, so the student sees it run: the code and its output appear in the console, and the objects it makes stay in the session. Figures are saved to files (`ggsave()` into `exhibits/`), which the student opens by clicking them in the file list.

- Run code with `run_in_console`; it returns what the code printed, with any messages, warnings and errors. Give it `folder`, this repository's full path (`/workspaces/<repository>`): the console may sit in the student's lab repository.
- If it says no console is connected, follow what it says (`list_r_sessions`, then `select_r_session`).
- Never run R yourself through `Rscript`, `R` or the shell. If the `r-console` tools are missing, say so and ask the student to click Course setup in the PPOL 6818 panel.

## How the repository runs

- `run.R` runs everything from a fresh clone: it downloads the data and sources the scripts in order. Keep it that way; a new script gets a line in `run.R`.
- Paths are relative to the repository root. No `setwd()`, no absolute paths.
- Commit small steps with clear messages, and push when a piece works. The repository is private and belongs to the course organization.
- The minisite is a Quarto website at the repository root: `_quarto.yml`, the landing page `index.qmd`, the deck `deck.qmd` (a PDF through Typst, format `deck-typst`, shown on `deck/index.qmd`), and a page for each paper that shows its PDF. It is built into `docs/` with `ppol6818::build_site()` in the R console (Build minisite in the PPOL 6818 panel), and only `docs/` is published, publicly, by GitHub Pages. The build first pulls the partner's pushed work, then stops if an exhibit a page or paper shows is missing. Keep `execute: enabled: false`: no code runs during the build, so the papers hold no R code chunks.
- `midterm/run.R` and `final/run.R` make each paper's exhibits into `midterm/exhibits/` and `final/exhibits/`, and the root `run.R` runs both. A paper shows a figure as `![Caption.](exhibits/figure1.png){#fig-name}` and a table, saved as Markdown with `knitr::kable()`, inside a `::: {#tbl-name}` block with `{{< include exhibits/table1.md >}}` and its caption.
- Exhibits reach the landing page and deck through `exhibits/`: scripts sourced by `run.R` write each figure there (`ggsave("exhibits/week02.png", ...)`), and the pages embed those files. The deck is a PDF, so its exhibits are images (`.png`), never web pages. Nothing in an `exhibits/` folder or in `docs/` may include microdata, rows of data, keys or anything the student has not chosen to publish: only aggregate tables and figures.
- Never write the text of `index.qmd` or `deck.qmd` (the prose rule above). You may add the structure the student asks for: a new slide's heading and its `layout="[50,50]"` block with the image (the pattern in `deck.qmd`), a figure's embed code.
