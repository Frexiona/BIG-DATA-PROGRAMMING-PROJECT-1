#!/bin/bash

mongo << EOF
use databasename;
db.dept_emp.find().forEach(function(doc)
{
	doc.from_date=new ISODate(doc.from_date);
	doc.to_date=new ISODate(doc.to_date);
	db.dept_emp.save(doc);
})
db.dept_manager.find().forEach(function(doc)
{
        doc.from_date=new ISODate(doc.from_date);
        doc.to_date=new ISODate(doc.to_date);
        db.dept_manager.save(doc);
})
db.employees.find().forEach(function(doc)
{
        doc.birth_date=new ISODate(doc.birth_date);
        doc.hire_date=new ISODate(doc.hire_date);
        db.employees.save(doc);
})
db.salaries.find().forEach(function(doc)
{
        doc.from_date=new ISODate(doc.from_date);
        doc.to_date=new ISODate(doc.to_date);
        db.salaries.save(doc);
})
db.titles.find().forEach(function(doc)
{
        doc.from_date=new ISODate(doc.from_date);
        doc.to_date=new ISODate(doc.to_date);
        db.titles.save(doc);
})
exit
EOF
