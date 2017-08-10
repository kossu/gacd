# run_analysis.R

This script combines the training and test datasets, adds labels and produces a new data set with mean of each variable for each subject & activity pair.

First both test and training data is loaded and combined with the subject and activity data. The variable labels are loaded and "cleaned", special characters are removed. Then test and training datasets are combined and the variable labels are added (dim. 10288 x (561+2)). 

Next step is to get only mean and std variables from this combined dataset. Script uses`grep` to get the column numbers (86 in total). With these the script subsets the original dataset into a smaller one (dim. 10299x(86+2)). 

Finally, the script uses `dplyr` to group and summarise the means. I interpreted "independent tidy data set with the average of each variable for each activity and each subject" as an average for each variable for each subject activity pair, so the file is (6*30)x88.
