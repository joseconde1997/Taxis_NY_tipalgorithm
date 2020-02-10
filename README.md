In this repository a tipping algorithm was created to recommend how much should clients tip for a service.
https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page
To achieve this I used the link above to study the different parameters that determined the tipping patterns of people in NYC.
To create a recommendation system I first translated the numeric dummie variables of a lot of parameters into factors. After clearing
all pseudonumeric data I filtered the numeric data and created a simple linear model with 4 variables (trip_distance, fare_amount, 
tolls_amount and total_amount). 
With this model I managed to achieve an explanation of 99% of the variability of tipping.
