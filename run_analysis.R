##  project asignment
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#

#
library(reshape2)
library(plyr)
## 1.     Merges the training and the test sets to create one data set.
#
#
subtr<-read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
ytr<-read.table(".\\UCI HAR Dataset\\train\\y_train.txt")
names(subtr)<-"subject"
names(ytr)<-"activity"
subtr<-cbind(ytr,subtr)
subtr<-mutate(subtr, type = "train")
#
#
baxtr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt")
baxtrNms<-names(baxtr)
baxtr<-cbind(subtr, baxtr)
baxtr<-melt(baxtr, id.vars = c("activity","subject"), measure.vars = baxtrNms)
names(baxtr)<-c("activity", "subject", "window", "bodyaccx")
#
baxtr$activity<-as.character(baxtr$activity)
act<-baxtr$activity=="1"; baxtr$activity[act]<-"walking"
act<-baxtr$activity=="2"; baxtr$activity[act]<-"walkingupstairs"
act<-baxtr$activity=="3"; baxtr$activity[act]<-"walkingdownstairs"
act<-baxtr$activity=="4"; baxtr$activity[act]<-"sitting"
act<-baxtr$activity=="5"; baxtr$activity[act]<-"standing"
act<-baxtr$activity=="6"; baxtr$activity[act]<-"laying"
#
baytr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt")
baytr<-melt(baytr, measure.vars = names(baytr))
names(baytr)<-c("window", "bodyaccy")
baytr$window<-NULL
#
baztr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt")
baztr<-melt(baztr, measure.vars = names(baztr))
names(baztr)<-c("window", "bodyaccz")
baztr$window<-NULL
#
bgxtr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt")
bgxtr<-melt(bgxtr, measure.vars = names(bgxtr))
names(bgxtr)<-c("window", "bodygyrox")
bgxtr$window<-NULL
#
bgytr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt")
bgytr<-melt(bgytr, measure.vars = names(bgytr))
names(bgytr)<-c("window", "bodygyroy")
bgytr$window<-NULL
#
bgztr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt")
bgztr<-melt(bgztr, measure.vars = names(bgztr))
names(bgztr)<-c("window", "bodygyroz")
bgztr$window<-NULL
#
taxtr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt")
taxtr<-melt(taxtr, measure.vars = names(taxtr))
names(taxtr)<-c("window", "totaccx")
taxtr$window<-NULL
#
taytr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt")
taytr<-melt(taytr, measure.vars = names(taytr))
names(taytr)<-c("window", "totaccy")
taytr$window<-NULL
#
taztr<-read.table(".\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt")
taztr<-melt(taztr, measure.vars = names(taztr))
names(taztr)<-c("window", "totaccz")
taztr$window<-NULL
#
ods<-cbind(baxtr,baytr,baztr,bgxtr,bgytr,bgztr,taxtr,taytr,taztr)
#
#
subts<-read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
yts<-read.table(".\\UCI HAR Dataset\\test\\y_test.txt")
names(subts)<-"subject"
names(yts)<-"activity"
subts<-cbind(yts,subts)
subts<-mutate(subts, type="test")
#
baxts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_x_test.txt")
baxtsNms<-names(baxts)
baxts<-cbind(subts, baxts)
baxts<-melt(baxts, id.vars = c("activity", "subject"), measure.vars = baxtsNms)
names(baxts)<-c("activity", "subject", "window", "bodyaccx")
#
baxts$activity<-as.character(baxts$activity)
act<-baxts$activity=="1"; baxts$activity[act]<-"walking"
act<-baxts$activity=="2"; baxts$activity[act]<-"walkingupstairs"
act<-baxts$activity=="3"; baxts$activity[act]<-"walkingdownstairs"
act<-baxts$activity=="4"; baxts$activity[act]<-"sitting"
act<-baxts$activity=="5"; baxts$activity[act]<-"standing"
act<-baxts$activity=="6"; baxts$activity[act]<-"laying"
#
bayts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt")
bayts<-melt(bayts, measure.vars = names(bayts))
names(bayts)<-c("window", "bodyaccy")
bayts$window<-NULL
#
bazts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt")
bazts<-melt(bazts, measure.vars = names(bazts))
names(bazts)<-c("window", "bodyaccz")
bazts$window<-NULL
#
bgxts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_x_test.txt")
bgxts<-melt(bgxts, measure.vars = names(bgxts))
names(bgxts)<-c("window", "bodygyrox")
bgxts$window<-NULL
#
bgyts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt")
bgyts<-melt(bgyts, measure.vars = names(bgyts))
names(bgyts)<-c("window", "bodygyroy")
bgyts$window<-NULL
#
bgzts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt")
bgzts<-melt(bgzts, measure.vars = names(bgzts))
names(bgzts)<-c("window", "bodygyroz")
bgzts$window<-NULL
#
taxts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_x_test.txt")
taxts<-melt(taxts, measure.vars = names(taxts))
names(taxts)<-c("window", "totaccx")
taxts$window<-NULL
#
tayts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt")
tayts<-melt(tayts, measure.vars = names(tayts))
names(tayts)<-c("window", "totaccy")
tayts$window<-NULL
#
tazts<-read.table(".\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt")
tazts<-melt(tazts, measure.vars = names(tazts))
names(tazts)<-c("window", "totaccz")
tazts$window<-NULL
#
ods2<-cbind(baxts,bayts,bazts,bgxts,bgyts,bgzts,taxts,tayts,tazts)
#
#
ods<-rbind(ods,ods2)
#
rm(baxtr,baytr,baztr,bgxtr,bgytr,bgztr,taxtr,taytr,taztr)
rm(ods2,baxts,bayts,bazts,bgxts,bgyts,bgzts,taxts,tayts,tazts)
#
#write.table(ods, file="ods.txt",sep=",")
#
ods <- melt(ods, id=c("activity","subject","window"))
#
#rm(ODS)
#
#
names(ods)<-c("activity","subject","window", "sensor", "value")
#
ods<-aggregate(value~subject+activity+sensor,data=ods,FUN=function(ods) c(mean=mean(ods),standarddev=sd(ods)))
#
#
write.table(ods,"ods_fin.txt",sep=",", row.name=FALSE)

#