#!/bin/bash

# HARD-CODED: Basic Script to connect to a MySQL database using hard-coded secrets

# Global Variables
db_user="cardbadmin"
db_pass="Cyberark1"
db_server="10.0.0.10"
db_port="3306"
db_name="cars"

# Prompt for User Input 
read -p "Enter Stock #: " stock
read -p "Enter Year: " year
read -p "Enter Make: " make
read -p "Enter Model: " model
read -p "Enter Color: " color
read -p "Enter Style: " style
read -p "Enter Odometer: " odometer
read -p "Enter Price: " price
read -p "Enter Comments: " comments

# Create SQL Statements
q1=$(echo "insert into inventory values ('$stock', '$year', '$make', '$model', '$color', '$style', '$odometer', '$price', '$comments', CURRENT_TIMESTAMP());")
q2='select * from inventory;'
sql="${q1}${q2}"

# Connect to MySQL Database
echo "-----------  Connection String -----------------"
echo "mysql -h $db_server -P $db_port --user=$db_user --password=$db_pass $db_name -e $sql"
echo "-----------  SQL Statements --------------------"
echo $q1
echo "$q2"
echo "-----------  Query Output ----------------------"
mysql -h $db_server -P $db_port --user=$db_user --password=$db_pass $db_name -e "$sql"
