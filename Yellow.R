library(ggplot2)
library(lubridate)
str(y)
#lubridate
my_date <- as.Date(y$tpep_pickup_datetime, format = "%m/%d/%Y %H:%M:%S")
#frequency of surcharge
n_occur_surch <- data.frame(table(y$congestion_surcharge))
y$congestion_surcharge[is.na(y$congestion_surcharge)] <- 0

#Vendor_ID factorization
n_occur_ID <- data.frame(table(y$VendorID))
y$VendorID <- as.factor(y$VendorID)

#passanger count
n_occur_pas <- data.frame(table(y$passenger_count))
y$passenger_count <- as.factor(y$passenger_count)

#rate code
n_occur_rate <- data.frame(table(y$RatecodeID))
y$RatecodeID <- as.factor(y$RatecodeID)

#PuLocation
n_occur_Location <- data.frame(table(y$PULocationID))
y$PULocationID <- as.factor(y$PULocationID)

#DoLocation
n_occur_Do <- data.frame(table(y$DOLocationID))
y$DOLocationID <- as.factor(y$DOLocationID)

#payment type
n_occur_pay <- data.frame(table(y$payment_type))
y$payment_type <- as.factor(y$payment_type)

#fare amount(numeric)
n_occur_fair <- as.data.frame(as.table(y$fare_amount))

#extra (numeric)
n_occur_extra <- as.data.frame(as.table(y$extra))
y$extra <- as.factor(y$extra)
#tax (numeric)
n_occur_tax<- as.data.frame(as.table(y$mta_tax))
y$mta_tax <- as.factor(y$mta_tax)

#surcharge improvements
y$improvement_surcharge <- as.factor(y$improvement_surcharge)

#congestion surcharge
y$congestion_surcharge <- as.factor(y$congestion_surcharge)
