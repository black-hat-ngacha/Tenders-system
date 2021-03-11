CREATE TABLE ADMINISTRATOR(
	ADMIN_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ADMIN_FNAME varchar(20),
	ADMIN_LNAME varchar(20),
	ADMIN_EMAIL TEXT,
	ADMIN_MOBILE varchar(20)
);


CREATE TABLE BIDDER(
	BIDDER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	BIDDER_FNAME varchar(20),
	BIDDER_LNAME varchar(20),
	BIDDER_EMAIL TEXT,
	BIDDER_PHONE_NO varchar(20),
	BIDDER_ADDRESS TEXT
);


CREATE TABLE LOGIN(
	LOGIN_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	LOGIN_EMAIL TEXT,
	LOGIN_PASSWORD TEXT,
	LOGIN_RANK TEXT,
	LOGIN_BIDDER_ID INT, FOREIGN KEY (LOGIN_BIDDER_ID) REFERENCES BIDDER(BIDDER_ID),
	LOGIN_ADMIN_ID INT, FOREIGN KEY (LOGIN_ADMIN_ID) REFERENCES ADMINISTRATOR(ADMIN_ID)
);


CREATE TABLE TENDER(
	TENDER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	TENDER_NAME TEXT,
	TENDER_NUMBER varchar(20),
	TENDER_FILE TEXT,
	TENDER_DESC varchar(2500),
	TENDER_DATE DATE
);


CREATE TABLE BIDDING(
	BIDDING_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	BIDDING_TOTAL_COST INT,
	BIDDING_DESC varchar(250),
	BIDDING_TENDER_ID INT,
	FOREIGN KEY (BIDDING_TENDER_ID) REFERENCES TENDER(TENDER_ID),
	BIDDING_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	BIDDING_BIDDER_ID INT, 
	FOREIGN KEY (BIDDING_BIDDER_ID) REFERENCES BIDDER(BIDDER_ID)
);


CREATE TABLE ACCEPTED_BID(
	ACCEPTED_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	ACCEPTED_BIDDING_ID INT NOT NULL,
	FOREIGN KEY (ACCEPTED_BIDDING_ID) REFERENCES BIDDING(BIDDING_ID),
	ACCEPTED_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE PAYMENTS(
	PAYMENT_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	PAYMENT_AMOUNT INT ,
	PAYMENT_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PAYMENT_REF varchar(20),
	PAYMENT_MODE TEXT,
	PAYMENT_ACCEPTED_ID INT NOT NULL,
	FOREIGN KEY (PAYMENT_ACCEPTED_ID) REFERENCES ACCEPTED_BID(ACCEPTED_ID)
);


