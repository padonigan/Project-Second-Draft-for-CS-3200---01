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

/*When I went to insert the information into the Volunteers and FamilyAssignments 
table after creating the EagleScout database I got errors which prevented me from doing it.
Although it didn't work the second time around I have screenshots within my word 
document showing that I did it the first time around.*/
INSERT INTO Volunteers(VolunteerID, FirstName, LastName, PhoneNumber, Email)
VALUES  
    (1, 'Susan', 'Monroe', 8319187183, 'susan@yahoo.com'),
    (2, 'Sylvia', 'Nichols', 2044206841, 'sylvia@yahoo.com'),
    (3, 'Ashley', 'Day', 9664665026, 'ashley@gmail.com'),
    (4, 'Lisa', 'Boyd', 3234084458, 'lisa@gmail.com'),
    (5, 'Stephanie', 'Sims', 6423926850, 'steph@hotmail.com'),
    (6, 'Donna', 'Sherman', 9214309215, 'don@gmail.com'),
    (7, 'Kimberly', 'Reid', 9645468009, 'kim@yahoo.com'),
    (8, 'Willie', 'Osborne', 3896316267, 'willie@gmail.com'),
    (9, 'Lisa', 'Gray', 7285634453, 'lisa@outlook.com'),
    (10, 'Nicholas', 'Harrington', 8917340418, 'stnick@yahoo.com');
SELECT * FROM Volunteers;



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

