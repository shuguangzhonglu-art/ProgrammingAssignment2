# Getting and Cleaning Data Course Project

## Overview
This repository contains the files required for the Coursera Getting and Cleaning Data course project. The purpose of the project is to demonstrate the ability to collect, work with, clean, and prepare a tidy data set for later analysis.

## Repository Files
- `run_analysis.R`  
  R script that downloads, merges, cleans, and summarizes the UCI HAR data set.

- `CodeBook.md`  
  Describes the variables, source data, transformations, and the final tidy data set.

- `tidy_data.txt`  
  Final tidy data set created by the script. This file contains the average of each selected variable for each activity and each subject.

## Data Source
The data used in this project come from the UCI Machine Learning Repository:

[Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download link used by the script:

[Dataset ZIP File](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## What the Script Does
The `run_analysis.R` script performs the following steps:

1. Downloads the dataset if it is not already present.
2. Unzips the dataset if needed.
3. Loads the training and test data.
4. Merges the training and test data into one data set.
5. Extracts only the measurements on the mean and standard deviation.
6. Replaces activity numbers with descriptive activity names.
7. Labels the data set with descriptive variable names.
8. Creates a second tidy data set with the average of each variable for each activity and each subject.
9. Writes the final data set to `tidy_data.txt`.

## How to Run
Place `run_analysis.R` in your working directory and run:

```r
source("run_analysis.R")
```

Or from the command line:

```bash
Rscript run_analysis.R
```

## Output
After running the script, the following file will be created:

- `tidy_data.txt`

## Tidy Data Principles Used
The final data set is tidy because:
- Each variable forms one column
- Each observation forms one row
- Each type of observational unit forms one table

## Author
This work is submitted as part of the course project requirements.
