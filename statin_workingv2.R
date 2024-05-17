#to do
#add in total numbers
#add in a title for section 1
#shorten names under each column
#name overall figure






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

# Reorder the datasets
section1_data$Category <- factor(section1_data$Category, levels = section1_data$Category)
section2_data$Category <- factor(section2_data$Category, levels = section2_data$Category)
section3_data$Category <- factor(section3_data$Category, levels = section3_data$Category)

# Create the bar plot
ggplot() +
  # Section 1
  geom_bar(data = section1_data, aes(x = Category, y = Percentage, fill = Group), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section1_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  # Section 2
  geom_bar(data = section2_data, aes(x = Category, y = Percentage, fill = Category), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section2_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  annotate("text", x = 4, y = 95, label = "Encounters where patient is not on guideline directed therapy", hjust = 0.5, size = 3) +
  # Section 3
  geom_bar(data = section3_data, aes(x = Category, y = Percentage, fill = Category), position = position_dodge(width = 0.9), stat = "identity") +
  geom_text(data = section3_data, aes(x = Category, y = Percentage, label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  annotate("text", x = 6.5, y = 90, label = "Patients not on guideline directed therapy", hjust = 0.5, size = 3) +
  # Vertical lines separating sections
  geom_vline(xintercept = c(2.5, 5.5), linetype = "dashed", color = "grey") +
  # Plot customization
  coord_cartesian(ylim = c(0, 100)) +
  labs(x = "", y = "Percentage", fill = "") +
  scale_fill_manual(values = c("Well-justified reasons" = "blue", 
                               "Remaining Patients" = "red", 
                               "Notes documenting an explicit statin recommendation" = "orange", 
                               "Notes documenting a statin refusal" = "darkorange", 
                               "Notes documenting patient reasons for declining a statin" = "darkorange3", 
                               "Patients who explicitly declined a statin at least once" = "orchid1", 
                               "Patients who never had any documentation of an ASCVD discussion" = "orchid3")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")








library(ggplot2)

library(ggplot2)

# Section 1 Histogram
plot_section1 <- ggplot(section1_data, aes(x = Category, y = Percentage, fill = Group)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  labs(x = "", y = "Percentage", fill = "") +
  scale_fill_manual(values = c("Well-justified reasons" = "blue", 
                               "Remaining Patients" = "red")) +
  coord_cartesian(ylim = c(0, 100)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Section 2 Histogram
plot_section2 <- ggplot(section2_data, aes(x = Category, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  labs(x = "", y = "Percentage", fill = "") +
  coord_cartesian(ylim = c(0, 100)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Section 3 Histogram
plot_section3 <- ggplot(section3_data, aes(x = Category, y = Percentage, fill = Category)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = paste0(Percentage, "%")), position = position_dodge(width = 0.9), vjust = -0.5) +
  labs(x = "", y = "Percentage", fill = "") +
  coord_cartesian(ylim = c(0, 100)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

# Displaying the three plots separately
plot_section1
plot_section2
plot_section3
