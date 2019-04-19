-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

DROP TABLE IF EXISTS potential_employee;
DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS employer;
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (  --created
  user_id SERIAL,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL,
  employer_id INTEGER,

CONSTRAINT pk_user_id PRIMARY KEY (user_id)

);


CREATE TABLE employer(  --created
  employer_id SERIAL,
  company_name VARCHAR(100) NOT NULL,
  street_Address1 VARCHAR(100) NOT NULL,
  street_Address2 VARCHAR(100),
  zip_code VARCHAR(5) NOT NULL,
  city VARCHAR(100) NOT NULL,
  state VARCHAR(2) NOT NULL,

CONSTRAINT pk_employer_id PRIMARY KEY (employer_id)

);

CREATE TABLE position (     --created
position_id SERIAL,
employer_id INTEGER NOT NULL,
job_title VARCHAR(100) NOT NULL,
job_description VARCHAR(300) NOT NULL,
number_of_available_positions INTEGER,
area_of_city VARCHAR(10) NOT NULL,
hourly_rate VARCHAR(6) NOT NULL,
hourly_type VARCHAR(20) NOT NULL,
hire_type VARCHAR(20) NOT NULL,
shift VARCHAR(4) NOT NULL,
overtime VARCHAR(10),
health_benefits BOOLEAN,
retirement_benefits BOOLEAN,
education_benefits BOOLEAN,
second_chance_employer BOOLEAN NOT NULL,
other_comments VARCHAR(250),
pickup_location VARCHAR (100) DEFAULT '',
displayed BOOLEAN,

CONSTRAINT pk_position_id PRIMARY KEY (position_id),
CONSTRAINT fk_employer_id FOREIGN KEY (employer_id) REFERENCES employer(employer_id)


);

CREATE TABLE potential_employee (
employee_id SERIAL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
gender VARCHAR(1),
age INTEGER CHECK (age >= 18),
street_Address1 VARCHAR(100) NOT NULL,
street_Address2 VARCHAR(100),
zip_code VARCHAR(5) NOT NULL,
city VARCHAR(100) NOT NULL,
state VARCHAR(2) NOT NULL,
email_address VARCHAR(50),
phone_number VARCHAR(10),
permission_to_work BOOLEAN,
is_transportation_available BOOLEAN NOT NULL,
proficient_in_english BOOLEAN,
criminal_background BOOLEAN,


CONSTRAINT pk_employee_id PRIMARY KEY (employee_id)

);

-- Insert employers into Database

INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code)
        VALUES ('1', 'McDonalds','910 W 5TH AVE ', '', 'Columbus', 'OH', '43212');

INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code)
        VALUES ('2', 'Macys Department Store',' 5123 Tuttle Crossing Blvd', '', 'Columbus', 'OH', '43016');

INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code)
        VALUES ('3', 'Amazon Fullfillment Center','3563 Interchange Rd', '', 'Columbus', 'OH', '43204');

INSERT INTO employer (employer_id, company_name, street_Address1, street_Address2, city, state, zip_code)
        VALUES ('4', 'UPS','4545 Fisher Road', '', 'Columbus', 'OH', '43228');


-- Insert positions into Database
INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '1', 'Food Service', 'Will prepare food and greet customers with a smile', '8.50', 'Full-time', 'Permanent', '2nd', 'North', 'true', 'true', 'true','true','','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '2', 'Store Associate', 'Customer service provider to the most elite in the area. Will sell mens suits and ensure they are confident and in style', '15.00', 'Full-time', 'Permanent', '2nd', 'North', 'true', 'true', 'true', 'false','Previous experience in sales','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '3', 'Pick/Packer', 'Must be able to lift over 40 pounds and work in extreme environments. May be loud, may be cold or hot. Bending, pushing, pulling, and reaching are involved. This is a great company with room for growth. We would be happy to have you with us ', '12.60', 'Full-time', 'Temp-to-Hire', '3rd', 'West', 'false', 'false', 'false', 'true','','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '4', 'Delivery Driver', 'Drive trucks and deliver our products across state lines. Collect payments from consumers (as needed), and record transportation details and transaction records on daily log book', '18.50', 'Full-time', 'Permanent', '1st', 'Southwest', 'true', 'true', 'false', 'false','Must be at least 25 years of age with a high school diploma or GED. Must have 1 year of experience driving and 100,000 miles driving a Semi','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '1', 'Store Manager', 'Energetic personality with a drive to see people perform to their highest potential. Use your personable skills to lead a team of diverse employees to ensure our customers leave happy and ready to return. Establish employee work schedules and hire when needed', '15.50', 'Full-time', 'Permanent', '2nd', 'East', 'true', 'true', 'true', 'true','high school diploma required for management roles. Associates degree preferred','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '4', 'Dispatcher', 'In an office setting answer phones and communicate via CB radio and cell phones. Will communicate with delivery drivers and consumers on a daily bases. Extra hours may be required and mandatory overtime occurs', '21.20', 'Part-time', 'Temporary', '2nd', 'Southwest', 'true', 'true', 'false', 'true','Customer Service experience a plus','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '1', 'Hospitality Ambassador', 'We are looking for some high energy. Your primary goal is to greet customers as they enter the resurant, and guide them to the Kiosks for order placement. 
 Train and prepare other restaurants for the launch of new Technology. ', '13.50', 'Part-time', 'Permanent', '2nd', 'East', 'true', 'true', 'true','true',' If you have experience in a hospitality environment, have a positive attitude, and enjoy working with the public, we would like to hear from you! ','true');


INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '1', 'Maintenance Person', ' McDonalds company-owned and independent Owner-Operator restaurants are staffed by great people, and right now were looking for more of them. 
  People with lots to offer. People like you. If interested (and we sure hope you are), lets get together.', '12.50', 'Full-time', 'Temp-to-Hire', '1st', 'Southwest', 'true', 'true', 'true','true','','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '2', 'Power Equipment Operator', 'Loads and unloads cartons/merchandise to and from delivery vehicles, conveyor systems, etc. Lifts, carries, pushes and pulls packages on a continuous and repetitive basis. Opportunity to be trained/licensed to operate power equipment ', '15.00', 'Full-time', 'Permanent', '2nd', 'North', 'true', 'true', 'true', 'false','No education required.  Entry level position. Good written and verbal communication skills. 
 Position involves regular walking, standing, hearing, and talking, stooping, kneeling, or crouching. Must be able to lift 50lbs on a repetitive basis. ','true');

INSERT INTO position (position_id, employer_id, job_title, job_description, hourly_rate, hourly_type, hire_type, shift, area_of_city, health_benefits, retirement_benefits, education_benefits, second_chance_employer, other_comments, displayed)
  VALUES (NEXTVAL('position_position_id_seq'), '3', 'Warehouse/Shopper Team Member', 'Work inside an Amazon warehouse, selecting, packing and shipping customer orders. If you like a fast-paced, physical position that gets you up and moving then come help bring orders to life. ', '16.50', 'Part-time', 'Seasonal', '3rd', 'Northwest', 'true', 'true', 'true', 'true','High school diploma or equivalent. Must be 18 years or older. May be required to lift up to 40 pounds','true');

--Insert users into Database

INSERT INTO app_user (user_id, user_name, password, role, salt)
  VALUES (NEXTVAL('app_user_user_id_seq'), 'EmpowerBus', '2gpnDPgIc59FqdYvQTU65g==', 'admin','+IR2vYX+JXxe8y8QCud0YW4Z5XalnzLGxf277F6GvtO5s3QS/adMXFU355vFkCxwudHqqrRV3RKeSbjW2x0Jgnd2xhLgP16s7+emxv4n15yvsKlyJSaDqHN1zCNATFolY18CSEGSlnVTwCXJjDmUFWLiRObwqu72RgL97zVpJTA=');

  INSERT INTO app_user (user_id, user_name, password, role, salt, employer_id)
   VALUES (NEXTVAL('app_user_user_id_seq'), 'Amazon2019', '0+IvrzaLiCk/HI7icWd3zA==' , 'employer', 'hRemXcizQn9rYoNUbETbvrpkh22qwECQaNzwHvsYD6km87VD5+A88mbjenaS9/X3TlKks/zgnSrVco6pMpL15S9RXulL11a5atP9MSBELbGXLrFQJA6YIz4aSZPbEu4OuYoKUgn0h4TsTaB54Rnv8NkdCE4Bsf1pIi0QjuroZx4=', '3');

  INSERT INTO app_user (user_id, user_name, password, role, salt, employer_id)
    VALUES (NEXTVAL('app_user_user_id_seq'), 'Macys2019' , 'WP7jmddFBkFXhHYzvTL31g==', 'employer', 'DAuJ6Y+j7advZDv/uHKV49xbKoah5yoBANY1Cg8BAv5jFFDgA0UhW2C3sOHr/qMTqEjcX6Fy7aHmj9VHmfg0YjYtOI1tQaDfuNZVDBuIdyRwABDk/R3PYR+RGl1EXVX8Ox+kun0rIYVNOKzGh4jVFI7Yayeo11eaKwGg+BepO2U=', '2');

COMMIT;
