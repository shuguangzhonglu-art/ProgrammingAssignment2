# CodeBook

## Project Description
This project uses the Human Activity Recognition Using Smartphones Dataset from the UCI Machine Learning Repository. The goal is to clean the raw data and create a tidy data set that contains the average of each selected variable for each activity and each subject.

## Source Data
Original data source:  
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Dataset download link:  
[UCI HAR Dataset ZIP](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files Included
- `run_analysis.R`: R script used to download, merge, clean, and summarize the data
- `tidy_data.txt`: final tidy data set produced by the script
- `CodeBook.md`: description of variables, transformations, and summaries
- `README.md`: explanation of project files and how to run the script

## Data Processing Steps
The script performs the following steps:

1. Downloads and unzips the dataset if it is not already available.
2. Loads the training and test data sets.
3. Merges the training and test data into one complete data set.
4. Extracts only the measurements on the mean and standard deviation.
5. Replaces numeric activity IDs with descriptive activity names.
6. Cleans and expands variable names to make them more descriptive.
7. Creates a second independent tidy data set with the average of each variable for each activity and each subject.
8. Writes the final tidy data set to `tidy_data.txt`.

## Identifier Variables
- `subject`: ID of the participant (1 to 30)
- `activity`: type of activity performed

## Activity Labels
The following activity names are used:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

## Measurement Variables
The final tidy data set contains the average of each of the following variables for each subject and activity:

- AverageOfTimeBodyAccelerometerMeanX
- AverageOfTimeBodyAccelerometerMeanY
- AverageOfTimeBodyAccelerometerMeanZ
- AverageOfTimeBodyAccelerometerSTDX
- AverageOfTimeBodyAccelerometerSTDY
- AverageOfTimeBodyAccelerometerSTDZ
- AverageOfTimeGravityAccelerometerMeanX
- AverageOfTimeGravityAccelerometerMeanY
- AverageOfTimeGravityAccelerometerMeanZ
- AverageOfTimeGravityAccelerometerSTDX
- AverageOfTimeGravityAccelerometerSTDY
- AverageOfTimeGravityAccelerometerSTDZ
- AverageOfTimeBodyAccelerometerJerkMeanX
- AverageOfTimeBodyAccelerometerJerkMeanY
- AverageOfTimeBodyAccelerometerJerkMeanZ
- AverageOfTimeBodyAccelerometerJerkSTDX
- AverageOfTimeBodyAccelerometerJerkSTDY
- AverageOfTimeBodyAccelerometerJerkSTDZ
- AverageOfTimeBodyGyroscopeMeanX
- AverageOfTimeBodyGyroscopeMeanY
- AverageOfTimeBodyGyroscopeMeanZ
- AverageOfTimeBodyGyroscopeSTDX
- AverageOfTimeBodyGyroscopeSTDY
- AverageOfTimeBodyGyroscopeSTDZ
- AverageOfTimeBodyGyroscopeJerkMeanX
- AverageOfTimeBodyGyroscopeJerkMeanY
- AverageOfTimeBodyGyroscopeJerkMeanZ
- AverageOfTimeBodyGyroscopeJerkSTDX
- AverageOfTimeBodyGyroscopeJerkSTDY
- AverageOfTimeBodyGyroscopeJerkSTDZ
- AverageOfTimeBodyAccelerometerMagnitudeMean
- AverageOfTimeBodyAccelerometerMagnitudeSTD
- AverageOfTimeGravityAccelerometerMagnitudeMean
- AverageOfTimeGravityAccelerometerMagnitudeSTD
- AverageOfTimeBodyAccelerometerJerkMagnitudeMean
- AverageOfTimeBodyAccelerometerJerkMagnitudeSTD
- AverageOfTimeBodyGyroscopeMagnitudeMean
- AverageOfTimeBodyGyroscopeMagnitudeSTD
- AverageOfTimeBodyGyroscopeJerkMagnitudeMean
- AverageOfTimeBodyGyroscopeJerkMagnitudeSTD
- AverageOfFrequencyBodyAccelerometerMeanX
- AverageOfFrequencyBodyAccelerometerMeanY
- AverageOfFrequencyBodyAccelerometerMeanZ
- AverageOfFrequencyBodyAccelerometerSTDX
- AverageOfFrequencyBodyAccelerometerSTDY
- AverageOfFrequencyBodyAccelerometerSTDZ
- AverageOfFrequencyBodyAccelerometerJerkMeanX
- AverageOfFrequencyBodyAccelerometerJerkMeanY
- AverageOfFrequencyBodyAccelerometerJerkMeanZ
- AverageOfFrequencyBodyAccelerometerJerkSTDX
- AverageOfFrequencyBodyAccelerometerJerkSTDY
- AverageOfFrequencyBodyAccelerometerJerkSTDZ
- AverageOfFrequencyBodyGyroscopeMeanX
- AverageOfFrequencyBodyGyroscopeMeanY
- AverageOfFrequencyBodyGyroscopeMeanZ
- AverageOfFrequencyBodyGyroscopeSTDX
- AverageOfFrequencyBodyGyroscopeSTDY
- AverageOfFrequencyBodyGyroscopeSTDZ
- AverageOfFrequencyBodyAccelerometerMagnitudeMean
- AverageOfFrequencyBodyAccelerometerMagnitudeSTD
- AverageOfFrequencyBodyAccelerometerJerkMagnitudeMean
- AverageOfFrequencyBodyAccelerometerJerkMagnitudeSTD
- AverageOfFrequencyBodyGyroscopeMagnitudeMean
- AverageOfFrequencyBodyGyroscopeMagnitudeSTD
- AverageOfFrequencyBodyGyroscopeJerkMagnitudeMean
- AverageOfFrequencyBodyGyroscopeJerkMagnitudeSTD

## Variable Naming Conventions
The script transforms abbreviated names into descriptive names:
- `t` -> `Time`
- `f` -> `Frequency`
- `Acc` -> `Accelerometer`
- `Gyro` -> `Gyroscope`
- `Mag` -> `Magnitude`
- `mean()` -> `Mean`
- `std()` -> `STD`

## Units
The original dataset documentation does not consistently provide units for every transformed signal in a simple variable-by-variable format. Variables represent normalized sensor measurements derived from smartphone accelerometer and gyroscope signals in time and frequency domains.

## Output Data Set
The final file `tidy_data.txt` contains:
- 180 rows  
  (30 subjects × 6 activities)
- 68 columns  
  (2 identifier columns + 66 averaged measurement columns)
