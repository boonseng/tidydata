tidydata
========

<b>1. Merges the training and the test sets to create one data set.</b><br>
Test data set was created by reading in "X_test.txt", "y_test.txt", "subject_test.txt" and cbind them together.<br>
Training data set was created by reading in "X_train.txt", "y_train.txt", "subject_train.txt" and cbind them together.<br>
rbind was called to merge the two data sets together. <br>
<br>
<b>2. Extracts only the measurements on the mean and standard deviation for each measurement.</b><br> 
Look through the features.txt to identify columns with mean and std dev and created a list of their indexes:<br>
features = c(1:6, 41:46, 81:86, 121:126, 161:166, <br>
             201,202,214,215,227,228,240,241,253,254, <br>
             266:271, 345:350, 424:429, <br>
             503,504,516,517,529,530,542,543)<br>
Subset resulting data set from step 1 with this list.<br>
<br>
<b>3. Uses descriptive activity names to name the activities in the data set.</b><br>
Read "activity_labels.txt" and merge with data set from step 2 matching by activity id.<br>
<br>
<b>4. Appropriately labels the data set with descriptive variable names. </b><br>
Use list from step 2 to extract needed feature descriptions from "features.txt".<br>
Use colname to rename variable names.<br>
<br>
<b>5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</b><br>
Called aggregate function grouping Subject and Activity with mean operation.<br>
Called write.table to "tidy.txt".<br>
