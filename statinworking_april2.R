#to do
#add in total numbers
#add in a title for section 1
#shorten names under each column
#name overall figure




# Load the ggplot2 library
library(ggplot2)



########Section 1
# Create a data frame with the provided data for each section
section1_data <- data.frame(
  Percentage = c("48", "52"),
  Group = c("Legitimate reason for nonadherance", "Statin indicated")
)

# Convert Percentage column to numeric
section1_data$Percentage <- as.numeric(as.character(section1_data$Percentage))

# Create a bar plot with stacked bars
barplot(as.matrix(section1_data$Percentage),
        main = "Percentage Distribution",
        xlab = "Category",
        ylab = "Percentage",
        col = c("forestgreen", "orange"),
        ylim = c(0, 100),
        beside = FALSE,
        width = 0.5)

# Add percentages as text labels on top of the bars
text(x = 1:length(section1_data$Percentage), y = section1_data$Percentage,
     labels = paste0(section1_data$Percentage, "%"), pos = 3, cex = 0.8)




library(ggplot2)

# Create a data frame with the provided data for each section
section1_data <- data.frame(
  Percentage = c("48", "52"),
  Count = c(27, 29),
  Group = c("Legitimate reason for nonadherance", "Statin indicated")
)

# Convert Percentage column to numeric
section1_data$Percentage <- as.numeric(as.character(section1_data$Percentage))

# Create a bar plot using ggplot2
ggplot(section1_data, aes(x = 1, y = Percentage, fill = Group)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Percentage, "% (", Count, ")")), 
            position = position_stack(vjust = 0.5), size = 3, color = "black") +
  scale_fill_manual(values = c("forestgreen", "orange")) +
  labs(title = "Pts with ASCVD",
       x = "Category",
       y = "Percentage") +
  ylim(0, 100) +
  theme_minimal() +
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())  # Hide x-axis labels and ticks






#############################
# Get the coordinates for placing the legend box
legend_x <- max(par("usr")[1:2]) # Set x-coordinate to the maximum value of the plot area
legend_y <- max(par("usr")[3:4])  # Set y-coordinate to the maximum value of the plot area

legend(legend_x, legend_y,
       legend = c("Legitimate reason for nonadherance", "Statin indicated"),
       fill = c("forestgreen", "orange"),
       bty = "Y",  # Remove legend box
       cex = 0.8,  # Adjust the size of the legend text
       x.intersp = 0.5,  # Adjust horizontal spacing between legend items
       xjust = 1,  # Align legend box to the right
       yjust = 1)  # Align legend box to the top

#######Section 2
section2_data <- data.frame(
  Category = c("Explicit recommendation",
               "Statin refusal",
               "Pt declines statin"),
  Percentage = c("39%", "36%", "13%"),
  Count = c("(22)", "(20)", "(7)")
)


# Convert Percentage column to numeric
section2_data$Percentage <- as.numeric(sub("%", "", section2_data$Percentage))

# Set up the plot
barplot(section2_data$Percentage, 
        ylim = c(0, 100),  # Increase Y axis to 100
        names.arg = section2_data$Category,
        main = "Percentage of Patients",
        xlab = "Category",
        ylab = "Percentage of Patients",
        col = "orange",
        border = "white")  # Add a white border to bars

# Overlay the counts on top of each bar
text(x = 1:length(section2_data$Category), 
     y = section2_data$Percentage + 5,  # Adjust the position for the count labels
     labels = section2_data$Count, 
     pos = 3, 
     cex = 1)  # Adjust the size of the count labels




#reworked
# Get the coordinates for placing the legend box
legend_x <- max(par("usr")[1:2]) # Set x-coordinate to the maximum value of the plot area
legend_y <- max(par("usr")[3:4])  # Set y-coordinate to the maximum value of the plot area

legend(legend_x, legend_y,
       legend = c("Legitimate reason for nonadherance", "Statin indicated"),
       fill = c("forestgreen", "orange"),
       bty = "Y",  # Remove legend box
       cex = 0.8,  # Adjust the size of the legend text
       x.intersp = 0.5,  # Adjust horizontal spacing between legend items
       xjust = 1,  # Align legend box to the right
       yjust = 1)  # Align legend box to the top

#######Section 2
section2_data <- data.frame(
  Category = c("Ever had a statin recommended",
               "Ever declined a statin",
               "Documented reason for statin refusal"),
  Percentage = c("50%", "45%", "18%"),
  Count = c("(11)", "(10)", "(4)")
)


# Convert Percentage column to numeric
section2_data$Percentage <- as.numeric(sub("%", "", section2_data$Percentage))

# Set up the plot
barplot(section2_data$Percentage, 
        ylim = c(0, 100),  # Increase Y axis to 100
        names.arg = section2_data$Category,
        main = "Percentage of Patients",
        xlab = "Category",
        ylab = "Percentage of Patients",
        col = "orange",
        border = "white")  # Add a white border to bars

# Overlay the counts on top of each bar
text(x = 1:length(section2_data$Category), 
     y = section2_data$Percentage + 5,  # Adjust the position for the count labels
     labels = section2_data$Count, 
     pos = 3, 
     cex = 1)  # Adjust the size of the count labels



#######Section 4
section3_data <- data.frame(
  Category = c("Patients who explicitly declined a statin at least once",
               "Patients who never had any documentation of an ASCVD discussion"),
  Percentage = c("45%", "36%"),
  Count = c("10", "8"),
  Group = c("Remaining Patients", "Remaining Patients")
)

