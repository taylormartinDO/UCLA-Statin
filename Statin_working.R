


# Load the ggplot2 library
library(ggplot2)

# Create a data frame with the provided data for each section
section1_data <- data.frame(
  Category = c("Patients with well-justified reasons for not taking a statin",
               "Remaining patients"),
  Percentage = c("48%", "52%"),
  Group = c("Well-justified reasons", "Remaining Patients")
)

section2_data <- data.frame(
  Category = c("Notes documenting an explicit statin recommendation",
               "Notes documenting a statin refusal",
               "Notes documenting patient reasons for declining a statin"),
  Percentage = c("39%", "36%", "13%")
)

section3_data <- data.frame(
  Category = c("Patients who explicitly declined a statin at least once",
               "Patients who never had any documentation of an ASCVD discussion"),
  Percentage = c("45%", "36%"),
  Group = c("Remaining Patients", "Remaining Patients")
)

# Convert Percentage column to numeric
section1_data$Percentage <- as.numeric(sub("%", "", section1_data$Percentage))
section2_data$Percentage <- as.numeric(sub("%", "", section2_data$Percentage))
section3_data$Percentage <- as.numeric(sub("%", "", section3_data$Percentage))

# Create the bar plot
ggplot() +
  # Section 3
  geom_bar(data = section3_data, aes(x = Category, y = Percentage, fill = Group), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section3_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  # Section 2
  geom_bar(data = section2_data, aes(x = Category, y = Percentage, fill = Category), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section2_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  # Section 1
  geom_bar(data = section1_data, aes(x = Category, y = Percentage, fill = Group), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section1_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  # Vertical lines separating sections
  geom_vline(xintercept = c(2.5, 5.5), linetype = "dashed", color = "grey") +
  # Plot customization
  coord_cartesian(ylim = c(0, 100)) +
  labs(x = "", y = "Percentage", fill = "") +
  scale_fill_manual(values = c("Well-justified reasons" = "blue", "Remaining Patients" = "red", "Notes documenting an explicit statin recommendation" = "green", "Notes documenting a statin refusal" = "orange", "Notes documenting patient reasons for declining a statin" = "purple")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




