library(dplyr)

# # #
# Read and clean up activity labels

activities <- read.table("UCI HAR Dataset/activity_labels.txt")[2]
activities <- as.factor(
                sapply(
                  activities, 
                  function(x) { 
                    paste(substring(x,1,1), 
                          tolower(substring(x,2)), sep="") 
                  } 
                )
              )

# # #
# Read list of measurements to extract and cleans up the names

# Converts a feature name into nice camel-case form
clean_feature_names <- function(s) {
  s <- sub("^t", "Time", s)
  s <- sub("^f", "Frequency", s)
  s <- gsub("Acc", "Acceleration", s)
  s <- gsub("Mag", "Magnitude", s)
  s <- gsub("-mean\\(\\)-?", "Mean", s)
  s <- gsub("-std\\(\\)-?", "Std", s)
  return(s)
}

measurements <- tbl_df(read.table("UCI HAR Dataset/features.txt")) %>% 
                rename(index = V1, name = V2) %>%
                filter(grepl("mean\\(\\)", name) | grepl("std\\(\\)", name)) %>%
                mutate(name = clean_feature_names(name))


# # #
# Load the actual data in raw form

subject <- c(read.table("UCI HAR Dataset/train/subject_train.txt")[[1]],
             read.table("UCI HAR Dataset/test/subject_test.txt")[[1]])
value <- tbl_df(rbind(read.table("UCI HAR Dataset/train/X_train.txt"),
                      read.table("UCI HAR Dataset/test/X_test.txt")))
activity <- c(read.table("UCI HAR Dataset/train/y_train.txt")[[1]],
              read.table("UCI HAR Dataset/test/y_test.txt")[[1]])

# # #
# Data cleanup

# Throw away unwanted measurements
value <- select(value, measurements[[1]])
# Rename columns to pretty names
names(value) <- measurements[[2]]

# Replace activity index with factor
activity <- sapply(activity, function(x) {activities[x]} )


# # #
# Merge into one data frame
data <- tbl_df(cbind(subject, activity, value))
rm(subject, value, activity, measurements, activities, clean_feature_names)


# # #
# Compute summary
mean_data <- group_by(data, subject, activity) %>% 
             summarize_each(funs(mean))
# Rename value columns so it's clear that they contain averages
names(mean_data) <- gsub("(^T|^F)", "Avg\\1", names(mean_data))

write.table(data, file = "tidy_data.txt", row.names=F, quote=F)
write.table(mean_data, file = "tidy_mean_data.txt", row.names=F, quote=F)