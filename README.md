# Statistical Analysis: Ping Pong Precision Model

<div align="center">

![R](https://img.shields.io/badge/R-Statistical_Modeling-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Pipeline](https://img.shields.io/badge/Pipeline-Reproducible-success?style=for-the-badge)
![Data](https://img.shields.io/badge/Data-309_Observations-blueviolet?style=for-the-badge)
![Dashboard](https://img.shields.io/badge/Dashboard-Web_Report-0A66C2?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

<br>

<a href="https://sam-24-dev.github.io/Analisis-Ping-Pong/">
  <img src="https://img.shields.io/badge/Live_Demo-View_Dashboard-0078D4?style=for-the-badge&logo=github&logoColor=white" alt="Live Demo" />
</a>

</div>

---

## Project Overview

This repository contains a statistical analysis case study that evaluates ping pong serve precision through a reproducible R pipeline and a lightweight web dashboard. The goal is to move from raw experimental observations to validated statistical outputs, exported artifacts, and a browser-based summary that makes the results easier to review.

The public version focuses on:
- reproducible statistical processing in R
- exported JSON and PNG outputs for dashboard delivery
- inferential tests that validate model fit and timing behavior
- a clear analytical summary for technical and non-technical review

---

## Challenge / Solution / Impact

| Challenge | Solution | Impact |
|---|---|---|
| Validate whether serve attempts fit a defendable statistical model | Built an R pipeline with descriptive and inferential analysis, including goodness-of-fit testing | The Negative Binomial fit was accepted with `p = 0.6603` |
| Manual analysis made results harder to reproduce and communicate | Automated JSON and PNG exports from the analysis script | The dashboard can load consistent outputs without rewriting results by hand |
| Static notebooks and raw tables were harder to scan quickly | Delivered a lightweight dashboard that presents charts and key metrics in one place | Statistical findings became easier to review and share |

---

## Key Metrics

| Metric | Value | Interpretation |
|---|---:|---|
| Sample size | 309 observations | Experimental dataset used for the full analysis |
| Chi-square p-value | 0.6603 | Goodness-of-fit accepted for the selected model |
| Mean serve time | 1.945s | Average time stayed below the 2-second threshold |
| Right-handed share | 64.4% | Population split is documented in the exported results |
| Correlation | 0.0494 | Weak relationship between attempts and serve time |

---

## Pipeline Architecture

```text
Raw CSV data
     ->
R analysis script (scripts/ping_pong_analysis.R)
     ->
JSON metrics + PNG charts
     ->
Web dashboard summary
```

| Layer | Technologies | Output |
|---|---|---|
| Data input | CSV experiment data | Raw observations |
| Analysis | R, tidyverse, ggplot2, jsonlite | Statistical results and visualizations |
| Delivery | HTML, CSS, JavaScript | Interactive dashboard that reads exported outputs |

---

## Methodology Snapshot

The analysis workflow includes:
- descriptive statistics for serve time and attempts
- chi-square goodness-of-fit validation
- one-sample t-test against the 2-second threshold
- correlation analysis between attempts and serve time
- exported charts and JSON summaries for dashboard delivery

---

## Tech Stack

| Layer | Technologies |
|---|---|
| Data processing | R, tidyverse, ggplot2, jsonlite |
| Visualization | ggplot2, ggsave |
| Frontend | HTML5, CSS3, JavaScript |
| Hosting | GitHub Pages |

---

## Quick Start

```bash
# clone repository
git clone https://github.com/Sam-24-dev/Analisis-Ping-Pong.git
cd Analisis-Ping-Pong

# install required R packages
R -e "install.packages(c('tidyverse','jsonlite','here'))"

# run the analysis pipeline
Rscript scripts/ping_pong_analysis.R

# or use the existing Makefile
make pipeline
make serve
```

---

## Project Structure

```text
Analisis-Ping-Pong/
|- data/
|  |- raw/                         # Original experiment files
|  `- ping_pong_experiment_data.csv
|- docs/                           # Technical architecture notes
|- scripts/                        # R analysis pipeline
|- web/
|  |- images/                      # Exported PNG charts
|  |- results/                     # JSON statistical outputs
|  |- index.html                   # Dashboard entrypoint
|  |- script.js
|  `- styles.css
|- Makefile
|- LICENSE
`- README.md
```

---

## Documentation

- Technical architecture: [docs/architecture.md](./docs/architecture.md)
- Main analysis script: [scripts/ping_pong_analysis.R](./scripts/ping_pong_analysis.R)
- Exported results: [web/results/analysis_results.json](./web/results/analysis_results.json)

---


<div align="center">

### Author

**Samir Caizapasto**  
*Junior Data Engineer & Analyst*

[![Visit portfolio website](https://img.shields.io/badge/Portfolio-Visit_Website-success?style=for-the-badge&logo=vercel&logoColor=white)](https://portafolio-samir-tau.vercel.app/)
[![Connect on LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/samir-caizapasto/)
[![Contact by email](https://img.shields.io/badge/Email-Contact-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:samir.leonardo.caizapasto04@gmail.com)

</div>

---

If this analysis was useful or interesting, consider starring the repository.
