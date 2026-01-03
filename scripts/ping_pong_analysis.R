# Ping Pong Precision Analysis Pipeline
# Author: Samir Caizapasto
# Institution: ESPOL

library(tidyverse)
library(jsonlite)
library(here)

setwd(here::here())

# Load data
ping_pong <- read_csv(
  here("data", "ping_pong_experiment_data.csv"),
  locale = locale(decimal_mark = ","),
  col_types = cols(.default = col_character())
)

# Clean column names and rename to English
names(ping_pong) <- trimws(names(ping_pong))

ping_pong <- ping_pong %>%
  select(-1) %>%
  rename(
    observation_id = Datos,
    attempt_count = `X(intentos totales)`,
    handedness = `Mano dominante`,
    serve_height = `Altura del saque`,
    serve_time = `Tiempo del saque`
  )

# Clean and convert data types
ping_pong <- ping_pong %>%
  mutate(
    observation_id = as.integer(observation_id),
    attempt_count = as.integer(attempt_count),
    handedness = str_trim(handedness),
    handedness = case_when(
      str_detect(handedness, "Derecha") ~ "Right Hand",
      str_detect(handedness, "Izquierda") ~ "Left Hand",
      TRUE ~ handedness
    ),
    serve_height = str_trim(serve_height),
    serve_height = case_when(
      str_detect(serve_height, "Abajo") ~ "Below Waist",
      str_detect(serve_height, "Arriba de la Cintura") ~ "Above Waist",
      str_detect(serve_height, "Arriba de los Hombros") ~ "Above Shoulders",
      TRUE ~ serve_height
    ),
    serve_time = str_replace(serve_time, ",", "."),
    serve_time = as.numeric(serve_time)
  ) %>%
  drop_na()

cat("Data loaded:", nrow(ping_pong), "observations\n")

# Descriptive statistics
handedness_freq <- ping_pong %>%
  count(handedness) %>%
  mutate(proportion = n / sum(n))

serve_height_freq <- ping_pong %>%
  count(serve_height) %>%
  mutate(proportion = n / sum(n))

serve_time_stats <- ping_pong %>%
  summarise(
    mean = mean(serve_time, na.rm = TRUE),
    sd = sd(serve_time, na.rm = TRUE),
    median = median(serve_time, na.rm = TRUE),
    min = min(serve_time, na.rm = TRUE),
    max = max(serve_time, na.rm = TRUE),
    q1 = quantile(serve_time, 0.25, na.rm = TRUE),
    q3 = quantile(serve_time, 0.75, na.rm = TRUE)
  )

attempt_stats <- ping_pong %>%
  summarise(
    mean = mean(attempt_count, na.rm = TRUE),
    sd = sd(attempt_count, na.rm = TRUE),
    median = median(attempt_count, na.rm = TRUE),
    min = min(attempt_count, na.rm = TRUE),
    max = max(attempt_count, na.rm = TRUE),
    q1 = quantile(attempt_count, 0.25, na.rm = TRUE),
    q3 = quantile(attempt_count, 0.75, na.rm = TRUE)
  )

# Inferential statistics

# Chi-Square Goodness of Fit (Negative Binomial)
k <- 3
p <- 0.3

observed_freq <- table(ping_pong$attempt_count)
x_values <- as.numeric(names(observed_freq))
theoretical_prob <- dnbinom(x_values - k, size = k, prob = p)
theoretical_prob <- theoretical_prob / sum(theoretical_prob)

observed_grouped <- c(sum(observed_freq[1:15]), sum(observed_freq[16:length(observed_freq)]))
prob_grouped <- c(sum(theoretical_prob[1:15]), sum(theoretical_prob[16:length(theoretical_prob)]))

chi_sq_test <- chisq.test(observed_grouped, p = prob_grouped)

# T-Test: Mean serve time vs 2 seconds
t_test_result <- t.test(ping_pong$serve_time, mu = 2, alternative = "less")

# Correlation: Attempts vs Serve Time
correlation <- cor(ping_pong$attempt_count, ping_pong$serve_time, use = "complete.obs")
cor_test <- cor.test(ping_pong$attempt_count, ping_pong$serve_time)

# Proportion Test: Right-handed vs 0.6
right_handed_count <- sum(ping_pong$handedness == "Right Hand")
total_count <- nrow(ping_pong)
prop_test <- prop.test(right_handed_count, total_count, p = 0.6, alternative = "two.sided")

# Create output directories
dir.create(here("web", "images"), showWarnings = FALSE, recursive = TRUE)
dir.create(here("web", "results"), showWarnings = FALSE, recursive = TRUE)

# Plot theme
theme_analysis <- theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 10, color = "gray50"),
    axis.title = element_text(size = 11),
    axis.text = element_text(size = 10),
    legend.position = "bottom"
  )

# Plot 1: Attempts Distribution
plot_attempts <- ggplot(ping_pong, aes(x = attempt_count)) +
  geom_histogram(binwidth = 2, fill = "#3b82f6", color = "white", alpha = 0.8) +
  geom_vline(xintercept = mean(ping_pong$attempt_count), 
             color = "#ef4444", linetype = "dashed", size = 1) +
  labs(
    title = "Distribution of Attempts Until Success",
    subtitle = paste("Mean =", round(mean(ping_pong$attempt_count), 2), "attempts"),
    x = "Number of Attempts",
    y = "Frequency"
  ) +
  theme_analysis

