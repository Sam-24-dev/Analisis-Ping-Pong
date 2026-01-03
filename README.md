# 🏓 Statistical Analysis: Ping Pong Precision Model

<div align="center">

  ![R](https://img.shields.io/badge/Language-R_Programming-276DC3?style=for-the-badge&logo=r&logoColor=white)
  ![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
  ![Data](https://img.shields.io/badge/Data-309_Observations-blueviolet?style=for-the-badge)

  <br>

  <a href="https://sam-24-dev.github.io/Analisis-Ping-Pong/">
    <img src="https://img.shields.io/badge/📄_Read_Full_Report-View_Analysis-0078D4?style=for-the-badge&logo=readthedocs&logoColor=white" />
  </a>
  &nbsp;
  <a href="https://github.com/Sam-24-dev/Analisis-Ping-Pong">
    <img src="https://img.shields.io/badge/GitHub-View_Code-181717?style=for-the-badge&logo=github&logoColor=white" />
  </a>

</div>

---

## 📋 Project Overview

This project is a rigorous experimental study designed to **model and predict the precision of ping pong serves** under controlled conditions. 

Using a dataset of **309 observations**, I implemented a comprehensive statistical workflow—from descriptive analysis to inferential validation—to determine if human performance follows a **Negative Binomial Distribution** ($k=3$, $p=0.3$).

> **Core Value:** This project demonstrates the application of **Inferential Statistics** to validate theoretical models against real-world data, a critical skill in Data Analytics and A/B Testing.

---

## 🔬 Statistical Methodology

To ensure scientific validity, the analysis followed a structured pipeline:

1.  **Experimental Design:** Controlled data collection with categorical (Handedness, Serve Height) and quantitative variables (Attempts, Time).
2.  **Model Selection:** Proposed a **Negative Binomial Model** to analyze the number of failures before achieving 3 successes ($k=3$).
3.  **Hypothesis Testing:** Used **Chi-Square Goodness of Fit** tests to validate the model.
4.  **Correlation Analysis:** Evaluated the relationship between fatigue (number of attempts) and efficiency (time).

---

## 📈 Key Findings & Insights

| Metric | Result | Interpretation (Data Analysis) |
| :--- | :--- | :--- |
| **Model Fit (P-Value)** | **0.6603** ✅ | The data **successfully fits** the Negative Binomial model. There is no significant difference between observed and theoretical values. |
| **Avg. Serve Time** | **1.945s** | Significantly faster than the theoretical benchmark of 2.0s (Validated via T-Test). |
| **Correlation ($r$)** | **0.65** 📈 | Moderate **positive correlation**: As the number of attempts increases, serve time increases (Fatigue factor). |
| **Demographics** | **64.4%** | Proportion of right-handed players, consistent with the general population parameter. |

---

## 📊 Visualizations & Analysis

The study includes interactive visualizations generated with **RMarkdown**:
* **Distribution Analysis:** Histograms overlaying the Negative Binomial curve.
* **Bivariate Analysis:** Scatter plots with regression lines identifying the time-attempt correlation.
* **Categorical Segmentation:** Boxplots analyzing performance differences by Handedness and Serve Height.
* **Contingency Tables:** Chi-square tests for independence between categorical variables.

---

## 🛠️ Tech Stack

This project was built using the **R Ecosystem** for reproducible research:

* **Language:** ![R](https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white)
* **Reporting:** ![RMarkdown](https://img.shields.io/badge/RMarkdown-75AADB?style=flat-square&logo=r&logoColor=black)
* **Libraries:** `ggplot2` (Visualization), `dplyr` (Data Manipulation), `stats` (Hypothesis Testing).
* **Web Format:** HTML5, CSS3, JavaScript (for report rendering).

---

## 🚀 How to Run

To replicate this analysis:

1.  Clone the repository:
    ```bash
    git clone [https://github.com/Sam-24-dev/Analisis-Ping-Pong.git](https://github.com/Sam-24-dev/Analisis-Ping-Pong.git)
    ```
2.  Open `Analisis_Ping_Pong.Rmd` in **RStudio**.
3.  Install dependencies:
    ```r
    install.packages(c("ggplot2", "dplyr", "knitr"))
    ```
4.  Click **"Knit"** to generate the HTML report.

---

<div align="center">

### 👤 Author
**Samir Caizapasto**
*Data Engineer & Analyst in Training*

[![](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/samircaizapasto/)

</div>

⭐ If you find this analysis useful, please give the repository a star.
