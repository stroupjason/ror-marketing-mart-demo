# Push to GitHub

From the repo root:

```bash
git init
git add .
git commit -m "Add dbt-style ROR marketing mart demo"
git branch -M main
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## Suggested repo name

`ror-marketing-mart-demo`

## Suggested GitHub description

Small dbt-style marketing mart demo using DuckDB with layered SQL transformations, dimensional modeling, tests, and KPI-ready output.