ggsave(here("web", "images", "attempts_distribution.png"), plot_attempts, width = 10, height = 6, dpi = 150)

# Plot 2: Serve Time Distribution
plot_time <- ggplot(ping_pong, aes(x = serve_time)) +
  geom_histogram(binwidth = 0.1, fill = "#10b981", color = "white", alpha = 0.8) +
  geom_vline(xintercept = mean(ping_pong$serve_time), 
             color = "#ef4444", linetype = "dashed", size = 1) +
  labs(
    title = "Distribution of Serve Time",
    subtitle = paste("Mean =", round(mean(ping_pong$serve_time), 3), "seconds"),
    x = "Serve Time (seconds)",
    y = "Frequency"
  ) +
  theme_analysis

ggsave(here("web", "images", "time_distribution.png"), plot_time, width = 10, height = 6, dpi = 150)

# Plot 3: Correlation Scatter Plot
plot_correlation <- ggplot(ping_pong, aes(x = attempt_count, y = serve_time)) +
  geom_point(color = "#6366f1", alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", se = TRUE, color = "#ef4444", size = 1) +
  labs(
    title = "Correlation: Attempts vs Serve Time",
    subtitle = paste("Pearson r =", round(correlation, 3)),
    x = "Number of Attempts",
    y = "Serve Time (seconds)"
  ) +
  theme_analysis

ggsave(here("web", "images", "correlation_scatter.png"), plot_correlation, width = 12, height = 6, dpi = 150)

# Plot 4: Boxplot by Handedness
plot_boxplot <- ggplot(ping_pong, aes(x = handedness, y = serve_time, fill = handedness)) +
  geom_boxplot(alpha = 0.7, outlier.color = "#ef4444", outlier.shape = 8) +
  scale_fill_manual(values = c("Left Hand" = "#f59e0b", "Right Hand" = "#3b82f6")) +
  labs(
    title = "Serve Time by Handedness",
    x = "Dominant Hand",
    y = "Serve Time (seconds)"
  ) +
  theme_analysis +
  theme(legend.position = "none")

ggsave(here("web", "images", "boxplot_handedness.png"), plot_boxplot, width = 10, height = 6, dpi = 150)

# Export results to JSON
analysis_results <- list(
  metadata = list(
    last_updated = format(Sys.Date(), "%Y-%m-%d"),
    sample_size = nrow(ping_pong),
    data_source = "ESPOL Ping Pong Experiment"
  ),
  descriptive = list(
    serve_time = list(
      mean = round(serve_time_stats$mean, 3),
      sd = round(serve_time_stats$sd, 3),
      median = round(serve_time_stats$median, 3),
      min = round(serve_time_stats$min, 3),
      max = round(serve_time_stats$max, 3)
    ),
    attempts = list(
      mean = round(attempt_stats$mean, 2),
      sd = round(attempt_stats$sd, 2),
      median = attempt_stats$median,
      min = attempt_stats$min,
      max = attempt_stats$max
    )
  ),
  inferential = list(
    chi_square = list(
      statistic = round(chi_sq_test$statistic[[1]], 4),
      p_value = round(chi_sq_test$p.value, 4),
      conclusion = ifelse(chi_sq_test$p.value > 0.05, "Data fits Negative Binomial model", "Data does not fit model")
    ),
    t_test = list(
      statistic = round(t_test_result$statistic[[1]], 4),
      p_value = round(t_test_result$p.value, 4),
      conclusion = ifelse(t_test_result$p.value < 0.05, "Mean significantly less than 2s", "Mean not significantly different from 2s")
    ),
    correlation = list(
      r = round(correlation, 4),
      p_value = round(cor_test$p.value, 6),
      interpretation = case_when(
        abs(correlation) > 0.7 ~ "Strong",
        abs(correlation) > 0.4 ~ "Moderate",
        TRUE ~ "Weak"
      )
    )
  ),
  categorical = list(
    handedness = list(
      right_handed = list(
        count = sum(handedness_freq$n[handedness_freq$handedness == "Right Hand"]),
        proportion = round(handedness_freq$proportion[handedness_freq$handedness == "Right Hand"], 4)
      ),
      left_handed = list(
        count = sum(handedness_freq$n[handedness_freq$handedness == "Left Hand"]),
        proportion = round(handedness_freq$proportion[handedness_freq$handedness == "Left Hand"], 4)
      )
    ),
    serve_height = lapply(split(serve_height_freq, seq(nrow(serve_height_freq))), function(row) {
      list(category = row$serve_height, count = row$n, proportion = round(row$proportion, 4))
    })
  )
)

json_path <- here("web", "results", "analysis_results.json")
write_json(analysis_results, json_path, pretty = TRUE, auto_unbox = TRUE)

# Summary
cat("\n")
cat("Pipeline completed.\n")
cat("Sample Size:", nrow(ping_pong), "\n")
cat("JSON: web/results/analysis_results.json\n")
cat("Images: web/images/*.png\n")
