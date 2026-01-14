# Statistical Analysis: Ping Pong Precision Model

<div align="center">

![R](https://img.shields.io/badge/R-Analysis-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Pipeline](https://img.shields.io/badge/Pipeline-Automated-success?style=for-the-badge)
![Data](https://img.shields.io/badge/Data-309_Observations-blueviolet?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

<br>

<a href="https://sam-24-dev.github.io/Analisis-Ping-Pong/">
  <img src="https://img.shields.io/badge/Live_Demo-View_Dashboard-0078D4?style=for-the-badge&logo=github&logoColor=white" />
</a>

</div>

---

## Project Overview

| Challenge | Solution | Impact |
|-----------|----------|--------|
| Validate if serve precision follows a statistical model | Implemented Negative Binomial Distribution (k=3, p=0.3) | Model validated with p=0.660 |
| Manual analysis workflow | Automated R pipeline exporting JSON + PNG | Reproducible results |
| Static reports | Interactive web dashboard | Dynamic data visualization |

---

## Pipeline Architecture

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   Raw Data   │────▶│  R Pipeline  │────▶│  Dashboard   │
│   (CSV)      │     │  (tidyverse) │     │  (JS + HTML) │
└──────────────┘     └──────────────┘     └──────────────┘
                            │
                            ▼
                   JSON + PNG Charts
```

| Component | Description |
|-----------|-------------|
| `scripts/ping_pong_analysis.R` | Data processing and statistical analysis |
| `web/results/analysis_results.json` | Exported statistical results |
| `web/images/*.png` | Generated visualizations |
| `web/index.html` | Interactive dashboard |

---

## Key Metrics & Results

| Metric | Value | Interpretation |
|--------|-------|----------------|
| Chi-Square p-value | 0.660 | Model validated |
| Mean Serve Time | 1.945s | Below 2s threshold |
| Correlation (r) | 0.65 | Moderate positive |
| Right-handed % | 64.4% | Population consistent |

---

## Tech Stack

| Layer | Technologies |
|-------|--------------|
| Data Processing | R, tidyverse, ggplot2, jsonlite |
| Visualization | ggplot2, ggsave |
| Frontend | HTML5, CSS3, JavaScript |
| Hosting | GitHub Pages |

---

## Quick Start

```bash
# Clone repository
git clone https://github.com/Sam-24-dev/Analisis-Ping-Pong.git
cd Analisis-Ping-Pong

# Run pipeline (requires R + packages)
make pipeline

# Start local server
make serve
```

### Prerequisites
```r
install.packages(c("tidyverse", "jsonlite", "here"))
```

---

## Project Structure

```
Analisis-Ping-Pong/
├── data/
│   └── raw/                          # Original experimental data
├── scripts/
│   └── ping_pong_analysis.R          # R analysis pipeline
├── web/
│   ├── index.html                    # Dashboard
│   ├── styles.css                    # Styling
│   ├── script.js                     # Dynamic loading
│   ├── results/                      # JSON output
│   └── images/                       # PNG charts
├── docs/
│   └── architecture.md               # Technical documentation
├── Makefile                          # Automation
├── LICENSE                           # MIT License
└── README.md
```

---

<div align="center">

### Author

**Samir Caizapasto**  
*Junior Data Engineer & Analyst*

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/samir-caizapasto/)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-00d4ff?style=for-the-badge&logo=vercel)](https://portafolio-samir-tau.vercel.app/)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/Sam-24-dev)

</div>

---

<div align="center">

If you find this analysis useful, please give the repository a star.

</div>
