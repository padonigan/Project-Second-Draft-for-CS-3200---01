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
GO

SELECT * FROM [NonReligious];

GO
CREATE VIEW [NonReligious] AS 
SELECT FamilyID 
FROM Religion
WHERE ReligiousChoice = 'n';
GO

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