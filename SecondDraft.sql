CREATE DATABASE EagleScout;

CREATE TABLE Families 
(FamilyID int PRIMARY KEY NOT NULL,
Quantity int NOT NULL,
FirstNames VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL);

CREATE TABLE Religion
(ReligionID int PRIMARY KEY NOT NULL,
FamilyID int FOREIGN KEY REFERENCES Families(FamilyID),
ReligiousChoice CHAR(1) NOT NULL,
ReligionName VARCHAR(255) NOT NULL);

CREATE TABLE Residence
(ResidenceID int PRIMARY KEY NOT NULL,
FamilyID int FOREIGN KEY REFERENCES Families(FamilyID),
ResidenceType VARCHAR(255) not null,
Address varchar(255) not null, 
State varchar(255) not null,
City varchar(255) not null);

CREATE TABLE Donations
(DonationID int PRIMARY KEY not null, 
Money int not null,
Furniture varchar(255) not null,
KitchenSupplies varchar(255) not null);

CREATE TABLE FamilyDonations
(DonationID int Foreign Key references Donations(DonationID) not null,
FamilyID int Foreign Key references Families(FamilyID) not null,
DonationType varchar(255) not null, 
Amount varchar(255) not null);

DROP TABLE FamilyDonations;

CREATE TABLE Volunteers
(VolunteerID int Primary Key not null,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Address varchar(255) not null,
PhoneNumber int not null,
Email varchar(255) not null);

CREATE TABLE FamilyAssignments
(FamilyID int Foreign Key references Families(FamilyID) not null, 
VolunteerID int Foreign Key references Volunteers(VolunteerID) not null,
Address varchar(255) not null,
FamilyName varchar(255) not null);

CREATE TABLE Countries
(CountryID int Primary Key not null, 
FamilyID int Foreign Key References Families(FamilyID) not null,
CountryName varchar(255) not null,
Region varchar(255) not null);

CREATE TABLE Organization
(OrganizationID int Primary Key not null, 
OrganizationName varchar(255) not null,
Address varchar(255) not null);

CREATE TABLE Employees
(EmployeeID int Primary Key not null,
FirstName varchar(255) not null,
LastName varchar(255) not null,
Address varchar(255) not null,
PhoneNumber varchar(255) not null,
Email varchar(255) not null,
Position varchar(255) not null);

ALTER TABLE Families
ADD ReligionID int;

ALTER TABLE Families
ADD Foreign Key (ReligionID) REFERENCES Religion(ReligionID);

ALTER TABLE Families 
ADD ResidenceID int;

ALTER TABLE Families
ADD Foreign Key (ResidenceID) REFERENCES Residence(ResidenceID);

ALTER TABLE Families
ADD CountryID int; 

ALTER TABLE Families
ADD Foreign Key (CountryID) References Countries(CountryID);

ALTER TABLE Families
ADD OrganizationID int;

ALTER TABLE Families
ADD Foreign Key (OrganizationID) References Organization(OrganizationID);

ALTER TABLE Organization
ADD FamilyID int;

ALTER TABLE Organization
ADD Foreign Key (FamilyID) References Families(FamilyID);

ALTER TABLE Employees
ADD OrganizationID int;

ALTER TABLE Employees
ADD Foreign Key (OrganizationID) References Organization(OrganizationID);

INSERT INTO Families (FamilyID, Quantity, FirstNames, LastName)
Values (1, 2, 'Bob and Sheryl', 'Goldman');

