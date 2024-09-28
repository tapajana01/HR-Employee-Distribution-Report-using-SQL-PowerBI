-- creating a database for the project
create database projects;

-- choosing the database
use projects;

-- sample overview of data
select * from hr; 

-- data cleaning 
-- renaming the ï»¿id column to emp_id
alter table hr
change column ï»¿id emp_id varchar(20) null;

select * from hr;

-- checking and changing the datatypes from the table
describe hr;

select birthdate from hr;

-- formating date

set sql_safe_updates = 0;

-- changing formating of "birthdate" 
update hr
set birthdate = case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

-- changing the datatype of "birthdate" column from text to date format
alter table hr
modify column birthdate date;

-- checking updates
describe hr;
select birthdate from hr;

-- changing formating of "hire_date" 
update hr
set hire_date = case
	when hire_date like '%/%' then date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    when hire_date like '%-%' then date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    else null
end;

-- changing the datatype of "hire_date" column from text to date format
alter table hr
modify column hire_date date;


-- checking updates
describe hr;
select hire_date from hr;

-- changing the formatting of termdate
update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate != '';
select termdate from hr;


-- changing the datatype of "termdate" column from text to date format
alter table hr
modify column termdate date;

describe hr;

-- adding "age" column on the dataset
ALTER TABLE hr ADD COLUMN age INT;
SELECT * FROM hr;

-- calculating the age
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());
SELECT * FROM hr;

-- CHECKING OUTLIRE FROM THE AGE SECTION
SELECT
	min(age) AS youngest,
	max(age) AS oldest 
FROM hr;


SELECT count(*) FROM hr WHERE age < 18;