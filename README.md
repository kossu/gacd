{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # run_analysis.R\
\
This script combines the training and test datasets, adds labels and produces a new data set with mean of each variable for each subject & activity pair.\
\
First both test and training data is loaded and combined with the subject and activity data. The variable labels are loaded and \'93cleaned\'94, special characters are removed. Then test and training datasets are combined and the variable labels are added (10288 x (561+2). \
\
Next step is to get only mean and std variables from this combined dataset. I\'92m using `grep` to get the column numbers (86 in total). With these the script subsets the original dataset into a smaller one (10299x(86+2). \
\
Finally, the script uses `dplyr` to group and summarise the means. I interpreted \'93independent tidy data set with the average of each variable for each activity and each subject\'94 as an average for each variable for each subject activity pair, so the file is (6*30)x88.}