INSERT INTO Families (FamilyID, Quantity, FirstNames, LastName)
Values 
    (2, 4, 'Jon, Megan, Lily, Scott', 'Chickenwing'),
    (3, 3, 'Lee, Sally, Cooper, Jared', 'Fillman'),
    (4, 6, 'Rob, Jamie, Parker, Lexi, Dyllan, Aliyah', 'Donigan'),
    (5, 5, 'Steven, Rita, Aaron, Jeremy, Jennifer', 'Russell'),
    (6, 7, 'Elizabeth, Stephen, Kathleen, Susan, Sean, Joseph, Kelly', 'Aguirre'),
    (7, 2, 'Aaron, Felicia', 'Holt'),
    (8, 3, 'William, Kristen, Faith', 'Garcia'),
    (9, 6, 'Barbara, Bruce, Batman, Robin, Joker, Alfred', 'Wayne'),
    (10, 4, 'Kara, James, Jesse, Eric', 'Singh');

INSERT INTO Religion(ReligionID, FamilyID, ReligiousChoice, ReligionName)
VALUES
    (1, 1, 'y', 'LDS'),
    (2, 2, 'n', 'none'),
    (3, 3, 'n', 'none'),
    (4, 4, 'y', 'LDS'),
    (5, 5, 'y', 'Protestant'),
    (6, 6, 'y', 'Catholic'),
    (7, 7, 'n', 'none'),
    (8, 8, 'y', 'Hinduism'),
    (9, 9, 'y', 'Judaism'),
    (10, 10, 'n', 'none');
SELECT * FROM Religion;

INSERT INTO Residence(ResidenceID, FamilyID, ResidenceType, Address, State, City)
VALUES
    (1, 1, 'Condo', '270 Rose Dr.', 'MD', 'Annapolis'),
    (2, 2, 'House', '72 W Shipley Court', 'CT', 'Hamden'),
    (3, 3, 'Apartment', '9117 West Westport Court', 'CT', 'Stamford'),
    (4, 4, 'Apartment', '56 Central St.', 'NJ', 'Kearny'),
    (5, 5, 'Condo', '316 South Pacific Dr.', 'IL', 'Berwyn'),
    (6, 6, 'House', '9111 Ketch Harbour Drive', 'NY', 'Clifton Park'),
    (7, 7, 'Condo', '7169 Greenrose St.', 'MA', 'Jamaica Plain'),
    (8, 8, 'House', '692 Wild Horse St.', 'NY', 'New City'),
    (9, 9, 'Apartment', '8913 Academy St.', 'NY', 'Middle Village'),
    (10, 10, 'Condo', '189 Chapel Road', 'ND', 'Bismark');
SELECT * FROM Residence;

INSERT INTO Donations(DonationID, Money, Furniture, KitchenSupplies)
VALUES
    (1, 500, 'none', 'yes'),
    (2, 0, 'none', 'yes'),
    (3, 0, 'yes', 'none'),
    (4, 1000, 'none', 'none'),
    (5, 600, 'yes', 'none'),
    (6, 200, 'yes', 'yes'),
    (7, 600, 'none', 'none'),
    (8, 100, 'none', 'none'),
    (9, 2000, 'yes', 'yes'),
    (10, 250, 'none', 'yes');
SELECT * FROM Donations;

ALTER TABLE FamilyDonations
ADD DonationObject varchar(255);

ALTER TABLE FamilyDonations
ADD Amount varchar(255);

INSERT INTO FamilyDonations(DonationID, FamilyID, DonationType, Amount)
VALUES
    (1, 1, 'Money and kitchen supplies', '$500 and 3 spatulas'),
    (2, 2, 'Kitchen supplies', 'silverware set'),
    (3, 3, 'Furniture', '1 couch'),
    (4, 4, 'Money', '$1000'),
    (5, 5, 'Money and furniture', '$600 and 2 beds'),
    (6, 6, 'Money, furniture, and kitchen supplies', '$200, 3 kitchen stools, 1 knife set'),
    (7, 7, 'Money', '$600'),
    (8, 8, 'Money', '$100'),
    (9, 9, 'Money, furnitrue, kitchen supplies', '$2000, 1 couch, 6 plates'),
    (10, 10, 'Money, kitchen supplies', '$250, 1 pot and 1 pan');
SELECT * FROM FamilyDonations;

