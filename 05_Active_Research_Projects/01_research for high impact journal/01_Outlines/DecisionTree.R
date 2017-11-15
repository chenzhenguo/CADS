library(dplyr)
library(ggplot2)
library(tidyr)
library(tree)
library(rpart)

df1 <- read.csv("/Users/nilesguo/Desktop/SummaryModel.csv")
names(df1)[names(df1) == 'Model'] <- 'OutputModel'


tree.rpart <- rpart(OutputModel ~ ., df1, method = 'class', control = rpart.control(minsplit = 0))
tree.rpart

plot(tree.rpart)

tree.party <- partykit::as.party(tree.rpart)
plot(tree.party, type="simple")
