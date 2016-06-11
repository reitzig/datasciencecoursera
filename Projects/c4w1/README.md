File `relevant_data.csv` has been obtained from the 
  [original file](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)
with the command

```bash
cat household_power_consumption.txt | grep -E "^(1|2)/2/2007" > relevant_data.csv
```
