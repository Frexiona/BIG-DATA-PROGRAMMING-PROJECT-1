#!/bin/bash

usr=user
pw=password
db=databasename

echo "---------------------MYSQL--------------------------"
echo "EXECUTEING 'SELECT * FROM CURRENT_DEPT_EMP LIMIT 20'"
START_TIME=$SECONDS
mysql -u $usr -p$pw -D $db -e "select * from current_dept_emp limit 20"
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "MYSQL SIMPLE QUERY RUNNING TIME IS: "$ELAPSED_TIME 
echo "MYSQL SIMPLE QUERY RUNNING TIME IS: "$ELAPSED_TIME > RunningTime.txt
echo "----------------------------------------------------"

echo "----------------MONGODB----------------"
echo "EXECUTEING 'db.current_dept_emp.find()'"
START_TIME=$SECONDS
mongo $db --eval "printjson(db.current_dept_emp.find().limit(20).toArray())"
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "MONGODB SIMPLE QUERY RUNNING TIME IS: "$ELAPSED_TIME
echo "MONGODB SIMPLE QUERY RUNNING TIME IS: "$ELAPSED_TIME >> RunningTime.txt
echo "---------------------------------------"

echo "------------------------------MYSQL----------------------------------"
echo "MYSQL"
echo "EXECUTEING 'SELECT * FROM DEPARTMENTS FULL JOIN DEPT_EMP'"
START_TIME=$SECONDS
mysql -u $usr -p$pw -D $db -e "select * from departments full join dept_emp"
ELAPSED_TIME=$(($SECONDS - $START_TIME)) 
echo "MYSQL COMPLEX QUERY RUNNING TIME IS: "$ELAPSED_TIME
echo "MYSQL COMPLEX QUERY RUNNING TIME IS: "$ELAPSED_TIME >> RunningTime.txt
echo "---------------------------------------------------------------------"

echo "----------------------------------------------------------------MONGODB---------------------------------------------------------------------------"
echo "MONGODB"
echo "EXECUTEING 'db.departments.aggregate([{$lookup:{from: "dept_emp",localField: "dept_no",foreignField: "dept_no",as: "departments_docs"}}])'"
START_TIME=$SECONDS
mongo $db --eval 'db.departments.aggregate([{$lookup:{from: "dept_emp",localField: "dept_no",foreignField: "dept_no",as: "departments_docs"}}])'
ELAPSED_TIME=$(($SECONDS - $START_TIME)) 
echo "MONGODB COMPLEX QUERY RUNNING TIME IS: "$ELAPSED_TIME
echo "MONGODB COMPLEX QUERY RUNNING TIME IS: "$ELAPSED_TIME >> RunningTime.txt 
echo "--------------------------------------------------------------------------------------------------------------------------------------------------"
