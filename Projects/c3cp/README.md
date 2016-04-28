## Getting and Cleaning Data -- Course Project

Script `run_analysis.R`reads and tidies the data obtained 
  [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  [1].
It assumes the data has been downloaded and unpacked, i.e. there is a directory 
`UCI HAR Dataset` in the same folder as `run_analysis.R`, which is also the working directory.

The result are files `tidy_data.txt` and `tidy_mean_data.txt`;
their content is documented in the [codebook](CodeBook.md).

---

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
