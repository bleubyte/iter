#!/bin/bash
# A simple bash script that grabs the plotman job IDs
# and iterates over each ID with plotman resume/suspend JOB ID
# Written by BleuByte

# Get the Job ID's and save it in id.txt file
plotman status | awk '{print $1}' | sed -n '1!p' >> id.txt

FILENAME="id.txt"

LINES=$(cat $FILENAME)
# Loop through each line and execute the command
for LINE in $LINES
do
    echo "Stopping Job # $LINE"
    plotman $1 $LINE
done

# Remove id.txt file
rm id.txt
