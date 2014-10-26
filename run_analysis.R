
setwd("./UCI HAR Dataset/test")
X1 = read.table ("X_test.txt")
y1 = read.table ("y_test.txt")
s1 = read.table ("subject_test.txt")
X1 = cbind (X1, y1, s1)

setwd("../../UCI HAR Dataset/train")
X2 = read.table ("X_train.txt")
y2 = read.table ("y_train.txt")
s2 = read.table ("subject_train.txt")
X2 = cbind (X2, y2, s2)

X1 = rbind (X1, X2)

features = c(1:6, 41:46, 81:86, 121:126, 161:166, 
             201,202,214,215,227,228,240,241,253,254, 
             266:271, 345:350, 424:429, 
             503,504,516,517,529,530,542,543)
             

X = X1[, c(features, 562,563)]

setwd("../")
activity = read.table ("activity_labels.txt")

X = merge (X, activity, by.x="V1.1", by.y="V1")

fnames = read.table ("features.txt")
fn = fnames[features,]
colnames(X) = c("ActivityIndex", as.character(fn [,2]), "Subject", "Activity")

Xa = aggregate(X, list(X$Subject, X$Activity), mean)

setwd("../")
write.table(Xa, file="tidy.txt", row.names=FALSE)
