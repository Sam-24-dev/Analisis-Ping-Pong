# Statistical Analysis: Ping Pong Precision Model

<div align="center">

![R](https://img.shields.io/badge/Language-R_Programming-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![Data](https://img.shields.io/badge/Data-309_Observations-blueviolet?style=for-the-badge)
![Pipeline](https://img.shields.io/badge/Pipeline-Automated-orange?style=for-the-badge)

<br>

<a href="https://sam-24-dev.github.io/Analisis-Ping-Pong/">
  <img src="https://img.shields.io/badge/View_Full_Report-Analysis_Dashboard-0078D4?style=for-the-badge&logo=readthedocs&logoColor=white" />
</a>

</div>

---

## Project Overview

A rigorous experimental study designed to **model and predict the precision of ping pong serves** under controlled conditions.

| Challenge | Solution | Impact |
|-----------|----------|--------|
| Validate statistical model | Chi-Square Goodness of Fit | P-value 0.6603 confirms fit |
| Measure human performance | 309 controlled observations | Negative Binomial validated |
| Analyze fatigue effect | Correlation analysis | r=0.65 moderate correlation |

> **Core Value:** This project demonstrates the application of **Inferential Statistics** to validate theoretical models against real-world data, a critical skill in Data Analytics and A/B Testing.

---

## Pipeline Architecture

This project implements an **automated data pipeline** where R generates statistical outputs for the web frontend:

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│    CSV      │────▶│   R Script  │────▶│ JSON + PNG  │────▶│    Web      │
│    Data     │     │   Analysis  │     │   Output    │     │  Dashboard  │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
  309 obs.       ping_pong_analysis.R   results/ + images/    index.html
```

| Component | Output |
|-----------|--------|
| R Script | Processes 309 observations, runs statistical tests |
| JSON Export | [web/results/analysis_results.json](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/results/analysis_results.json) |
| PNG Charts | 4 visualizations in `web/images/` |
| Web Frontend | Loads data dynamically via JavaScript |

---

## Statistical Methodology

To ensure scientific validity, the analysis followed a structured pipeline:

1. **Experimental Design:** Controlled data collection with categorical (Handedness, Serve Height) and quantitative variables (Attempts, Time).
2. **Model Selection:** Proposed a **Negative Binomial Model** to analyze failures before 3 successes ($k=3$, $p=0.3$).
3. **Hypothesis Testing:** Used **Chi-Square Goodness of Fit** tests to validate the model.
4. **Correlation Analysis:** Evaluated relationship between fatigue (attempts) and efficiency (time).

---

## Key Findings & Results

| Metric | Result | Interpretation |
|--------|--------|----------------|
| **Model Fit (P-Value)** | **0.6603** | Data **successfully fits** Negative Binomial model |
| **Avg. Serve Time** | **1.945s** | Faster than theoretical benchmark of 2.0s |
| **Correlation (r)** | **0.65** | Moderate **positive correlation**: fatigue effect |
| **Demographics** | **64.4%** | Right-handed proportion, consistent with population |

---

## Visualizations

The R pipeline generates 4 professional charts automatically:

| Chart | Description |
|-------|-------------|
| [attempts_distribution.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/attempts_distribution.png) | Histogram with mean line |
| [time_distribution.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/time_distribution.png) | Serve time distribution |
| [correlation_scatter.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/correlation_scatter.png) | Attempts vs Time with regression |
| [boxplot_handedness.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/boxplot_handedness.png) | Time by dominant hand |

---

## Tech Stack

| Layer | Technologies |
|-------|--------------|
| **Data Analysis** | R, tidyverse, ggplot2 |
| **Data Export** | jsonlite (JSON), ggsave (PNG) |
| **Frontend** | HTML5, CSS3, JavaScript |
| **Deployment** | GitHub Pages |

---

## How to Run

### Prerequisites
```r
install.packages(c("tidyverse", "jsonlite", "here"))
```

### Execute Pipeline
```bash
cd scripts
Rscript ping_pong_analysis.R
```

### Outputs Generated
- [web/results/analysis_results.json](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/results/analysis_results.json)
- [web/images/attempts_distribution.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/attempts_distribution.png)
- [web/images/time_distribution.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/time_distribution.png)
- [web/images/correlation_scatter.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/correlation_scatter.png)
- [web/images/boxplot_handedness.png](file:///c:/Users/USER/Documents/GitHub/Analisis-Cultivo-Arroz/Analisis-Ping-Pong/web/images/boxplot_handedness.png)

---

## Project Structure

```
Analisis-Ping-Pong/
├── data/
│   └── ping_pong_experiment_data.csv
├── scripts/
│   └── ping_pong_analysis.R
└── web/
    ├── index.html
    ├── styles.css
    ├── script.js
    ├── results/
    │   └── analysis_results.json    [Generated by R]
    └── images/
        └── *.png                     [Generated by R]
```

---

<div align="center">

### Author

**Samir Caizapasto**  
*Junior Data Engineer & Analyst*

[![](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/samircaizapasto/)
[![](https://img.shields.io/badge/Portfolio-Visit-00d4ff?style=for-the-badge&logo=vercel)](https://portafolio-samir-tau.vercel.app/)
[![](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github)](https://github.com/Sam-24-dev)

</div>

---

<div align="center">

⭐ If you find this analysis useful, please give the repository a star.

</div>

