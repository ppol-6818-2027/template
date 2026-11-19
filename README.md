# PPOL 6818 project repository

Open `project.Rproj` in RStudio. Click **Addins > Course agent** to work with the course AI agent (Codex or Claude Code).

- `run.R` runs everything from a fresh clone, including downloading your IPUMS data with your own key.
- `data/` holds downloaded data and is never committed: the IPUMS terms do not allow sharing it.
- `index.qmd` is your landing page and `deck.qmd` your slide deck, built as a PDF: one slide a week. You write every sentence in them.
- `exhibits/` holds the figures and tables `run.R` makes for them. Only aggregates go here, never data.
- `midterm/` holds your registered report, `midterm.qmd`, and `final/` your final paper, `final.qmd`. You write every sentence in them. Each folder's `run.R` makes that paper's exhibits into its `exhibits/` folder; the root `run.R` runs both. Each paper becomes a PDF in the paper format in `_extensions/`, which you do not edit.
- `docs/` holds the built minisite: your landing page, your deck, and a page for each paper that shows its PDF. To build it, run `ppol6818::build_site()` in the R terminal (in RStudio, **Addins > Build minisite**). It first brings in your partner's latest pushed work, and stops if an exhibit is missing. Then commit and push `docs/`. It is the only public part of this repository, at `https://ppol-6818-2027.github.io/<repository name>/`.
- `AGENTS.md` tells the AI agent the course rules. Every sentence you submit is your own; the agent writes code, not prose. In the two papers it may also place exhibits, format tables and fix references, but never write a sentence.