INSERT INTO Organization(OrganizationID, OrganizationName, Address, FamilyID)
VALUES
    (1,'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 1),
    (2, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 2),
    (3, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 3),
    (4, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 4),
    (5, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 5),
    (6, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 6),
    (7, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 7),
    (8, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 8),
    (9, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 9),
    (10, 'Saving Grace', '4 Hill Field Lane De Pere, WI 54115', 10);
SELECT * FROM Organization;

ALTER TABLE Countries
DROP COLUMN Region;

INSERT INTO Countries(CountryID, FamilyID, CountryName)
VALUES
    (1, 1, 'China'),
    (2, 2, 'Ghana'),
    (3, 3, 'India'),
    (4, 4, 'United States'),
    (5, 5, 'Indonesia'),
    (6, 6, 'Pakistan'),
    (7, 7, 'Brazil'),
    (8, 8, 'Russia'),
    (9, 9, 'Mexico'),
    (10, 10, 'Japan');
SELECT * FROM Countries;

ALTER TABLE Volunteers
DROP COLUMN Address;

INSERT INTO Volunteers(VolunteerID, FirstName, LastName, PhoneNumber, Email)
VALUES  
    (1, 'Susan', 'Monroe', '8319187183', 'susan@yahoo.com'),
    (2, 'Sylvia', 'Nichols', '2044206841', 'sylvia@yahoo.com'),
    (3, 'Ashley', 'Day', '9664665026', 'ashley@gmail.com'),
    (4, 'Lisa', 'Boyd', '3234084458', 'lisa@gmail.com'),
    (5, 'Stephanie', 'Sims', '6423926850', 'steph@hotmail.com'),
    (6, 'Donna', 'Sherman', '9214309215', 'don@gmail.com'),
    (7, 'Kimberly', 'Reid', '9645468009', 'kim@yahoo.com'),
    (8, 'Willie', 'Osborne', '389-631-6267', 'willie@gmail.com'),
    (9, 'Lisa', 'Gray', '728-563-4453', 'lisa@outlook.com'),
    (10, 'Nicholas', 'Harrington', '891-734-0418', 'stnick@yahoo.com');
SELECT * FROM Volunteers;

ALTER TABLE Volunteers
DROP COLUMN PhoneNumber;

ALTER TABLE Volunteers
ADD PhoneNumber varchar(255);

INSERT INTO Volunteers (PhoneNumber)
VALUES
    ('831-918-7183'),
    ('204-420-6841'),
    ('966-466-5026'),
    ('323-408-4458'),
    ('642-392-6850'),
    ('921-430-9215'),
    ('964-546-8009'),
    ('389-631-6267'),
    ('728-563-4453'),
    ('891-734-0418');

SELECT * FROM Families;

ALTER TABLE FamilyAssignments
DROP COLUMN Address;

INSERT INTO FamilyAssignments(FamilyID, VolunteerID, FamilyName)
VALUES
    (1, 1, 'Goldman'),
    (2, 2, 'Chickenwing'),
    (3, 3, 'Fillman'),
    (4, 4, 'Donigan'),
    (5, 5, 'Russell'),
    (6, 6, 'Aguirre'),
    (7, 7, 'Holt'),
    (8, 8, 'Garcia'),
    (9, 9, 'Wayne'),
    (10, 10, 'Singh');
SELECT * FROM FamilyAssignments;

SELECT Address + ' is a ' + ResidenceType
FROM Residence
WHERE
    (ResidenceType = 'Apartment');

SELECT 'This family has ' + CAST(Quantity AS varchar(100)) + ' people in the family.'
FROM Families
WHERE
    (Quantity > 4);

Select CAST(Money AS varchar(100)) + ', ' + Furniture + ', ' + KitchenSupplies AS TotalDonations
FROM Donations
WHERE Money IN (
    SELECT Money
    FROM Donations
    WHERE Money > 200);

SELECT OrganizationName, Address
FROM Organization
WHERE FamilyID IN (
    Select FamilyID
    FROM Organization
    WHERE FamilyID = 1);

SELECT ReligiousChoice, 
    CASE 
        WHEN ReligiousChoice = 'y' THEN 'Religious'
    ELSE 'Non-religious' END AS ReligiousAffiliation
FROM Religion;

SELECT LastName, FamilyName 
From Families A INNER JOIN FamilyAssignments B
ON A.FamilyID = B.FamilyID;

SELECT FirstName, LastName, FamilyName
FROM Volunteers A LEFT JOIN FamilyAssignments B
    ON A.VolunteerID = B.VolunteerID;

SELECT ISNULL(Money, '0') AS MonetaryDonations,
       ISNULL(Furniture, 'none') AS FurnitureNeeds,
       ISNULL(KitchenSupplies, 'empty') AS KitchenNeeds
FROM Donations;

SELECT 'The ' + LastName + ' has ' + CAST(Quantity AS varchar(100)) + ' members of their family.'
FROM Families;

SELECT f.LastName AS FamilyName, d.DonationType + ': ' + d.Amount
FROM Families AS f
LEFT JOIN FamilyDonations AS d 
    ON f.FamilyID = d.FamilyID;

SELECT * FROM Families;

SELECT * FROM Religion;

DELETE FROM Religion WHERE FamilyID = 1;

UPDATE Religion 
SET ReligiousChoice = 'y', ReligionName = 'LDS'
WHERE FamilyID = 2;

SELECT * FROM Families;

ALTER TABLE Families
ADD ReligiousPersecution varchar(1);

SELECT * FROM Families;

ALTER TABLE Families
ADD DonationID int;

ALTER TABLE Families
ADD Foreign Key (DonationID) REFERENCES Donations(DonationID);

ALTER Table Families
ADD VolunteerID int;

ALTER TABLE Families
ADD Foreign Key (VolunteerID) REFERENCES Volunteers(VolunteerID);

UPDATE Families
SET ReligionID = 10, ResidenceID = 10, CountryID = 10, OrganizationID = 10, DonationID = 10, VolunteerID = 10
WHERE FamilyID = 10;

SELECT * FROM Religion;


SELECT * FROM [ReligiousFamilies];
GO
CREATE VIEW [ReligiousFamilies] AS
SELECT FamilyID 
FROM Religion 
WHERE ReligiousChoice = 'y';

SELECT * FROM [NonReligious];
GO
CREATE VIEW [NonReligious] AS 
SELECT FamilyID 
FROM Religion
WHERE ReligiousChoice = 'n';

SELECT * FROM Residence;

SELECT * FROM [Apartment];
GO 
CREATE VIEW [Apartment] AS 
SELECT FamilyID
FROM Residence
WHERE ResidenceType = 'Apartment';

GO
CREATE PROCEDURE SelectAllFamilies AS 
SELECT * FROM Families
GO;

EXEC SelectAllFamilies;

GO
CREATE PROCEDURE AllCountries AS
SELECT * FROM Countries
GO;

EXEC AllCountries;

GO
CREATE PROCEDURE AllResidences AS
SELECT * FROM Residence
GO;

EXEC AllResidences;

GO
CREATE TRIGGER Family
ON Families
AFTER INSERT, UPDATE
AS 
    UPDATE Families
    SET ReligiousPersecution = 'y'
    WHERE FamilyID IN (SELECT FamilyID FROM Inserted);

GO
CREATE TRIGGER Living
ON Residence
AFTER INSERT, UPDATE
AS 
    UPDATE Residence
    SET ResidenceType = 'none'
    WHERE ResidenceID IN (SELECT ResidenceID FROM Inserted);

GO
CREATE TRIGGER Country 
ON Countries
AFTER INSERT, UPDATE
AS 
    UPDATE Countries
    SET CountryName = 'none'
    WHERE CountryID IN (SELECT CountryID FROM Inserted);

SELECT * FROM Families;

