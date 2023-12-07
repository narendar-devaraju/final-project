drop database if exists local_business;
create database local_business;

use local_business;
CREATE TABLE CATEGORY(
	category_id INT,
    category_name VARCHAR(50),
    category_description VARCHAR(255),
    PRIMARY KEY(category_id)
);

CREATE TABLE SUBCATEGORY(
	subcategory_id INT,
    subcategory_name VARCHAR(50),
    subcategory_description VARCHAR(255),
    category_id INT,
    PRIMARY KEY(subcategory_id),
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id)
);

CREATE TABLE COUNTRY(
	country_id INT,
    country_name VARCHAR(100),
    country_description VARCHAR(255),
    PRIMARY KEY(country_id)
);

CREATE TABLE STATES(
	state_id INT,
    state_name VARCHAR(100),
    state_description VARCHAR(255),
    country_id INT,
    PRIMARY KEY(state_id),
    FOREIGN KEY(country_id) REFERENCES COUNTRY(country_id)
);

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
    lat VARCHAR(50),
    _long VARCHAR(50),
    banner_image BLOB,
    PRIMARY KEY(business_id),
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
    FOREIGN KEY(subcategory_id) REFERENCES SUBCATEGORY(subcategory_id),
    FOREIGN KEY(city_id) REFERENCES CITY(city_id)
);

CREATE TABLE OWNERS(
	owner_id INT,
    business_id	INT,
    owner_name VARCHAR(100),
    owner_email VARCHAR(100),
    PRIMARY KEY(owner_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);

ALTER TABLE BUSINESS
ADD FOREIGN KEY(owner_id) REFERENCES OWNERS(owner_id);

CREATE TABLE FEEDBACK(
	feedback_id INT,
    business_id	INT,
    rating INT,
    reviews VARCHAR(255),
    PRIMARY KEY(feedback_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);

CREATE TABLE OFFERS(
	offer_id INT,
    business_id	INT,
    offer_name VARCHAR(100),
    offer_detail VARCHAR(255),
    offer_start_time DATETIME,
    offer_end_time DATETIME,
    isActive BOOLEAN,
    PRIMARY KEY(offer_id),
    FOREIGN KEY(business_id) REFERENCES BUSINESS(business_id)
);