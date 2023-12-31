-- To make sure there doesnot exist a duplicate database
drop database if exists business_directory;

-- To create a databse business_directory
create database business_directory;

-- To use the database business_directory
use business_directory;

-- Table to store business categories
CREATE TABLE CATEGORY(
	category_id INT,
    category_name VARCHAR(50),
    category_description VARCHAR(255),
    PRIMARY KEY(category_id)
);

-- Table to store business subcategories with reference to the CATEGORY table
CREATE TABLE SUBCATEGORY(
	subcategory_id INT,
    subcategory_name VARCHAR(50),
    subcategory_description VARCHAR(255),
    category_id INT,
    PRIMARY KEY(subcategory_id),
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id)
);

-- Table to store countries
CREATE TABLE COUNTRY(
	country_id INT,
    country_name VARCHAR(100),
    country_description VARCHAR(255),
    PRIMARY KEY(country_id)
);

-- Table to store states with reference to the COUNTRY table
CREATE TABLE STATES(
	state_id INT,
    state_name VARCHAR(100),
    state_description VARCHAR(255),
    country_id INT,
    PRIMARY KEY(state_id),
    FOREIGN KEY(country_id) REFERENCES COUNTRY(country_id)
);

-- Table to store cities with references to COUNTRY and STATES tables
CREATE TABLE CITY(
	city_id INT,
    city_name VARCHAR(100),
    city_description VARCHAR(255),
    country_id INT,
    state_id INT,
    PRIMARY KEY(city_id),
    FOREIGN KEY(country_id) REFERENCES COUNTRY(country_id),
    FOREIGN KEY(state_id) REFERENCES STATES(state_id)
);

-- Table to store business with references to CATEGORY, SUBCATEGORY AND CITY tables
CREATE TABLE BUSINESS(
    business_id	INT,
    business_name VARCHAR(100),
    owner_id INT,
    category_id INT,
    subcategory_id INT,
    city_id INT,
    address VARCHAR(255),
    phone VARCHAR(50),
    business_email VARCHAR(100),
    location_lat VARCHAR(50),
    location_long VARCHAR(50),
    banner_image BLOB,
    PRIMARY KEY(business_id),
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
    FOREIGN KEY(subcategory_id) REFERENCES SUBCATEGORY(subcategory_id),
    FOREIGN KEY(city_id) REFERENCES CITY(city_id)
);

-- Table to store business owners data with reference to BUSINESS table
CREATE TABLE OWNERS(
	owner_id INT,
    business_id	INT,
    owner_name VARCHAR(100),
    owner_email VARCHAR(100),
    PRIMARY KEY(owner_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);

-- Altering the BUSINESS table to add Foreign key constraint referencing OWNERS table
ALTER TABLE BUSINESS
ADD FOREIGN KEY(owner_id) REFERENCES OWNERS(owner_id);

-- Table to store feedback for businesses with reference to BUSINESS table
CREATE TABLE FEEDBACK(
	feedback_id INT,
    business_id	INT,
    rating INT,
    reviews VARCHAR(255),
    PRIMARY KEY(feedback_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);

-- Table to store offers for businesses with reference to BUSINESS table
CREATE TABLE OFFERS(
	offer_id INT,
    business_id	INT,
    offer_name VARCHAR(100),
    offer_detail VARCHAR(255),
    offer_start_time DATETIME,
    offer_end_time DATETIME,
    is_Active BOOLEAN,
    PRIMARY KEY(offer_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);

DESCRIBE CATEGORY;
DESCRIBE SUBCATEGORY;
DESCRIBE COUNTRY;
DESCRIBE STATES;
DESCRIBE CITY;
DESCRIBE BUSINESS;
DESCRIBE OWNERS;
DESCRIBE FEEDBACK;
DESCRIBE OFFERS;
