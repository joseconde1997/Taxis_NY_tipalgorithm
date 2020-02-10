library(pls)
library(tidyverse)
library(ggplot2)
#prediction of tips with current data
y_lm <- y[,c(1,4:7,9:18)]
y_lm <- y_lm[,c(1:5,7:15)]
#all in
mod_lm <- lm(tip_amount~.,y_lm)
summary(mod_lm)
#limited model
mod_lim <- lm(tip_amount~VendorID+passenger_count+trip_distance+RatecodeID+store_and_fwd_flag+
                payment_type+fare_amount+tolls_amount+improvement_surcharge+congestion_surcharge,y_lm)
summary(mod_lim)
#extra
mod_extra <- lm (tip_amount~extra,y_lm)
summary(mod_extra)

#tax
mod_tax <- lm (tip_amount~mta_tax,y_lm)
summary(mod_tax)

#total_amount
mod_total <- lm(tip_amount~total_amount,y_lm)
summary(mod_total)

#predict
pred <- predict(mod_lim)

#numeric data
num <- select_if(y,is.numeric)
lm_num <- lm(tip_aVimount~.,num)
summary(lm_num)
samples <- c()
for (i in 1:1000) {
  test <- sample(c(766792),1000)
  pred <- predict(lm_num,y_lm[test,])
  tip_amount_plot <- y$tip_amount[test]
  r_plot <- data.frame(tip_amount_plot,pred)
  samples <- c(samples,cor(r_plot$tip_amount_plot,r_plot$pred)^2)
}

names(r_plot) <- c("tip","pred")
ggplot(data=r_plot,aes(pred,tip)) + geom_point() + geom_smooth(method = "lm",se=T,color="brown",
                                                               size=0.5,level=0.95)
