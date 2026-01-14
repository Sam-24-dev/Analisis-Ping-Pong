# Architecture Documentation

## System Overview

This project implements an **automated data pipeline** for statistical analysis of ping pong serve precision, with results displayed in an interactive web dashboard.

## Pipeline Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│    Raw Data     │────▶│   R Pipeline    │────▶│  Web Dashboard  │
│   (CSV File)    │     │   (Analysis)    │     │  (JavaScript)   │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Outputs:         │
                    │  • JSON (stats)     │
                    │  • PNG (charts)     │
                    └─────────────────────┘
```

## Data Flow

| Stage | Input | Process | Output |
|-------|-------|---------|--------|
| Extract | `data/raw/*.csv` | Load CSV with readr | tibble |
| Transform | tibble | Clean, calculate stats | Processed data |
| Load | Processed data | Export results | JSON + PNG files |
| Display | JSON + PNG | JavaScript fetch | Interactive dashboard |

## Components

### R Script (`scripts/ping_pong_analysis.R`)
- Loads and cleans experimental data
- Performs descriptive statistics
- Runs inferential tests (Chi-square, t-test, correlation)
- Generates visualizations (ggplot2)
- Exports results to JSON and PNG

### Web Dashboard (`web/`)
- Static HTML/CSS/JavaScript
- Dynamically loads data from `results/analysis_results.json`
- Displays R-generated PNG charts
- Responsive design for desktop and mobile

## Technology Stack

| Layer | Technology |
|-------|------------|
| Data Processing | R, tidyverse, ggplot2 |
| Data Export | jsonlite, ggsave |
| Frontend | HTML5, CSS3, JavaScript |
| Hosting | GitHub Pages |

## Execution

```bash
# Run the full pipeline
make pipeline

# Or manually
Rscript scripts/ping_pong_analysis.R
```

## Output Files

| File | Description |
|------|-------------|
| `web/results/analysis_results.json` | Statistical results |
| `web/images/attempts_distribution.png` | Histogram of attempts |
| `web/images/time_distribution.png` | Serve time histogram |
| `web/images/correlation_scatter.png` | Attempts vs Time |
| `web/images/boxplot_handedness.png` | Time by handedness |
