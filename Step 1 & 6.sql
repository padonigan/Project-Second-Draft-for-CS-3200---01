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

CREATE LOGIN people WITH PASSWORD = 'Password';
CREATE USER people FOR LOGIN people;

CREATE ROLE persons;

GRANT UPDATE, INSERT
ON people 
TO persons;

ALTER ROLE persons ADD MEMBER people;



