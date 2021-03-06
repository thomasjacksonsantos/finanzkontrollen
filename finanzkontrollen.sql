-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema finanzkontrolle
-- -----------------------------------------------------
DROP database `finanzkontrollen`;
CREATE SCHEMA IF NOT EXISTS `finanzkontrollen` DEFAULT CHARACTER SET utf8 ;
USE `finanzkontrollen` ;

CREATE TABLE user (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Password VARCHAR(100) NOT NULL,
	PRIMARY KEY (Id),
	UNIQUE IDX_user_email_unique (Email ASC)
);

CREATE TABLE tag (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE operation_type (
	Id INT(11) NOT NULL,
	Name VARCHAR(25) NOT NULL,
	PRIMARY KEY (Id)	
);

CREATE TABLE account (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(25) NOT NULL,
	PRIMARY KEY (Id)
);

CREATE TABLE balance (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	Date DATETIME NOT NULL,
	Ammount DECIMAL(10, 5) NOT NULL,
	AccountId INT(11) NOT NULL,
	UpToDate BIT(1) NOT NULL,
	PRIMARY KEY (Id),
	CONSTRAINT FK_balance_account_id FOREIGN KEY (AccountId) REFERENCES account (Id)
);

CREATE TABLE operation (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	Name VARCHAR(100) NOT NULL,
	Description VARCHAR(200),
	PayDate DATETIME NOT NULL,
	TypeId INT(11) NOT NULL,
	Ammount DECIMAL(10, 5) NOT NULL,
	AccountId INT(11),
	PRIMARY KEY (Id),
	CONSTRAINT FK_operation_type_id FOREIGN KEY (TypeId) REFERENCES operation_type (Id),
	CONSTRAINT FK_account_id FOREIGN KEY (AccountId) REFERENCES account(id)
);

CREATE TABLE compound_operation (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	OperationId INT(11) NOT NULL,
	Name VARCHAR(100) NOT NULL,
	Description VARCHAR(200),
	ReferenceDate DATETIME NOT NULL,
	PayDate DATETIME NOT NULL,
	TypeId INT(11) NOT NULL,
	Ammount DECIMAL(10, 5) NOT NULL,
	PRIMARY KEY (Id),
	CONSTRAINT FK_compound_operation_id FOREIGN KEY (OperationId) REFERENCES operation (Id)	,
	CONSTRAINT FK_compound_operation_type_id FOREIGN KEY (TypeId) REFERENCES operation_type (Id)	
);

CREATE TABLE operation_tag (
	Id INT(11) NOT NULL AUTO_INCREMENT,
	TagId INT(11) NOT NULL,
	OperationId INT(11) NOT NULL,
	PRIMARY KEY (Id),
	UNIQUE IDX_operation_tab_unique (TagId ASC, OperationId ASC),
	CONSTRAINT FK_operation_tag_tag_id FOREIGN KEY (TagId) REFERENCES tag (Id),
	CONSTRAINT FK_operation_tag_operation_id FOREIGN KEY (OperationId) REFERENCES operation (Id)
);