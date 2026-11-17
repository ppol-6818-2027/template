# PPOL 6818 project repository

Open `project.Rproj` in RStudio. Click **Addins > Course agent** to work with the course AI agent (Codex or Claude Code).

- `run.R` runs everything from a fresh clone, including downloading your IPUMS data with your own key.
- `data/` holds downloaded data and is never committed: the IPUMS terms do not allow sharing it.
- `index.qmd` is your landing page and `deck.qmd` your slide deck: one slide a week. You write every sentence in them.
- `exhibits/` holds the figures and tables `run.R` makes for them. Only aggregates go here, never data.
- `docs/` holds the built minisite. Build it with **Addins > Build minisite**, then commit and push `docs/`. It is the only public part of this repository, at `https://ppol-6818-2027.github.io/<repository name>/`.
- `AGENTS.md` tells the AI agent the course rules. Every sentence you submit is your own; the agent writes code, not prose.
