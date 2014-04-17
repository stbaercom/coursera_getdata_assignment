
for (fn in c("y_test.txt","y_train.txt", "X_test.txt","X_train.txt")) {
  if(!file.exists(fn)) {
    stop("File ",fn, " is required in the same dir as this script")    
  }
} 

# Load activity names, assign varname for join
activity_labels <-read.csv("activity_labels.txt",header = F, sep=" ",col.names = c("label_code","activity"))

# Load variable names and clean them ab [1]
names <- read.csv("features.txt",sep=" ", header = F)$V2
names <- tolower(gsub("[(),-]+","_",names))
names <- gsub("_$","",names)

#Load activity label codes, assigning var names for join
y_test <-read.csv("y_test.txt",header = F, sep=" ", col.names = "label_code")
y_train <-read.csv("y_train.txt",header = F, sep=" ",col.names = "label_code")
# Join training and test data
y_all = rbind(y_test,y_train)

# Load the Subject data
s_test <-read.csv("subject_test.txt",header = F, sep=" ", col.names = "subject")
s_train <-read.csv("subject_train.txt",header = F, sep=" ",col.names = "subject")
s_all =  rbind(s_test,s_train)


# merge on label code
acc <-merge(activity_labels,y_all)

# load all measurement, assigning the colnames from [1]
xtest <- read.fwf("X_test.txt", widths = rep(16,times=561), header = F,col.names = names)
xtrain <- read.fwf("X_train.txt", widths = rep(16,times=561), header = F,col.names = names)

# join training and test data
x_all <- rbind(xtest,xtrain)
# build a new data from with only  std and mean columns, selected by name
x_all <- x_all[,grep("mean",names(x_all))]


# add the activity labels and subjects
ds1 <- cbind(x_all,acc,s_all)

# build a long from, tidy dataset
library(reshape2)
ds1_tidy <- melt(ds1, c("activity","subject"))

write.table(ds1_tidy, "tidy_data.txt", sep=" ", row.names=F, col.names=T) 

