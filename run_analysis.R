# run_analysis.R
# Coursera Getting and Cleaning Data Course Project
# This script downloads, merges, cleans, and summarizes the UCI HAR Dataset

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "UCI_HAR_Dataset.zip"
data_dir <- "UCI HAR Dataset"

if (!file.exists(zip_file)) {
  download.file(url, destfile = zip_file, mode = "wb")
}

if (!file.exists(data_dir)) {
  unzip(zip_file)
}

features <- read.table(file.path(data_dir, "features.txt"), stringsAsFactors = FALSE)
activity_labels <- read.table(file.path(data_dir, "activity_labels.txt"), stringsAsFactors = FALSE)

colnames(features) <- c("feature_id", "feature_name")
colnames(activity_labels) <- c("activity_id", "activity_name")

x_train <- read.table(file.path(data_dir, "train", "X_train.txt"))
y_train <- read.table(file.path(data_dir, "train", "y_train.txt"))
subject_train <- read.table(file.path(data_dir, "train", "subject_train.txt"))

x_test <- read.table(file.path(data_dir, "test", "X_test.txt"))
y_test <- read.table(file.path(data_dir, "test", "y_test.txt"))
subject_test <- read.table(file.path(data_dir, "test", "subject_test.txt"))

x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

colnames(x_data) <- features$feature_name
colnames(y_data) <- "activity"
colnames(subject_data) <- "subject"

merged_data <- cbind(subject_data, y_data, x_data)

mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$feature_name)
selected_names <- features$feature_name[mean_std_features]

data_mean_std <- merged_data[, c("subject", "activity", selected_names)]

data_mean_std$activity <- activity_labels$activity_name[
  match(data_mean_std$activity, activity_labels$activity_id)
]

clean_names <- function(names_vector) {
  names_vector <- gsub("^t", "Time", names_vector)
  names_vector <- gsub("^f", "Frequency", names_vector)
  names_vector <- gsub("Acc", "Accelerometer", names_vector)
  names_vector <- gsub("Gyro", "Gyroscope", names_vector)
  names_vector <- gsub("Mag", "Magnitude", names_vector)
  names_vector <- gsub("BodyBody", "Body", names_vector)
  names_vector <- gsub("-mean\\(\\)", "Mean", names_vector)
  names_vector <- gsub("-std\\(\\)", "STD", names_vector)
  names_vector <- gsub("-", "", names_vector)
  names_vector <- gsub("\\(", "", names_vector)
  names_vector <- gsub("\\)", "", names_vector)
  names_vector
}

colnames(data_mean_std) <- c("subject", "activity", clean_names(selected_names))

tidy_data <- aggregate(. ~ subject + activity, data = data_mean_std, FUN = mean)
colnames(tidy_data)[3:ncol(tidy_data)] <- paste0("AverageOf", colnames(tidy_data)[3:ncol(tidy_data)])
tidy_data <- tidy_data[order(tidy_data$subject, tidy_data$activity), ]

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)

cat("Tidy dataset has been created as tidy_data.txt\n")
